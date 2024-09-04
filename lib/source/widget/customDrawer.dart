import 'package:flutter/material.dart';
import 'package:sihr/source/env/env.dart';

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
            subtitle: Text("Mobile", style: TextStyle( fontFamily: 'JakartaSansSemiBold', fontSize: 14)),
            
          )
        ],
      ),
    );
  }
}
