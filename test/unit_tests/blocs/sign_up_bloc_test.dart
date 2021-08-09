import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_event.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_state.dart';
import 'package:mockito/mockito.dart';

import '../../config/setup_firebase.dart';

main() {
  setupCloudFirestoreMocks();
  SignUpBloc signUpBloc = SignUpBloc();
  String email = 'aaa@mail.com';
  String passWord = "123456Aa!";
  String fullName = "aaaa";
  User? user;
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore.instance.settings =
        Settings(host: 'localhost:8082', sslEnabled: false);
    signUpBloc = SignUpBloc();
  });

  tearDown(() {
    signUpBloc.close();
  });

  blocTest('emits [] when no event is added',
      build: () => SignUpBloc(), expect: () => []);

  blocTest(
    'emits [SignUpLoading] then [SignUpSuccess] when [SignUpSubmitted] is called',
    build: () {
      return SignUpBloc();
    },
    act: (SignUpBloc bloc) =>
        bloc.add(SignUpSubmitted(email, passWord, fullName)),
    expect: () => [SignUpLoading(), SignUpSuccess(user!)],
  );

  blocTest(
    'emits [SignUpLoading] then [SignUpFullNameValidatorsFailure] when [SignUpSubmitted] is called with email empty',
    build: () {
      return SignUpBloc();
    },
    act: (SignUpBloc bloc) => bloc.add(SignUpSubmitted("", passWord, fullName)),
    expect: () => [
      SignUpLoading(),
      SignUpEmailValidatorsFailure(),
      SignUpPassWordValidatorsSuccess(),
      SignUpFullNameValidatorsSuccess()
    ],
  );

  blocTest(
    'emits [SignUpLoading] then [SignUpPassWordValidatorsFailure] when [SignUpSubmitted] is called with passWord empty',
    build: () {
      return SignUpBloc();
    },
    act: (SignUpBloc bloc) => bloc.add(SignUpSubmitted(email, "", fullName)),
    expect: () => [
      SignUpLoading(),
      SignUpEmailValidatorsSuccess(),
      SignUpPassWordValidatorsFailure(),
      SignUpFullNameValidatorsSuccess()
    ],
  );

  blocTest(
    'emits [SignUpLoading] then [SignUpFullNameValidatorsFailure] when [SignUpSubmitted] is called with fullName empty',
    build: () {
      return SignUpBloc();
    },
    act: (SignUpBloc bloc) => bloc.add(SignUpSubmitted(email, passWord, "")),
    expect: () => [
      SignUpLoading(),
      SignUpEmailValidatorsSuccess(),
      SignUpPassWordValidatorsSuccess(),
      SignUpFullNameValidatorsFailure()
    ],
  );
}
