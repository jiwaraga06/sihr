part of '../../index.dart';

class LemburScreen extends StatefulWidget {
  const LemburScreen({super.key});

  @override
  State<LemburScreen> createState() => _LemburScreenState();
}

class _LemburScreenState extends State<LemburScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetLemburCubit>(context).getLembur(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Lembur", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, createLemburScreen);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: BlocBuilder<GetLemburCubit, GetLemburState>(
        builder: (context, state) {
          if (state is GetLemburLoading) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
              child: Column(
                children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
              ),
            );
          }
          if (state is GetLemburLoaded == false) {
            return Container();
          }
          var data = (state as GetLemburLoaded).model;
          var idPegawai = (state).idPegawai;
          List datafilter = data!.data!.where((e) => e.idPegawai == idPegawai).toList();
          return Container(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                BlocProvider.of<GetLemburCubit>(context).getLembur(context);
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
                              const Text("Tanggal Pengajuan", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                              Text(formatDate(a.tanggal!), style: const TextStyle(fontFamily: 'MontserratSemiBold')),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Table(
                            border: TableBorder.all(style: BorderStyle.none),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(100),
                              1: FixedColumnWidth(15),
                            },
                            children: [
                              TableRow(
                                children: [
                                  const Text('Jam Mulai', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text(a.jamMulai!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                              TableRow(
                                children: [
                                  const Text('Jam Selesai', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text(a.jamSelesai!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                              TableRow(
                                children: [
                                  const Text('Total Jam', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text(a.jumlahJam! + " jam", style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                              TableRow(
                                children: [
                                  const Text('Keterangan', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text(a.keterangan!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
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
