part of 'auth_bloc.dart';

class AuthState extends Equatable {
  const AuthState(this.isLoggedIn);

  final bool isLoggedIn;

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  const AuthInitial() : super(false);
}

class SuccessState extends AuthState {
  final UserEntity user;
  const SuccessState(this.user) : super(true);

  @override
  List<Object> get props => [user];
}

class FailedState extends AuthState {
  final String errorMessage;
  final String field;
  FailedState(this.errorMessage, this.field) : super(false);
  @override
  List<Object> get props => [errorMessage];
}