import 'package:sihr/source/env/internetCheck.dart';
import 'package:sihr/source/network/SlipGaji/apiSlipGaji.dart';
import 'package:sihr/source/network/network.dart';
import 'package:sihr/source/widget/customDialog.dart';

class RepositorySlipGaji {
  Future getSlip(bulan, tahun, context) async {
    if (await internetChecker()) {
      var json = await network(url: ApiSlipGaji.getSlip(bulan, tahun), method: "GET", body: null, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }
}
