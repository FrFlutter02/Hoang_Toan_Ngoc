import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/src/blocs/login_blocs/login_event.dart';
import 'package:mobile_app/src/blocs/login_blocs/login_states.dart';
import 'package:mobile_app/src/repositories/user_repository.dart';
import 'package:mobile_app/src/utils/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  final Validators validators = Validators();
  final UserRepository userRepository = UserRepository();

  LoginBloc() : super(LoginInitial());
  Future<bool> checkAccount(String email, String password) async {
    String isAccount =
        await userRepository.signInWithCredentials(email, password);

    if (isAccount == "signed in")
      return true;
    else
      return false;
  }

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginFetched) {
      yield LoginFailure();
    }
    if (event is LoginWithCredentialsPressed) {
      yield LoginLoading();
      String email = event.email;
      String password = event.password;
      bool check = await checkAccount(email, password);
      if (check == true) {
        User user = await userRepository.getUser();
        yield LoginSuccess(firebaseUser: user);
      } else {
        yield LoginFailure();
      }
    }
  }
}
