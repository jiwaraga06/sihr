part of '../../index.dart';

class DataAbsensiScreen extends StatefulWidget {
  const DataAbsensiScreen({super.key});

  @override
  State<DataAbsensiScreen> createState() => _DataAbsensiScreenState();
}

class _DataAbsensiScreenState extends State<DataAbsensiScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetAbsensiCubit>(context).getAbsensi(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Absensi", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      body: BlocBuilder<GetAbsensiCubit, GetAbsensiState>(
        builder: (context, state) {
          if (state is GetAbsensiLoading) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
              child: Column(
                children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
              ),
            );
          }
          if (state is GetAbsensiLoaded == false) {
            return Container();
          }
          var data = (state as GetAbsensiLoaded).model;
          var idPegawai = (state as GetAbsensiLoaded).idPegawai;
          List datafilter = data!.data!.where((e) => e.idPegawai == idPegawai).toList();
          return Container(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                BlocProvider.of<GetAbsensiCubit>(context).getAbsensi(context);
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
                        decoration: BoxDecoration(
                          color: whiteCustom2,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            AutoSizeText(formatDate(a.tanggal!), maxLines: 1, style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 16),),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Text(a.idPegawai.toString()),
                                Text("Jam Aktifitas", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                                Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(8)),
                                    child: Text(a.status!, style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 14, color: Colors.white))),
                              ],
                            ),
                            Row(
                              children: [
                                AutoSizeText(a.waktuMasuk!, style: TextStyle(fontFamily: 'MontserratSemiBold')),
                                Text(" - "),
                                if (a.waktuKeluar!.isNotEmpty) AutoSizeText(a.waktuKeluar!, style: TextStyle(fontFamily: 'MontserratSemiBold')),
                                if (a.waktuKeluar!.isEmpty) AutoSizeText("Belum Pulang", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                              ],
                            ),
                            const SizedBox(height: 8),
                            AutoSizeText(a.keterangan!, maxLines: 2, style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 14)),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          );
        },
      ),
    );
  }
}
