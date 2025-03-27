part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends SignInEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends SignInEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class TogglePasswordVisibility extends SignInEvent {}

class SignInSubmitted extends SignInEvent {}
