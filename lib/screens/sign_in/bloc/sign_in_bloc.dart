import 'package:bloc_validation/screens/sign_in/bloc/sign_in_event.dart';
import 'package:bloc_validation/screens/sign_in/bloc/sign_in_state.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangedEvent>((event, emit) {
      // event would hold the data [emailValue, passwordValue in this case]

      if (event.emailValue == "" ||
          !EmailValidator.validate(event.emailValue)) {
        emit(SignInErrorState("Please enter a valid email address!"));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState("Password should contain atleast 8 characters!"));
      } else {
        emit(SignInValidState());
      }
    });

    on<SignInSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
