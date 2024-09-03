import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihr/source/model/ModelUser/modelUser.dart';
import 'package:sihr/source/repository/RepositoryAuth.dart';
import 'package:sihr/source/router/string.dart';
import 'package:sihr/source/widget/customDialog.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuhtRepository? repository;
  AuthCubit({this.repository}) : super(AuthInitial());

  void session(context) async {
    emit(AuthLoading());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("token");
    repository!.session(context).then((value) async {
      var json = value.data;
      var statusCode = value.statusCode;
      print(statusCode);
      if (statusCode == 200) {
    emit(AuthLoaded(statusCode: statusCode, modelUser: modelUserFromJson(jsonEncode(json))) );
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushNamedAndRemoveUntil(context, dashboardScreen, (Route<dynamic> route) => false);
      } else if (token == null) {
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushNamedAndRemoveUntil(context, loginScreen, (Route<dynamic> route) => false);
      } else if (statusCode != 200){
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushNamedAndRemoveUntil(context, loginScreen, (Route<dynamic> route) => false);
      }
    });
  }

  void login(email, password, context) async {
    emit(AuthLoading());
    var body = FormData.fromMap({"email": "$email", "password": "$password"});
    SharedPreferences pref = await SharedPreferences.getInstance();
    MyDialog.dialogLoading(context);
    repository!.login(body, context).then((value) async {
      var json = value.data;
      var statusCode = value.statusCode;
      Navigator.of(context).pop();
      if (statusCode == 200) {
        pref.setString("id", json['data']['id'].toString());
        pref.setString("username", json['data']['username']);
        pref.setString("email", json['data']['email']);
        pref.setString("phoneNumber", json['data']['phoneNumber']);
        pref.setString("token", json['data']['token']);
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushNamedAndRemoveUntil(context, dashboardScreen, (Route<dynamic> route) => false);
      } else {
        MyDialog.dialogAlert(context, json['message']);
      }
      print("login: \n$json");
      emit(AuthLoaded(statusCode: statusCode, json: json));
    });
  }
}