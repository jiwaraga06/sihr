import 'package:sihr/source/env/internetCheck.dart';
import 'package:sihr/source/network/LogBook/apiLogBook.dart';
import 'package:sihr/source/network/network.dart';
import 'package:sihr/source/widget/customDialog.dart';

class RepositoryLogBook {
  Future getLogBook(context) async {
    if (await internetChecker()) {
      var json = await network(url: ApiLogBook.getLogBook(), method: "GET", body: null, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }

  Future createLogBook(context, body) async {
    if (await internetChecker()) {
      var json = await network(url: ApiLogBook.createLogBook(), method: "POST", body: body, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }

  Future updateLogBook(context, body, id) async {
    if (await internetChecker()) {
      var json = await network(url: ApiLogBook.updateLogBook(id), method: "POST", body: body, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }
}
