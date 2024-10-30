import 'package:sihr/source/env/env.dart';

class ApiSlipGaji {
  static getSlip(bulan, tahun) {
    return "$url2/api/v1/t_payroll?bulan=$bulan&tahun=$tahun";
  }
}
