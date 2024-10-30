part of '../../index.dart';

class IzinScreen extends StatefulWidget {
  const IzinScreen({super.key});

  @override
  State<IzinScreen> createState() => _IzinScreenState();
}

class _IzinScreenState extends State<IzinScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetIzinCubit>(context).getizin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Izin", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, createIzinScreen);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: BlocBuilder<GetIzinCubit, GetIzinState>(
        builder: (context, state) {
          if (state is GetIzinLoading) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
              child: Column(
                children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
              ),
            );
          }
          if (state is GetIzinFailed) {
            return Center(child: Text("Something Wrong"));
          }
          if (state is GetIzinLoaded == false) {
            return Container();
          }
          var data = (state as GetIzinLoaded).model!;
          var idPegawai = (state).idPegawai;
          List datafilter = data.data!.where((e) => e.idPegawai == idPegawai).toList();
          if (datafilter.isEmpty) {
            return Center(child: Text("Data Kosong"));
          }
          return Container(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                BlocProvider.of<GetIzinCubit>(context).getizin(context);
              },
              child: ListView.builder(
                itemCount: datafilter.length,
                itemBuilder: (context, index) {
                  var a = datafilter[index];
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
                              const Text("Tanggal izin", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                              Text(
                                formatDate(a.tanggal!),
                                style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 16, color: Colors.blue[600]),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (a.status == 0)
                                Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(8)),
                                    child: const Text("Pending", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14, color: Colors.white))),
                              if (a.status == 1)
                                Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(color: Colors.green[600], borderRadius: BorderRadius.circular(8)),
                                    child: const Text("Disetujui", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14, color: Colors.white))),
                              if (a.status == 2)
                                Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)),
                                    child: const Text("Ditolak", style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14, color: Colors.white))),
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
                                  const Text('Jenis Izin', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text("${a.jenisIzin.namaIzin}", style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                              TableRow(
                                children: [
                                  const Text('Alasan', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text("${a.alasan}", style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                              TableRow(
                                children: [
                                  const Text('Keterangan', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text("${a.keterangan}", style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
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
