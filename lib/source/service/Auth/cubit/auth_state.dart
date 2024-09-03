part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthLoaded extends AuthState {
  final int? statusCode;
  dynamic json;
  ModelUser? modelUser;

  AuthLoaded({required this.statusCode, this.json, this.modelUser});
}
