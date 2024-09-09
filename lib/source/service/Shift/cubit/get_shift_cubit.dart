import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihr/source/model/ModelShift/modelShift.dart';
import 'package:sihr/source/repository/RepositoryShift.dart';

part 'get_shift_state.dart';

class GetShiftCubit extends Cubit<GetShiftState> {
  final ShiftRepository? repository;
  GetShiftCubit({this.repository}) : super(GetShiftInitial());

  void getShift(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    emit(GetShiftLoading());
    repository!.getShift(context, 8).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print(json);
      if (statusCode >= 200) {
        emit(GetShiftLoaded(statusCode: statusCode, model: modelShiftFromJson(jsonEncode(json))));
      } else {
        emit(GetShiftFailed(statusCode: statusCode, messageError: json['message']));
      }
    });
  }
}
