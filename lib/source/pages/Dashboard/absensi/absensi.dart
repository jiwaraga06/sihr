part of '../../index.dart';

class AbsensiScreen extends StatefulWidget {
  const AbsensiScreen({super.key});

  @override
  State<AbsensiScreen> createState() => _AbsensiScreenState();
}

class _AbsensiScreenState extends State<AbsensiScreen> {
  TextEditingController controllerNote = TextEditingController(text: "-");
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

  XFile? gambar;
  void pickImage() async {
    selectPhoto(source: ImageSource.camera).then((value) {
      gambar = value;
      print("gambar: ${gambar!.path}");
    });
  }

  void proses(lat, long) {
    if (gambar == null) {
      MyDialog.dialogAlert(context, "Maaf, anda belum upload foto");
    } else {
      BlocProvider.of<PostAbsensiCubit>(context).postAbsensi(gambar, lat, long, controllerNote.text, context);
    }
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
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<MarkerLocationCubit>(context).getCurrentLocation();
              },
              icon: Icon(Icons.pin_drop))
        ],
      ),
      body: BlocListener<PostAbsensiCubit, PostAbsensiState>(
        listener: (context, state) {
          if (state is PostAbsensiLoading) {
            MyDialog.dialogLoading(context);
          }
          if (state is PostAbsensiFailed) {
            Navigator.of(context).pop();
            var data = state.json;
            MyDialog.dialogAlert(context, data['message']);
          }
          if (state is PostAbsensiLoaded) {
            Navigator.of(context).pop();
            var data = state.json;
            MyDialog.dialogSuccess(context, data['message']);
          }
        },
        child: BlocBuilder<MarkerLocationCubit, MarkerLocationState>(
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
                  options: MapOptions(initialCenter: LatLng(latitude, longitude), initialZoom: 15),
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
                  padding: const EdgeInsets.only(top: 15, bottom: 15, left: 12, right: 12),
                  decoration:
                      BoxDecoration(color: whiteCustom2, borderRadius: BorderRadius.circular(8), border: Border.all(color: Colors.black.withOpacity(0.5))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          Icon(FontAwesomeIcons.circle, size: 23),
                          const SizedBox(width: 8),
                          AutoSizeText(place.street!, style: TextStyle(fontFamily: 'JakartaSansBold'), maxLines: 2),
                          const SizedBox(width: 4),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const SizedBox(width: 4),
                          Icon(Icons.circle, size: 23),
                          const SizedBox(width: 8),
                          AutoSizeText(place.name!, style: TextStyle(fontFamily: 'JakartaSansSemiBold'), maxLines: 1),
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
                            InkWell(
                              onTap: pickImage,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text("Ambil Foto"),
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
                            ),
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
                          ],
                        ),
                        const SizedBox(height: 12),
                        Container(
                          color: Color(0XFFF5F5F5),
                          padding: const EdgeInsets.only(top: 20, bottom: 10, left: 12, right: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Catatan", style: TextStyle(fontFamily: 'MontserratMedium')),
                              CustomField(
                                controller: controllerNote,
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: CustomButton2(
                            onTap: () {
                              proses(latitude, longitude);
                            },
                            text: "PROSES",
                            textStyle: TextStyle(color: Colors.white, fontSize: 18, fontFamily: 'JakartaSansSemiBold'),
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
      ),
    );
  }
}
