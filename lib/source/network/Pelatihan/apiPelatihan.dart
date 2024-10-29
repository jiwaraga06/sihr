import 'package:sihr/source/env/env.dart';

class ApiPelatihan {
  static jenisPelatihan() {
    return "$url/api/v1/m_jenispelatihan";
  }

  static pelatihan() {
    return "$url/api/v1/t_partisipasi_pelatihan";
  }
}
