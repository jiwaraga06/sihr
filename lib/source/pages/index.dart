import 'dart:convert';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sihr/source/env/env.dart';
import 'package:sihr/source/router/string.dart';
import 'package:sihr/source/service/Auth/cubit/auth_cubit.dart';
import 'package:sihr/source/widget/customButton.dart';
import 'package:sihr/source/widget/customDialog.dart';
import 'package:sihr/source/widget/customField.dart';
import 'package:badges/badges.dart' as badges;
import 'package:sihr/source/widget/widgetCardHome.dart';
import 'package:sihr/source/widget/widgetMenu.dart';

part './Auth/splash.dart';
part './Auth/login.dart';
part './Dashboard/dashboard.dart';
part './Dashboard/home/home.dart';
part './Dashboard/absensi/absensi.dart';