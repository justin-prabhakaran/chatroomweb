part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class SuccessfullState extends AuthInitial {}

class AuthLoadingState extends AuthInitial {}

class AuthErrorState extends AuthInitial {}
