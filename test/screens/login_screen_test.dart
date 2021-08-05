import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_core_platform_interface/firebase_core_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:mobile_app/src/blocs/login_blocs/login_blocs.dart";
import 'package:mobile_app/src/blocs/login_blocs/login_states.dart';
import 'package:mobile_app/src/constants/constants.dart';
import 'package:mobile_app/src/screens/login_screen.dart';
import 'package:mockito/mockito.dart';

import '../config/setup_firebase.dart';

// import '../config/setup_firebase.dart';

class MockLoginBloc extends Mock implements LoginBloc {}

void main() {
  setupCloudFirestoreMocks();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore.instance.settings =
        Settings(host: 'localhost:8082', sslEnabled: false);
  });

  final loginScreenWidget = MaterialApp(
    home: MultiBlocProvider(
      providers: [BlocProvider<LoginBloc>(create: (context) => LoginBloc())],
      child: LoginScreen(),
    ),
  );
  LoginBloc loginBloc = LoginBloc();
  group("mobile testing", () {
    testWidgets('Should render with correct title for mobile',
        (WidgetTester tester) async {
      await tester.pumpWidget(loginScreenWidget);
      await tester.pumpAndSettle();
      final titleFinder = find.text(AppLoginScreen.welcomeBack);

      expect(titleFinder, findsOneWidget);
    });
    testWidgets('Show render image background mobile', (tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1024, 768);
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(loginScreenWidget);
      tester.pumpAndSettle();
      final titleFinder = find.descendant(
          of: find.byType(Scaffold),
          matching: find.text(AppLoginScreen.welcomeBack));
      expect(titleFinder, findsOneWidget);
    });
    testWidgets('Should render a from sign up', (tester) async {
      // tester.binding.window.physicalSizeTestValue = Size(1500, 900);
      // tester.binding.window.devicePixelRatioTestValue = 1.0;
      // addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(loginScreenWidget);
      await tester.pump();
      final form = find.byType(Form);
      expect(form, findsOneWidget);
    });
  });
}
