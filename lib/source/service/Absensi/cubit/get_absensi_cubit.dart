import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihr/source/model/ModelDataAbsensi/modelDataAbsensi.dart';
import 'package:sihr/source/repository/RepositoryAbseni.dart';

part 'get_absensi_state.dart';

class GetAbsensiCubit extends Cubit<GetAbsensiState> {
  final AbsensiRepository? repository;
  GetAbsensiCubit({this.repository}) : super(GetAbsensiInitial());

  void getAbsensi(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var idPegawai = pref.getString("id_pegawai");
    print(idPegawai);
    emit(GetAbsensiLoading());
    repository!.getAbsensi(context).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      if (statusCode >= 200) {
        emit(GetAbsensiLoaded(statusCode: statusCode, idPegawai: idPegawai, model: modelDataAbsensiFromJson(jsonEncode(json))));
      } else {
        emit(GetAbsensiFailed(statusCode: statusCode, json: json));
      }
    });
  }
}
