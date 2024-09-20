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
        title: Text("Izin", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, createIzinScreen);
          },
          child: Icon(
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
          if (state is GetIzinLoaded == false) {
            return Container();
          }
          var data = (state as GetIzinLoaded).model!;
          var idPegawai = (state as GetIzinLoaded).idPegawai;
          List datafilter = data!.data!.where((e) => e.idPegawai == idPegawai).toList();
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
                      decoration: BoxDecoration(
                        color: whiteCustom2,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tanggal izin", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                              Text(
                                formatDate(a.tanggal!),
                                style: TextStyle(fontFamily: 'JakartaSansMedium', fontSize: 16, color: Colors.blue[300]),
                              )
                            ],
                          ),
                          const SizedBox(height: 8),
                          AutoSizeText("Alasan", maxLines: 2, style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 14)),
                          const SizedBox(height: 8),
                          CustomField(readOnly: true, initialValue: a.alasan, maxline: 2),
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
