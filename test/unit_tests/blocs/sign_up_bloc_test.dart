import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_event.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_state.dart';
import 'package:mockito/mockito.dart';

class MockUserCredentialMock extends Mock implements UserCredential {}

main() {
  SignUpBloc? signUpBloc;
  MockUserCredentialMock userCredential;
  setUp(() {
    userCredential = MockUserCredentialMock();
    signUpBloc = SignUpBloc();
  });

  tearDown(() {
    signUpBloc?.close();
  });
  blocTest('emits [] when no event is added',
      build: () => SignUpBloc(), expect: () => []);

  // blocTest(
  //   'emits [SignUpInProgress] then [SignUpSuccess] when [SignUpRequested] is called',
  //   build: () {
  //     return SignUpBloc();
  //   },
  //   act: (SignUpBloc bloc) => bloc.add(SignUpSubmitted("aaa", "aaa", "aaa")),
  //   expect: () => [
  //     SignUpLoading(),
  //     // SignUpSuccess(userRepository),
  //   ],
  // );
}
