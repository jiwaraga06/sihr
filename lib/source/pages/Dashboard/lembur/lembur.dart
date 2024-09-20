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
        title: Text("Data Lembur", style: TextStyle(fontFamily: 'JakartaSansMedium')),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, createLemburScreen);
          },
          child: Icon(
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
          var idPegawai = (state as GetLemburLoaded).idPegawai;
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
                      decoration: BoxDecoration(
                        color: whiteCustom2,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(12), bottomRight: Radius.circular(12)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.calendar, size: 25),
                              const SizedBox(width: 12),
                              Text(formatDate(a.tanggal!), style: TextStyle(fontFamily: 'MontserratSemiBold')),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AutoSizeText(a.jamMulai!, maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 20)),
                              AutoSizeText(a.jamSelesai!, maxLines: 1, style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 20)),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(FontAwesomeIcons.plusMinus, size: 18),
                              const SizedBox(width: 12),
                              Text(a.jumlahJam!, style: TextStyle(fontFamily: 'MontserratSemiBold')),
                            ],
                          ),
                          const SizedBox(height: 12),
                          AutoSizeText(a.keterangan!, maxLines: 2, style: TextStyle(fontFamily: 'MontserratMedium', fontSize: 14)),
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
