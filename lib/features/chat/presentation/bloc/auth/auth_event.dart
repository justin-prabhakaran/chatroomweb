part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class PageBuildEvent extends AuthEvent {}

class AuthLoadingEvent extends AuthEvent {}

class AuthSuccessEvent extends AuthEvent {}
