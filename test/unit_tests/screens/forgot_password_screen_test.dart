import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../../lib/src/blocs/reset_password_blocs/reset_password_bloc.dart';
import '../../../lib/src/screens/forgot_password_screen.dart';
import '../../config/setup_firebase.dart';

main() async {
  setupCloudFirestoreMocks();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore.instance.settings =
        Settings(host: 'localhost:8082', sslEnabled: false);
  });

  final widget = MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ResetPasswordBloc(),
      )
    ],
    child: MaterialApp(
      home: ForgotPasswordScreen(),
    ),
  );

  testWidgets('Should render icon image with correct image', (tester) async {
    await tester.pumpWidget(widget);
    final iconImage = find.byKey(Key('iconImage'));
    expect(iconImage, findsOneWidget);
  });

  testWidgets('Should render icon name with correct name', (tester) async {
    await tester.pumpWidget(widget);
    final iconName = find.text('scratch');
    expect(iconName, findsOneWidget);
  });

  testWidgets('Should render Reset password text with correct text',
      (tester) async {
    await tester.pumpWidget(widget);
    final resetPasswordText = find.text('Reset password');
    expect(resetPasswordText, findsOneWidget);
  });

  testWidgets('Should render tutorial text with correct text', (tester) async {
    await tester.pumpWidget(widget);
    final tutorialText = find.text(
        "Enter the email associated with your account and we'll send an email with a link to reset your password.");
    expect(tutorialText, findsOneWidget);
  });

  testWidgets('Should render email text with correct text', (tester) async {
    await tester.pumpWidget(widget);
    final emailtext = find.text('Email address');
    expect(emailtext, findsOneWidget);
  });

  testWidgets('Should render a email TextFormField with correct TextFormField',
      (tester) async {
    await tester.pumpWidget(widget);
    final emailTextFormField = find.byKey(Key('enterEmailAddress'));
    expect(emailTextFormField, findsOneWidget);
  });

  testWidgets('Should render a Send Button with correct Button',
      (tester) async {
    await tester.pumpWidget(widget);
    final sendButton = find.widgetWithText(TextButton, 'Send');
    expect(sendButton, findsOneWidget);
  });
}
