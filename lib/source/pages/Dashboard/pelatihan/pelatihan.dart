part of '../../index.dart';

class PelatihanScreen extends StatefulWidget {
  const PelatihanScreen({super.key});

  @override
  State<PelatihanScreen> createState() => _PelatihanScreenState();
}

class _PelatihanScreenState extends State<PelatihanScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PelatihanCubit>(context).getPelatihan(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pelatihan"),
      ),
      body: BlocBuilder<PelatihanCubit, PelatihanState>(
        builder: (context, state) {
          if (state is PelatihanLoading) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
              child: Column(
                children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
              ),
            );
          }
          if (state is PelatihanFailed) {
            return Container();
          }
          if (state is PelatihanLoaded == false) {
            return Container();
          }
          var data = (state as PelatihanLoaded).modelPelatihan;
          var idPegawai = (state).idPegawai;
          List datafilter = data!.dataPelatihan!.where((e) => e.idPegawai == idPegawai).toList();
          if (datafilter.isEmpty) {
            return Center(child: Text("Data Kosong"));
          }
          return Container(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                BlocProvider.of<PelatihanCubit>(context).getPelatihan(context);
              },
              child: ListView.builder(
                itemCount: datafilter.length,
                itemBuilder: (BuildContext context, int index) {
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
                              Text(a.pelatihan!.namaPelatihan!, style: TextStyle(fontFamily: 'MontserratSemiBold')),
                              Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                                  child: Text(a.status!, style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14, color: Colors.white))),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text("${a.pegawai!.nama!}", style: const TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 15)),
                          Table(
                            border: TableBorder.all(style: BorderStyle.none),
                            columnWidths: const <int, TableColumnWidth>{
                              0: FixedColumnWidth(100),
                              1: FixedColumnWidth(15),
                            },
                            children: [
                              const TableRow(
                                children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                              ),
                              TableRow(
                                children: [
                                  const Text('Jenis', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                  Text("${a.pelatihan!.jenispelatihan!.namaJenis}", style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                ],
                              ),
                            ],
                          ),
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
