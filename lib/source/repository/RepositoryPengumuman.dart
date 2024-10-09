import 'package:sihr/source/env/internetCheck.dart';
import 'package:sihr/source/network/Pengumuman/apiPengumuman.dart';
import 'package:sihr/source/network/network.dart';
import 'package:sihr/source/widget/customDialog.dart';

class Repositorypengumuman {
  Future getPengumuman(context) async {
    if (await internetChecker()) {
      var json = await network(url: Apipengumuman.pengumuman(), method: "GET", body: null, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }
}
