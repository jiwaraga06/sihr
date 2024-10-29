import 'package:sihr/source/env/internetCheck.dart';
import 'package:sihr/source/network/Pelatihan/apiPelatihan.dart';
import 'package:sihr/source/network/network.dart';
import 'package:sihr/source/widget/customDialog.dart';

class PelatihanRepository {
  Future jenisPelatihan(context) async {
    if (await internetChecker()) {
      var json = await network(url: ApiPelatihan.jenisPelatihan(), method: "GET", body: null, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }

  Future getPelatihan(context) async {
    if (await internetChecker()) {
      var json = await network(url: ApiPelatihan.pelatihan(), method: "GET", body: null, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }
}
