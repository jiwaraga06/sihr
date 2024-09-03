import 'package:auto_size_text/auto_size_text.dart';
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
        childAspectRatio: 1.0,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.receipt, size: 30, color: Colors.indigo),
                  const SizedBox(height: 6),
                 AutoSizeText('Izin', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
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
                  Icon(FontAwesomeIcons.businessTime, size: 30, color: Colors.pink),
                  const SizedBox(height: 6),
                   AutoSizeText('Lembur', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
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
                  Icon(Icons.login, size: 30, color: Colors.blue),
                  const SizedBox(height: 6),
                  AutoSizeText('Absen Masuk', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
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
                  Icon(Icons.logout, size: 30, color: Colors.amber),
                  const SizedBox(height: 6),
                  AutoSizeText('Absen Pulang', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
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
                  Icon(FontAwesomeIcons.newspaper, size: 30, color: Colors.teal),
                  const SizedBox(height: 6),
                  AutoSizeText('Visit', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
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
                  Icon(FontAwesomeIcons.sackDollar, size: 30, color: Colors.orange),
                  const SizedBox(height: 6),
                   AutoSizeText('Cuti', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
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
                  Image.asset("assets/images/avatar.png"),
                  const SizedBox(height: 6),
                   AutoSizeText('Profile', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
