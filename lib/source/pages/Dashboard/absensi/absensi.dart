part of '../../index.dart';

class AbsensiScreen extends StatefulWidget {
  const AbsensiScreen({super.key});

  @override
  State<AbsensiScreen> createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  String tipeScan = "Scan Masuk";

  void changeTipe(value) {
    setState(() {
      if (value == 1) {
        tipeScan = "Scan Masuk";
      } else {
        tipeScan = "Scan Pulang";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<MarkerLocationCubit>(context).getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Absensi"),
      ),
      body: BlocBuilder<MarkerLocationCubit, MarkerLocationState>(
        builder: (context, state) {
          if (state is MarkerLocationLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }
          if (state is MarkerLocationLoaded == false) {
            return const Center(child: CupertinoActivityIndicator());
          }
          var latitude = (state as MarkerLocationLoaded).latitude!;
          var longitude = (state as MarkerLocationLoaded).longitude!;
          var place = (state as MarkerLocationLoaded).myPlacement![0];
          return Stack(
            children: [
              FlutterMap(
                options: MapOptions(initialCenter: LatLng(-7.002922, 107.5725543), initialZoom: 10),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                  ),
                  CircleLayer(
                    circles: [
                      CircleMarker(
                        point: LatLng(latitude, longitude),
                        radius: 250,
                        useRadiusInMeter: true,
                        color: Colors.blue[200]!.withOpacity(0.5),
                        borderColor: Colors.blue.withOpacity(0.5),
                        borderStrokeWidth: 2,
                      ),
                    ],
                  ),
                  MarkerLayer(markers: [
                    Marker(point: LatLng(latitude, longitude), width: 50, height: 50, child: Image.asset("assets/images/pin.png", height: 50)),
                  ])
                ],
              ),
              Container(
                margin: const EdgeInsets.all(12),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: BoxDecoration(color: Color(0XFFFCF8F3), borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 4),
                        Icon(FontAwesomeIcons.circleDot),
                        const SizedBox(width: 4),
                        Text(place.street!, style: TextStyle(fontFamily: 'MontserratMedium')),
                        const SizedBox(width: 4),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const SizedBox(width: 4),
                        Icon(FontAwesomeIcons.circleDot),
                        const SizedBox(width: 4),
                        Text(place.name!, style: TextStyle(fontFamily: 'MontserratMedium')),
                        const SizedBox(width: 4),
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  // height: 250,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text("Foto Belakang"),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(color: biru, borderRadius: BorderRadius.circular(100)),
                                    child: Icon(FontAwesomeIcons.camera, color: Colors.white),
                                  ),
                                  Icon(Icons.arrow_drop_down_outlined),
                                ],
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text("Lampiran"),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  Container(
                                    height: 50,
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(color: biru, borderRadius: BorderRadius.circular(100)),
                                    child: Icon(FontAwesomeIcons.fileArrowDown, color: Colors.white),
                                  ),
                                  Icon(Icons.arrow_drop_down_outlined),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Container(
                        color: Color(0XFFF5F5F5),
                        padding: const EdgeInsets.only(top: 20, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Tipe Scan", style: TextStyle(fontFamily: 'MontserratMedium')),
                                Row(
                                  children: [
                                    Text(tipeScan, style: TextStyle(fontFamily: 'MontserratSemiBold')),
                                    PopupMenuButton(
                                        child: Icon(Icons.arrow_drop_down),
                                        itemBuilder: (context) => [
                                              PopupMenuItem(
                                                onTap: () {
                                                  changeTipe(1);
                                                },
                                                value: 1,
                                                child: Text("Scan Masuk", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                                              ),
                                              PopupMenuItem(
                                                onTap: () {
                                                  changeTipe(2);
                                                },
                                                value: 2,
                                                child: Text("Scan Pulang", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                                              ),
                                            ]),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Jam", style: TextStyle(fontFamily: 'MontserratMedium')),
                                Text("13:34", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Catatan", style: TextStyle(fontFamily: 'MontserratMedium')),
                                Text("-", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: CustomButton2(
                          onTap: () {},
                          text: "PROSES",
                          textStyle: TextStyle(color: Colors.white, fontFamily: 'MontserratSemiBold'),
                          backgroundColor: biru,
                          roundedRectangleBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
