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
        title: const Text("Data Absensi", style: TextStyle(fontFamily: 'JakartaSansMedium')),
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
          if (state is GetAbsensiFailed) {
            var data = state.json;
            var statusCode = state.statusCode;
            if (statusCode == 403) {
              return Center(child: Text("This user does not have access."));
            } else {
              return Center(child: Text(data['message'].toString()));
            }
          }
          if (state is GetAbsensiLoaded == false) {
            return Container();
          }
          var data = (state as GetAbsensiLoaded).model;
          var idPegawai = (state).idPegawai;
          List datafilter = data!.data!.where((e) => e.idPegawai == idPegawai).toList().reversed.toList();
          if (datafilter.isEmpty) {
            return const Center(child: Text("Data Kosong"));
          }
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
                        decoration: const BoxDecoration(
                          color: whiteCustom2,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              // if (a.)
                              Image.asset("assets/images/male.png"),
                              const SizedBox(width: 6),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(a.namaPegawai!, style: const TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 13)),
                                ],
                              )
                            ]),
                            const SizedBox(height: 6),
                            Table(
                              border: TableBorder.all(style: BorderStyle.none),
                              columnWidths: const <int, TableColumnWidth>{
                                0: FixedColumnWidth(100),
                                1: FixedColumnWidth(15),
                              },
                              children: [
                                TableRow(
                                  children: [
                                    const Text('Departemen', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    Text("${a.departement!}", style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                  ],
                                ),
                                const TableRow(
                                  children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                                ),
                                TableRow(
                                  children: [
                                    const Text('Jabatan', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    Text("${a.jabatan!}", style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                  ],
                                ),
                                const TableRow(
                                  children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                                ),
                                TableRow(
                                  children: [
                                    const Text('Jam Masuk', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    if (a.waktuMasuk!.isNotEmpty) AutoSizeText(a.waktuMasuk!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                    if (a.waktuMasuk!.isEmpty) const AutoSizeText("", style: TextStyle(fontFamily: 'JakartaSansMedium')),
                                  ],
                                ),
                                const TableRow(
                                  children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                                ),
                                TableRow(
                                  children: [
                                    const Text('Jam Pulang', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    if (a.waktuKeluar!.isNotEmpty) AutoSizeText(a.waktuKeluar!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                    if (a.waktuKeluar!.isEmpty) const AutoSizeText("Belum Pulang", style: TextStyle(fontFamily: 'JakartaSansMedium')),
                                  ],
                                ),
                                const TableRow(
                                  children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                                ),
                                TableRow(
                                  children: [
                                    const Text('Tgl Masuk', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    if (a.tanggal! != null) Text(formatDate(a.tanggal!), style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                  ],
                                ),
                                const TableRow(
                                  children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                                ),
                                TableRow(
                                  children: [
                                    const Text('Jenis', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                    Text(a.jenis!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                                  ],
                                ),
                                const TableRow(
                                  children: [SizedBox(height: 4), SizedBox(height: 4), SizedBox(height: 4)],
                                ),
                                if (a.status == 2)
                                  TableRow(
                                    children: [
                                      const Text('Status', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                      const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                      Text("Tepat Waktu", style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 12, color: Colors.blue[600])),
                                      //  Text(a.status.toString(), style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                      // if (a.status == 1)
                                      //   Text("Terlambat", style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 12, color: Colors.red[600])),
                                    ],
                                  ),
                                if (a.status == 1)
                                  TableRow(
                                    children: [
                                      const Text('Status', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                      const Text(':', style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                      // Text("Tepat Waktu", style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 12, color: Colors.blue[600])),
                                      Text("Terlambat", style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 12, color: Colors.red[600])),
                                      //  Text(a.status.toString(), style: TextStyle(fontFamily: 'JakartaSansSemiBold')),
                                      // if (a.status == 1)
                                    ],
                                  ),
                              ],
                            ),

                            const SizedBox(height: 8),
                            // AutoSizeText(a.keterangan!, maxLines: 2, style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 14)),
                            // const SizedBox(height: 12),
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
