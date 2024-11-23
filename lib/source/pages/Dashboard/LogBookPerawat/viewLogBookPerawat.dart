part of '../../index.dart';

class LogBookPerawatScreen extends StatefulWidget {
  const LogBookPerawatScreen({super.key});

  @override
  State<LogBookPerawatScreen> createState() => _LogBookPerawatScreenState();
}

class _LogBookPerawatScreenState extends State<LogBookPerawatScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetLogBookPerawatCubit>(context).getLogBookPerawat(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Log Book Perawat", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, createlogbookPerawatScreen);
          },
          child: const Icon(Icons.add, color: Colors.white)),
      body: BlocBuilder<GetLogBookPerawatCubit, GetLogBookPerawatState>(
        builder: (context, state) {
          if (state is GetLogBookPerawatLoading) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
              child: Column(
                children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
              ),
            );
          }
          if (state is GetLogBookPerawatFailed) {
            var data = state.json;
            return Center(child: Text(data['message']));
          }
          if (state is GetLogBookPerawatLoaded == false) {
            return Container();
          }
          var data = (state as GetLogBookPerawatLoaded).model;

          return Container(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                BlocProvider.of<GetLogBookPerawatCubit>(context).getLogBookPerawat(context);
              },
              child: ListView.builder(
                itemCount: data!.dataLogbook!.length,
                itemBuilder: (BuildContext context, int index) {
                  var a = data!.dataLogbook![index];
                  return Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(color: hijauDark, borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      margin: const EdgeInsets.only(left: 12),
                      padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
                      decoration: const BoxDecoration(
                        color: whiteCustom2,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Tanggal Pembuatan", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                              Text(formatDate(a.tanggal!), style: const TextStyle(fontFamily: 'MontserratSemiBold')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Table(
                            border: TableBorder.all(style: BorderStyle.none),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(100),
                              1: FixedColumnWidth(15),
                            },
                            children: [
                              TableRow(
                                children: [
                                  const Text('Karyawan', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text(a.pegawai!.nama!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                              TableRow(
                                children: [
                                  const Text('Log Book', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text(a.mlogbook!.namaLog!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                              TableRow(
                                children: [
                                  const Text('Jumlah', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text(a.jumlah!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                              TableRow(
                                children: [
                                  const Text('Kategori', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text(a.mlogbook!.kategori!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: CustomButton2(
                              onTap: () {
                                Navigator.pushNamed(context, updatelogbookPerawatScreen);
                                setState(() {
                                  idlogbook = a.id;
                                  mlogbook = a.idMLogbook;
                                  tanggalLogbookPerawat = a.tanggal.toString().split(' ')[0];
                                  jumlahLogBookPerawat = a.jumlah;
                                });
                              },
                              text: "Edit LogBook",
                              backgroundColor: Colors.deepPurple,
                              textStyle: const TextStyle(color: Colors.white),
                              roundedRectangleBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                          ),
                          const SizedBox(height: 4),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
