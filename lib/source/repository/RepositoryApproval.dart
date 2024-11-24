import 'package:sihr/source/env/internetCheck.dart';
import 'package:sihr/source/network/Approval/apiApproval.dart';
import 'package:sihr/source/network/network.dart';
import 'package:sihr/source/widget/customDialog.dart';

class RepostoryApproval {
  Future postApproval(body, context) async {
    if (await internetChecker()) {
      var json = await network(url: ApiApproval.approval(), method: "POST", body: body, context: context);
      return json;
    } else {
      MyDialog.dialogAlert(context, "Maaf, Ada Kesalahan Jaringan !");
    }
  }
}
