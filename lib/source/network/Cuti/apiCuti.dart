import 'package:sihr/source/env/env.dart';

class ApiCuti {
  static jeniscuti() {
    return "$url/api/v1/m_jenis_cuti";
  }

  static getCuti() {
    return "$url/api/v1/t_cuti";
  }

  static createCuti() {
    return "$url/api/v1/t_cuti";
  }
}
