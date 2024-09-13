import 'package:sihr/source/env/internetCheck.dart';
import 'package:sihr/source/network/Lembur/apiLembur.dart';
import 'package:sihr/source/network/network.dart';
import 'package:sihr/source/widget/customDialog.dart';

class LemburRepository {
  Future createLembur(body, context) async {
    if (await internetChecker()) {
      var json = await network(url: ApiLembur.createLembur(), method: "POST", body: body, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }
}