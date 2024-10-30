part of 'get_slip_gaji_cubit.dart';

@immutable
sealed class GetSlipGajiState {}

final class GetSlipGajiInitial extends GetSlipGajiState {}

final class GetSlipGajiLoading extends GetSlipGajiState {}

final class GetSlipGajiFailed extends GetSlipGajiState {
  final int? statusCode;
  final dynamic json;

  GetSlipGajiFailed({required this.statusCode, required this.json});
}

final class GetSlipGajiLoaded extends GetSlipGajiState {
  final int? statusCode,idPegawai;
  final ModelSlipGaji? model;

  GetSlipGajiLoaded({required this.statusCode, required this.model, this.idPegawai});
}
