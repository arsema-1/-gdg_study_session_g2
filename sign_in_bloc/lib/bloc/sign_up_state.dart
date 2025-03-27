part of 'sign_up_bloc.dart';

enum SignUpStatus { initial, loading, success, failure }

class SignUpState extends Equatable {
  const SignUpState({
    this.fullName = '',
    this.password = '',
    this.email = '',
    this.mobileNumber = '',
    this.isPasswordVisible = false,
    this.status = SignUpStatus.initial,
    this.errorMessage = '',
  });

  final String fullName;
  final String password;
  final String email;
  final String mobileNumber;
  final bool isPasswordVisible;
  final SignUpStatus status;
  final String errorMessage;

  SignUpState copyWith({
    String? fullName,
    String? password,
    String? email,
    String? mobileNumber,
    bool? isPasswordVisible,
    SignUpStatus? status,
    String? errorMessage,
  }) {
    return SignUpState(
      fullName: fullName ?? this.fullName,
      password: password ?? this.password,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        fullName,
        password,
        email,
        mobileNumber,
        isPasswordVisible,
        status,
        errorMessage
      ];
}