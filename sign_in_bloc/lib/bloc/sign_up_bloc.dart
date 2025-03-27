import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<FullNameChanged>(_onFullNameChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<EmailChanged>(_onEmailChanged);
    on<MobileNumberChanged>(_onMobileNumberChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SignUpSubmitted>(_onSignUpSubmitted);
  }

  void _onFullNameChanged(FullNameChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(fullName: event.fullName));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onMobileNumberChanged(MobileNumberChanged event, Emitter<SignUpState> emit) {
    emit(state.copyWith(mobileNumber: event.mobileNumber));
  }

  void _onTogglePasswordVisibility(
      TogglePasswordVisibility event, Emitter<SignUpState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onSignUpSubmitted(
      SignUpSubmitted event, Emitter<SignUpState> emit) async {
    if (state.fullName.isEmpty ||
        state.password.isEmpty ||
        state.email.isEmpty ||
        state.mobileNumber.isEmpty) {
      emit(state.copyWith(
          status: SignUpStatus.failure,
          errorMessage: 'Please fill in all fields.'));
      return;
    }

    emit(state.copyWith(status: SignUpStatus.loading));
    await Future.delayed(const Duration(seconds: 1));
    if (state.email.contains('@')) {
      emit(state.copyWith(status: SignUpStatus.success));
    } else {
      emit(state.copyWith(
          status: SignUpStatus.failure, errorMessage: 'Invalid email.'));
    }
  }
}