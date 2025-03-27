part of 'sign_up_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class FullNameChanged extends SignUpEvent {
  final String fullName;

  const FullNameChanged({required this.fullName});

  @override
  List<Object> get props => [fullName];
}

class PasswordChanged extends SignUpEvent {
  final String password;

  const PasswordChanged({required this.password});

  @override
  List<Object> get props => [password];
}

class EmailChanged extends SignUpEvent {
  final String email;

  const EmailChanged({required this.email});

  @override
  List<Object> get props => [email];
}

class MobileNumberChanged extends SignUpEvent {
  final String mobileNumber;

  const MobileNumberChanged({required this.mobileNumber});

  @override
  List<Object> get props => [mobileNumber];
}

class TogglePasswordVisibility extends SignUpEvent {}

class SignUpSubmitted extends SignUpEvent {}