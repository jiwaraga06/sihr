import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sihr/source/repository/RepositoryApproval.dart';

part 'approval_state.dart';

class ApprovalCubit extends Cubit<ApprovalState> {
  final RepostoryApproval? repository;
  ApprovalCubit({this.repository}) : super(ApprovalInitial());

  void approval(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var body = {};
    print(body);
    emit(ApprovalLoading());
    repository!.postApproval(body, context).then((value) {
      var json = value.data;
      var statusCode = value.statusCode;
      print(json);
      if (statusCode == 200 || statusCode == 200) {
        emit(ApprovalLoaded(statusCode: statusCode, json: json));
      } else {
        emit(ApprovalFailed(statusCode: statusCode, json: json));
      }
    });
  }
}
