import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../login_blocs/login_event.dart';
import '../login_blocs/login_states.dart';
import '../../repositories/user_repository.dart';
import '../../utils/validators.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  LoginBloc() : super(LoginInitial());

  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    final UserRepository userRepository = UserRepository();
    Future<bool> checkAccount(String email, String password) async {
      String isAccount =
          await userRepository.signInWithCredentials(email, password);

      if (isAccount == "signed in")
        return true;
      else
        return false;
    }

    switch (event.runtimeType) {
      case LoginFetched:
        yield LoginFailure();
        break;
      case LoginWithCredentialsPressed:
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
        break;

      default:
        yield LoginFailure();
    }
  }
}
