part of '../../index.dart';

class SlipGajiScreen extends StatefulWidget {
  const SlipGajiScreen({super.key});

  @override
  State<SlipGajiScreen> createState() => _SlipGajiScreenState();
}

class _SlipGajiScreenState extends State<SlipGajiScreen> {
  var year, month;
  void selectMonth() {
    pickMonth(context).then((value) {
      if (value != null) {
        setState(() {
          month = value.toString().split(' ')[0].split('-')[1];
          year = value.toString().split(' ')[0].split('-')[0];
          BlocProvider.of<GetSlipGajiCubit>(context).getSlipGaji(month, year, context);
        });
      }
    });
  }

  void showSlipGaji(id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    print("");
    print("https://hris.rsuumc.com/payroll/print-slip/$id?token=$token");
    print("");
    if (!await launchUrl(Uri.parse("https://hris.rsuumc.com/payroll/print-slip/$id?token=$token"))) {
      throw Exception('Could not launch URL');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Slip Gaji"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: selectMonth,
        child: const Icon(Icons.search, color: Colors.white),
      ),
      body: BlocBuilder<GetSlipGajiCubit, GetSlipGajiState>(
        builder: (context, state) {
          if (state is GetSlipGajiLoading) {
            return Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12),
              child: Column(
                children: [SizedBox(height: 120, child: Skeleton.skeleton1())],
              ),
            );
          }
          if (state is GetSlipGajiFailed) {
            var data = state.json;
            return Center(child: Text(data['message']));
          }
          if (state is GetSlipGajiLoaded == false) {
            return Container();
          }
          var data = (state as GetSlipGajiLoaded).model;
          var idPegawai = (state).idPegawai;
          List datafilter = data!.dataSlipgaji!.where((e) => e.idPegawai == idPegawai).toList();
          if (datafilter.isEmpty) {
            return const Center(child: Text("Data Kosong"));
          }
          return Container(
            padding: const EdgeInsets.all(12),
            child: RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                BlocProvider.of<GetSlipGajiCubit>(context).getSlipGaji(month, year, context);
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
                              Text(a.noreff!, style: const TextStyle(fontFamily: 'JakartaSansMedium')),
                              Text("${a.bulan} - ${a.tahun}", style: const TextStyle(fontFamily: 'MontserratSemiBold')),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomButton2(
                                onTap: () {
                                  showSlipGaji(a.id);
                                  // setState(() {
                                  //   id_slip_gaji = a.id;
                                  //   Navigator.pushNamed(context, detailSlipgajiScreen);
                                  // });
                                },
                                text: "Lihat Slip Gaji",
                                backgroundColor: Colors.blue[600],
                                textStyle: const TextStyle(color: Colors.white),
                                roundedRectangleBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          )
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
