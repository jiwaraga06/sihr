import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sihr/source/env/env.dart';
import 'package:sihr/source/router/string.dart';

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
        childAspectRatio: 1.0,
        children: [
          // InkWell(
          //   onTap: () {
          //      Navigator.pushNamed(context, absensiScreen);
          //   },
          //   child: Container(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Container(
          //             padding: const EdgeInsets.all(12),
          //             decoration:
          //                 BoxDecoration(color: whiteCustom2, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.5))),
          //             child: Image.asset("assets/images/checkin.png")),
          //         SizedBox(height: 6),
          //         AutoSizeText('Absen', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
          //       ],
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, izinScreen);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      decoration:
                          BoxDecoration(color: whiteCustom2, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.5))),
                      child: Image.asset("assets/images/izin.png")),
                  const SizedBox(height: 6),
                  const AutoSizeText('Izin', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
                ],
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {},
          //   child: Container(
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.center,
          //       children: [
          //         Container(
          //             padding: const EdgeInsets.all(12),
          //             decoration:
          //                 BoxDecoration(color: whiteCustom2, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.5))),
          //             child: Image.asset("assets/images/visit.png")),
          //         SizedBox(height: 6),
          //         AutoSizeText('Visit', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
          //       ],
          //     ),
          //   ),
          // ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, lemburScreen);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      decoration:
                          BoxDecoration(color: whiteCustom2, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.5))),
                      child: Image.asset("assets/images/visit.png")),
                  const SizedBox(height: 6),
                  const AutoSizeText('Lembur', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, cutiScreen);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      decoration:
                          BoxDecoration(color: whiteCustom2, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.5))),
                      child: Image.asset("assets/images/cuti.png")),
                  const SizedBox(height: 6),
                  const AutoSizeText('Cuti', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, profileScreen);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      decoration:
                          BoxDecoration(color: whiteCustom2, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.5))),
                      child: Image.asset("assets/images/male.png")),
                  const SizedBox(height: 6),
                  const AutoSizeText('Profile', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, newsScreen);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      decoration:
                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.5))),
                      child: Image.asset("assets/images/News.png")),
                  const SizedBox(height: 6),
                  const AutoSizeText('Berita', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, pelatihanScreen);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      decoration:
                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.5))),
                      child: Image.asset("assets/images/Training.png")),
                  const SizedBox(height: 6),
                  const AutoSizeText('Pelatihan', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, logbookScreen);
            },
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      padding: const EdgeInsets.all(12),
                      decoration:
                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey.withOpacity(0.5))),
                      child: Image.asset("assets/images/Note.png")),
                  const SizedBox(height: 6),
                  const AutoSizeText('Log Book', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
