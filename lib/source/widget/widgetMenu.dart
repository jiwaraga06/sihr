import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WidgetMenuUtama extends StatelessWidget {
  const WidgetMenuUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 3,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.receipt, size: 36, color: Colors.indigo),
                            const SizedBox(height: 6),
                            Text("Izin", style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.businessTime, size: 36, color: Colors.pink),
                            const SizedBox(height: 6),
                            Text("Lembur", style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.clock, size: 36, color: Colors.blue),
                            const SizedBox(height: 6),
                            Text("Shift", style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.noteSticky, size: 36, color: Colors.amber),
                            const SizedBox(height: 6),
                            Text("Aktifitas", style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.newspaper, size: 36, color: Colors.teal),
                            const SizedBox(height: 6),
                            Text("Berita", style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.sackDollar, size: 36, color: Colors.orange),
                            const SizedBox(height: 6),
                            Text("Slip Gaji", style: TextStyle(fontFamily: 'MontserratSemiBold', fontSize: 16)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            
  }
}