import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class MyDialog {
  static dialogLoading(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(color: Colors.blue),
              SizedBox(width: 20),
              Text("Loading..."),
            ],
          ),
        );
      },
    );
  }

  static dialogAlert(context, message) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.rightSlide,
      title: 'Alert',
      desc: '$message',
      btnCancelOnPress: () {},
      btnOkOnPress: () {},
    )..show();
  }

  static dialogSuccess(context, message) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: 'Success',
      desc: '$message',
      btnOkOnPress: () {},
    )..show();
  }

  static dialogInfo(context, message, VoidCallback onPressedCancel, VoidCallback onPressedOk) {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.info,
      animType: AnimType.rightSlide,
      title: 'Info',
      desc: '$message',
      btnCancelOnPress: onPressedCancel,
      btnOkOnPress: onPressedOk,
    )..show();
  }
}
