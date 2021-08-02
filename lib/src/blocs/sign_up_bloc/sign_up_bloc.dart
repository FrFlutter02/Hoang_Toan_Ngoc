import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'sign_up_event.dart';
import 'sign_up_state.dart';
import '../../repository/user_repository.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    final UserRepository _userRepository = UserRepository();
    switch (event.runtimeType) {
      case SignUpSubmitted:
        event as SignUpSubmitted;
        try {
          UserCredential user = await _userRepository.signUp(
              event.email, event.password, event.fullName);
          yield SignUpSuccess(user);
        } on FirebaseAuthException catch (exception) {
          print(exception);
          yield SignUpAuthFailure(exception);
        } catch (e) {
          print(e);
        }
        break;
    }
  }
}
