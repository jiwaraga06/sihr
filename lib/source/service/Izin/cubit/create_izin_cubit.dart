import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sihr/source/repository/repositoryIzin.dart';

part 'create_izin_state.dart';

class CreateIzinCubit extends Cubit<CreateIzinState> {
  final IzinRepository? repository;
  CreateIzinCubit({this.repository}) : super(CreateIzinInitial());

  void createIzin() {}

}
