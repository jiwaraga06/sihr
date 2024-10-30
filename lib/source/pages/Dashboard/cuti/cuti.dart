part of '../../index.dart';

class CutiScreen extends StatefulWidget {
  const CutiScreen({super.key});

  @override
  State<CutiScreen> createState() => _CutiScreenState();
}

class _CutiScreenState extends State<CutiScreen> {
  void detailCuti() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [],
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Tutup"))
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetCutiCubit>(context).getCuti(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Cuti", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, createCutiScreen);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
      body: BlocBuilder<GetCutiCubit, GetCutiState>(
        builder: (context, state) {
          if (state is GetCutiLoading) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
              child: Column(
                children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
              ),
            );
          }
          if (state is GetCutiFailed) {
            return Center(child: Text("Something Wrong"));
          }
          if (state is GetCutiLoaded == false) {
            return Container();
          }
          var data = (state as GetCutiLoaded).model;
          var idPegawai = (state).idPegawai;
          List datafilter = data!.data!.where((e) => e.idPegawai == idPegawai).toList();
           if (datafilter.isEmpty) {
            return Center(child: Text("Data Kosong"));
          }
          return Container(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                BlocProvider.of<GetCutiCubit>(context).getCuti(context);
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
                          Row(
                            children: [
                              AutoSizeText(formatDate(a.tglMulai!), style: const TextStyle(fontFamily: 'MontserratSemiBold')),
                              const Text(" - "),
                              AutoSizeText(formatDate(a.tglSelesai!), style: const TextStyle(fontFamily: 'MontserratSemiBold')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          AutoSizeText("Jenis Cuti : " + a.jenisCuti!.namaCuti!,
                              maxLines: 1, style: const TextStyle(fontFamily: 'MontserratMedium', fontSize: 12)),
                          const SizedBox(height: 8),
                          AutoSizeText(a.keterangan!, maxLines: 2, style: const TextStyle(fontFamily: 'MontserratMedium', fontSize: 12)),
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
