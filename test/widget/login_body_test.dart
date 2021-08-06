import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mobile_app/src/blocs/login_blocs/login_blocs.dart';
import 'package:mobile_app/src/constants/constants.dart';
import 'package:mobile_app/src/widgets/login_body.dart';

import '../config/setup_firebase.dart';

main() {
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
        create: (context) => LoginBloc(),
      )
    ],
    child: MaterialApp(
      home: Login_Body(
        Height: 467,
        Width: 425,
      ),
    ),
  );
  group("login body test testing", () {
    testWidgets('Should render email text with correct text', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final emailtext = find.text(AppLoginScreen.emailHint);
      expect(emailtext, findsOneWidget);
    });
    testWidgets('Should render  TextFormField ', (tester) async {
      await tester.pumpWidget(widget);
      final emailTextFormField = find.byType(TextFormField);
      expect(emailTextFormField, findsWidgets);
    });

    testWidgets('Should render a Login with correct Button', (tester) async {
      await tester.pumpWidget(widget);
      final loginButton = find.byType(TextButton);
      expect(loginButton, findsWidgets);
    });
  });
}
