import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';
import '../../repository/user_repository.dart';
import '../../utils/validators.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final UserRepository _userRepository;

  SignUpBloc({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(SignUpState.initial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpEmailChanged) {
      yield* _mapSignUpEmailChangeToState(event.email);
    } else if (event is SignUpPasswordChanged) {
      yield* _mapSignUpPasswordChangeToState(event.password);
    } else if (event is SignUpSubmitted) {
      yield* _mapSignUpSubmittedToState(
          email: event.email,
          password: event.password,
          fullName: event.fullName);
    }
  }

  Stream<SignUpState> _mapSignUpEmailChangeToState(String email) async* {
    yield state.update(isEmailValid: Validators.isValidEmail(email));
  }

  Stream<SignUpState> _mapSignUpPasswordChangeToState(String password) async* {
    yield state.update(isPasswordValid: Validators.isValidPassword(password));
  }

  Stream<SignUpState> _mapSignUpSubmittedToState(
      {required String email,
      required String password,
      required String fullName}) async* {
    // if(Validators.isValidPassword(password)){

    // }
    yield SignUpState.loading();
    try {
      await _userRepository.signUp(email, password, fullName);
      yield SignUpState.success();
    } catch (error) {
      print(error);
      yield SignUpState.failure();
    }
  }
}
