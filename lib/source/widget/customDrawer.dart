import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sihr/source/env/env.dart';
import 'package:sihr/source/router/string.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: whiteCustom,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      child: ListView(
        children: [
          const SizedBox(height: 12),
          ListTile(
            tileColor: whiteCustom,
            leading: Image.network("https://api.hris.rsuumc.com/storage/assets/img/logo_perusahaan/logo_e629cec4f652fd5211e5f7eeb4324a70.png", height: 50),
            title: Text("Si-HR", style: TextStyle(color: Colors.indigo, fontFamily: 'JakartaSansMedium', fontSize: 25)),
            subtitle: Text("Mobile", style: TextStyle(fontFamily: 'JakartaSansSemiBold', fontSize: 14)),
          ),
          const SizedBox(height: 12),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, absensiScreen);
            },
            tileColor: whiteCustom,
            leading: Image.asset("assets/images/checkin.png"),
            title: AutoSizeText('Absen Masuk', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1),
          ),
          const SizedBox(height: 12),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, absensiScreen);
            },
            tileColor: whiteCustom,
            leading: Image.asset("assets/images/checkout.png"),
            title: AutoSizeText('Absen Pulang', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1),
          ),
          const SizedBox(height: 12),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, izinScreen);
            },
            tileColor: whiteCustom,
            leading: Image.asset("assets/images/izin.png"),
            title: AutoSizeText('Izin', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1),
          ),
          const SizedBox(height: 12),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, lemburScreen);
            },
            tileColor: whiteCustom,
            leading: Image.asset("assets/images/visit.png"),
            title: AutoSizeText('Lembur', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1),
          ),
          const SizedBox(height: 12),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, cutiScreen);
            },
            tileColor: whiteCustom,
            leading: Image.asset("assets/images/cuti.png"),
            title: AutoSizeText('Cuti', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1),
          ),
          const SizedBox(height: 12),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, profileScreen);
            },
            tileColor: whiteCustom,
            leading: Image.asset("assets/images/male.png"),
            title: AutoSizeText('Profile', style: TextStyle(fontSize: 14, fontFamily: 'MontserratSemiBold'), maxLines: 1),
          ),
        ],
      ),
    );
  }
}
