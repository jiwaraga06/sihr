import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sihr/source/env/env.dart';

class WidgetCardHome extends StatelessWidget {
  const WidgetCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: whiteCustom2, borderRadius: BorderRadius.circular(6.0), 
      border: Border.all(color: Colors.grey.withOpacity(0.5))
      // boxShadow: [
      //   BoxShadow(
      //     color: Colors.grey.withOpacity(0.5),
      //     blurRadius: 1.5,
      //     spreadRadius: 1.3,
      //     offset: Offset(1, 3),
      //   ),
      // ]
      ),
      child: Column(
        children: [
          SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14.0),
              child: Row(
                children: [
                  Icon(FontAwesomeIcons.solidClock, color: Colors.grey, size: 35),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reguler",
                              style: TextStyle(fontFamily: 'MontserratMedium'),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text("08:00", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                                Text("-", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                                Text("12:00", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text("Masuk ", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
                                Text(": ", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
                                Text("12:00", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
                              ],
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sabtu",
                              style: TextStyle(fontFamily: 'MontserratSemiBold'),
                            ),
                            const SizedBox(height: 4),
                            Text("20 Jul 2024", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text("Pulang ", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
                                Text(": ", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
                                Text("12:00", style: TextStyle(fontFamily: 'MontserratMedium', color: hijauLight)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14.0),
            child: Divider(thickness: 2.5, color: hijauLight),
          ),
          const SizedBox(height: 12),
          Text("Rekap Absensi Bulan ini", style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 18)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("HADIR", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                  const SizedBox(height: 4),
                  Text("0 Hari", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 80,
                    child: Divider(thickness: 3, color: Colors.green),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Izin", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                  const SizedBox(height: 4),
                  Text("0 Hari", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 80,
                    child: Divider(thickness: 3, color: Colors.blue),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("SISA CUTI", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                  const SizedBox(height: 4),
                  Text("0 Hari", style: TextStyle(fontFamily: 'MontserratSemiBold')),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 80,
                    child: Divider(thickness: 3, color: Colors.amber),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
