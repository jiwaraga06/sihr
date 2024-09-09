import 'package:sihr/source/env/internetCheck.dart';
import 'package:sihr/source/network/Absensi/apiAbseni.dart';
import 'package:sihr/source/network/User/apiUser.dart';
import 'package:sihr/source/network/network.dart';
import 'package:sihr/source/widget/customDialog.dart';

class AbsensiRepository {
  Future postAbsensi(body, context) async {
    if (await internetChecker()) {
      var json = await network(url: ApiAbsensi.postAbsensi(), method: "POST", body: body, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }
}
