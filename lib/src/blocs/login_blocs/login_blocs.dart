// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mobile_app/src/blocs/login_blocs/login_event.dart';
// import 'package:mobile_app/src/blocs/login_blocs/login_states.dart';
// import 'package:mobile_app/src/repositories/user_repository.dart';
// import 'package:mobile_app/src/utils/validators.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   final UserRepository _userRepository;

//   LoginBloc({required UserRepository userRepository})
//       : _userRepository = userRepository,
//         super(LoginState.initial());

//   @override
//   Stream<LoginState> mapEventToState(LoginEvent event) async* {
//     if (event is LoginEmailChange) {
//       yield* _mapLoginEmailChangeToState(event.email);
//     } else if (event is LoginPasswordChanged) {
//       yield* _mapLoginPasswordChangeToState(event.password);
//     } else if (event is LoginWithCredentialsPressed) {
//       yield* _mapLoginWithCredentialsPressedToState(
//           email: event.email, password: event.password);
//     }
//   }

//   Stream<LoginState> _mapLoginEmailChangeToState(
//       String email, String password) async* {
//     yield state.update(
//         isEmailValid: Validators.isValidEmail(email),
//         isPasswordValid: false);
//   }
//    Stream<LoginState> _mapLoginPasswordChangeToState(
//       String email, String password) async* {
//     yield state.update(
//         isEmailValid: Validators.isValidEmail(email),
//         isPasswordValid: false);
//   }
//   Stream<LoginState> _mapLoginWithCredentialsPressedToState(
//       {required String email, required String password}) async* {
//     yield LoginState.loading();
//     try {
//       await _userRepository.signInWithCredentials(email, password);
//       yield LoginState.success();
//     } catch (_) {
//       yield LoginState.failure();
//     }
//   }
// }
