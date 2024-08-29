part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class AuthLoading extends AuthState {}
final class AuthLoaded extends AuthState {
  final int? statusCode;
  final dynamic json;

  AuthLoaded({required this.statusCode, required this.json});
}
