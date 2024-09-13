import 'package:sihr/source/env/internetCheck.dart';
import 'package:sihr/source/network/Izin/apiIzin.dart';
import 'package:sihr/source/network/network.dart';
import 'package:sihr/source/widget/customDialog.dart';

class IzinRepository {
  Future jeniscuti(context) async {
    if (await internetChecker()) {
      var json = await network(url: Apiizin.jenisIzin(), method: "GET", body: null, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }
}
