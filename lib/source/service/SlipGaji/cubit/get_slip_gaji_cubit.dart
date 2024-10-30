import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihr/source/model/ModelSlipGaji/modelSlipGaji.dart';
import 'package:sihr/source/repository/RepositorySlipGaji.dart';

part 'get_slip_gaji_state.dart';

class GetSlipGajiCubit extends Cubit<GetSlipGajiState> {
  final RepositorySlipGaji? repository;
  GetSlipGajiCubit({this.repository}) : super(GetSlipGajiInitial());

  void getSlipGaji(bulan, tahun, context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? idPegawai = pref.getString("id_pegawai");
    emit(GetSlipGajiLoading());
    repository!.getSlip(bulan, tahun, context).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print("Slip GAJI: $json");

      if (statusCode == 200 || statusCode == 201) {
        emit(GetSlipGajiLoaded(statusCode: statusCode, model: modelSlipGajiFromJson(jsonEncode(json)), idPegawai: int.parse(idPegawai!)));
      } else {
        emit(GetSlipGajiFailed(statusCode: statusCode, json: json));
      }
    });
  }
}
