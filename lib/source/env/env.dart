import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const String APPLICATION_JSON = "application/json";
const String CONTENT_TYPE = "Content-Type";
const String ACCEPT = "Accept";
const String AUTHORIZATION = "authorization";

const url = "https://api.hris.rsuumc.com";
PermissionStatus? storagePermission;
PermissionStatus? locationPermission;
PermissionStatus? cameraPermission;

const hijau = Color(0XFF00712D);
const hijauDark = Color(0XFF1A5319);
const hijauLight = Color(0XFF508D4E);
const hijauLight2 = Color(0XFF80AF81);
const hijauDark2 = Color(0XFF00712D);
const whiteCustom = Color.fromRGBO(245, 245, 245, 1);
const whiteCustom2 = Color.fromARGB(255, 255, 255, 255);
const merah = Color(0XFFA91D3A);
const biru = Color(0XFF125B9A);
