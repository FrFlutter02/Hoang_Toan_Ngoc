import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../../lib/src/blocs/reset_password_blocs/reset_password_bloc.dart';
import '../../../lib/src/blocs/reset_password_blocs/reset_password_event.dart';
import '../../../lib/src/blocs/reset_password_blocs/reset_password_state.dart';
import '../../config/setup_firebase.dart';
import '../../../lib/src/utils/validators.dart';

void main() async {
  setupCloudFirestoreMocks();
  TestWidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  ResetPasswordBloc resetPasswordBloc = ResetPasswordBloc();

  blocTest<ResetPasswordBloc, ResetPasswordState>(
      'emits [EmailChangeSuccess] when [EmailChanged] is added.',
      build: () => resetPasswordBloc,
      act: (bloc) => bloc.add(EmailChanged(email: 'htn.flutter02.com')),
      expect: () => [
            EmailChangeSuccess(
                isValidEmail: Validators.isValidEmail('htn.flutter02.com'))
          ]);

  blocTest<ResetPasswordBloc, ResetPasswordState>(
      'emits [ResetPasswordSubmitSuccess] when [ResetPasswordSubmitted] is added.',
      build: () => resetPasswordBloc,
      act: (bloc) =>
          bloc.add(ResetPasswordSubmitted(email: 'htn.flutter02.com')),
      expect: () => [ResetPasswordSubmitSuccess(success: true)]);
}
