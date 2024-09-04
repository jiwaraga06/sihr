import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihr/source/model/ModelPegawai/modelPegawai.dart';
import 'package:sihr/source/repository/repositoryPegawai.dart';

part 'get_pegawai_state.dart';

class GetPegawaiCubit extends Cubit<GetPegawaiState> {
  final PegawaiRepository? repository;
  GetPegawaiCubit({this.repository}) : super(GetPegawaiInitial());

  void getPegawai(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var idPegawai = pref.getString("id_pegawai");
    emit(GetPegawaiLoading());
    repository!.getPegawai(context, idPegawai).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      // print(json);
      if (statusCode == 200) {
        emit(GetPegawaiLoaded(statusCode: statusCode, model: modelPegawaiFromJson(jsonEncode(json))));
      } else {
        emit(GetPegawaiFailed(statusCode: statusCode, messageError: "Ops, Terjadi Kesalahan"));
      }
    });
  }
}
