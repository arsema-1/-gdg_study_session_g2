import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(const SignInState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<TogglePasswordVisibility>(_onTogglePasswordVisibility);
    on<SignInSubmitted>(_onSignInSubmitted);
  }

  void _onEmailChanged(EmailChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _onPasswordChanged(PasswordChanged event, Emitter<SignInState> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _onTogglePasswordVisibility(TogglePasswordVisibility event, Emitter<SignInState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onSignInSubmitted(SignInSubmitted event, Emitter<SignInState> emit) async {
    if (state.email.isEmpty || state.password.isEmpty) {
      emit(state.copyWith(status: SignInStatus.failure, errorMessage: 'Please fill in all fields.'));
      return;
    }

    emit(state.copyWith(status: SignInStatus.loading));
    print("SignInBloc: Emitting loading state"); // Added for debugging

    // Simulate sign-in process
    await Future.delayed(const Duration(seconds: 1));

    if (state.email == 'test@example.com' && state.password == 'password') {
      emit(state.copyWith(status: SignInStatus.success));
      print("SignInBloc: Emitting success state"); // Added for debugging
    } else {
      emit(state.copyWith(status: SignInStatus.failure, errorMessage: 'Invalid credentials.'));
      print("SignInBloc: Emitting failure state with error: ${state.errorMessage}"); // Added for debugging
    }
  }
}