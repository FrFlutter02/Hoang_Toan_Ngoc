import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/validators.dart';
import 'sign_up_event.dart';
import 'sign_up_state.dart';
import '../../repository/user_repository.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial());
  var checkFullNameFireBase;
  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    final UserRepository _userRepository = UserRepository();
    switch (event.runtimeType) {
      case SignUpSubmitted:
        event as SignUpSubmitted;
        yield SignUpLoading();
        if (Validators.isValidEmail(event.email)) {
          yield SignUpEmailValidatorsSuccess();
        } else {
          yield SignUpEmailValidatorsFailure();
        }

        if (Validators.isValidPassword(event.password)) {
          yield SignUpPassWordValidatorsSuccess();
        } else {
          yield SignUpPassWordValidatorsFailure();
        }

        if (event.fullName.isNotEmpty) {
          yield SignUpFullNameValidatorsSuccess();
        } else {
          yield SignUpFullNameValidatorsFailure();
        }
        try {
          checkFullNameFireBase = null;
          await FirebaseFirestore.instance
              .collection("users")
              .where("fullName", isEqualTo: event.fullName)
              .get()
              .then((value) {
            value.docs.forEach((result) {
              checkFullNameFireBase = result.data();
            });
          });
        } on FirebaseFirestore catch (e) {
          print(e);
        }
        if (checkFullNameFireBase != null) {
          yield SignUpFullNameAlreadyExist();
        }

        if (Validators.isValidEmail(event.email) &&
            Validators.isValidPassword(event.password) &&
            event.fullName.isNotEmpty &&
            checkFullNameFireBase == null) {
          try {
            yield SignUpLoading();
            UserCredential userCredential = await _userRepository.signUp(
                event.email, event.password, event.fullName);
            User? user = userCredential.user;
            yield SignUpSuccess(user!);
          } on FirebaseAuthException catch (exception) {
            print(exception);
            yield SignUpAuthFailure(exception);
          } catch (e) {
            print(e);
          }
        }
        break;
    }
  }
}
