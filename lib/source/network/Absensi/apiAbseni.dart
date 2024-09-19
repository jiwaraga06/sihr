import 'package:sihr/source/env/env.dart';

class ApiAbsensi {
  static updateAbsensi(idAbsensi) {
    return "$url/api/v1/t_absensi/$idAbsensi";
  }

  static postAbsensi() {
    return "$url/api/v1/t_absensi";
  }

  static getAbsensi() {
    return "$url/api/v1/t_absensi";
  }
}
