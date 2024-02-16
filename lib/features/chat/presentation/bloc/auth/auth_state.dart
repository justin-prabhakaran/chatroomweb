part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class ChatInitial extends AuthState {}

class RoomCreatedState extends ChatInitial {
  final RoomEntity room;
  final UserEntity user;

  RoomCreatedState({required this.room, required this.user});

  @override
  List<Object> get props => [room];
}

class SuccessfullState extends ChatInitial {}

class LoadingState extends ChatInitial {}
