import 'dart:async';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihr/source/env/env.dart';

Future network({String? method, String? url, body, context}) async {
  final dio = Dio();
  SharedPreferences pref = await SharedPreferences.getInstance();
  var token = pref.getString('token');
  var headers = {'Authorization': 'Bearer $token', "Accept": "application/json", "Content-type": "application/json"};
  var response;
  try {
    if (method == "GET") {
      response = await dio.get(url!, options: Options(headers: headers, responseType: ResponseType.json, validateStatus: (status) => true), data: body);
    } else if (method == "POST") {
      response = await dio.post(url!, options: Options(headers: headers, responseType: ResponseType.json, validateStatus: (status) => true), data: body);
    } else if (method == "PUT") {
      response = await dio.put(url!, options: Options(headers: headers, responseType: ResponseType.json, validateStatus: (status) => true), data: body);
    } else if (method == "DELETE") {
      response = await dio.delete(url!, options: Options(headers: headers, responseType: ResponseType.json, validateStatus: (status) => true), data: body);
    }
    return response;
  } on TimeoutException {
    EasyLoading.dismiss();
    // MyDialog.dialogAlert(context, 'Masalah Koneksi \n Jaringan Lemah');
  } on SocketException {
    EasyLoading.dismiss();
    // MyDialog.dialogAlert(context, 'Masalah Koneksi \n Data Mati');
  } on HttpException catch (e) {print(e);
    EasyLoading.dismiss();
    // MyDialog.dialogAlert(context, e.message);
  } on Error catch (e) {
    EasyLoading.dismiss();
    print(e);
    // MyDialog.dialogAlert(context, e.toString());
  }
}
