import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihr/source/env/env.dart';
import 'package:sihr/source/repository/RepositoryAbseni.dart';

part 'post_absensi_state.dart';

class PostAbsensiCubit extends Cubit<PostAbsensiState> {
  final AbsensiRepository? repository;
  PostAbsensiCubit({this.repository}) : super(PostAbsensiInitial());

  void postAbsensi(XFile? foto, lat, long, keterangan, context) async {
    emit(PostAbsensiLoading());
    SharedPreferences pref = await SharedPreferences.getInstance();
    var idPegawai = pref.getString("id_pegawai");
    var body = FormData.fromMap({
      "id_pegawai": "$idPegawai",
      "tanggal": "$tanggal",
      "waktu_masuk": "08:00:00",
      "waktu_keluar": "12:00:00",
      "status": "Hadir",
      "keterangan": "$keterangan",
      "foto": await MultipartFile.fromFile(foto!.path, filename: foto.name),
      "latt": "$lat",
      "terlambat": "1",
      "att": "$long",
      "id_shift": "8",
    });
    print(body.fields);
    repository!.postAbsensi(body, context).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print("POST: $json");
    });
  }
}
