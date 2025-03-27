part of 'sign_in_bloc.dart';

enum SignInStatus { initial, loading, success, failure }

class SignInState extends Equatable {
  const SignInState({
    this.email = '',
    this.password = '',
    this.isPasswordVisible = false,
    this.status = SignInStatus.initial,
    this.errorMessage = '',
  });

  final String email;
  final String password;
  final bool isPasswordVisible;
  final SignInStatus status;
  final String errorMessage;

  SignInState copyWith({
    String? email,
    String? password,
    bool? isPasswordVisible,
    SignInStatus? status,
    String? errorMessage,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [email, password, isPasswordVisible, status, errorMessage];
}