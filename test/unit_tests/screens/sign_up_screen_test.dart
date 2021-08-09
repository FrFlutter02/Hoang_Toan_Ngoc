import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:mobile_app/src/constants/constants_text.dart';
import 'package:mobile_app/src/screens/sign_up_screen.dart';
import 'package:mobile_app/src/widgets/form_sign_up.dart';
import 'package:mobile_app/src/widgets/logo.dart';

import '../../config/setup_firebase.dart';

class MockSignUpBloc extends Mock implements SignUpBloc {}

class MockDevice extends Mock implements Device {}

main() {
  setupCloudFirestoreMocks();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore.instance.settings =
        Settings(host: 'localhost:8082', sslEnabled: false);
  });

  final widget = MaterialApp(
    home: MultiBlocProvider(providers: [
      BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
    ], child: SignUpScreen()),
  );
  SignUpBloc signUpBloc = SignUpBloc();
  group('Mobile testing', () {
    testWidgets('Should render with correct title for mobile', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();
      final titleFinder = find.text(SignUpText.titleMobileText);
      expect(titleFinder, findsOneWidget);
    });

    testWidgets('Should render a logo', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pump();
      final logo = find.byType(Logo);
      expect(logo, findsOneWidget);
    });
    testWidgets('Should render a from sign up', (tester) async {
      await tester.pumpWidget(widget);
      await tester.pump();
      final form = find.byType(FormSignUp);
      expect(form, findsOneWidget);
    });
  });
  group('Tablet testing', () {
    testWidgets('TabLet Should render with correct title for tabLet',
        (tester) async {
      Device.devicePixelRatio = 1;
      await tester.pumpWidget(widget);
      await tester.pump();
      final titleFinder = find.text(SignUpText.titleText);
      expect(titleFinder, findsOneWidget);
    });
    testWidgets('Should render a logo', (tester) async {
      Device.devicePixelRatio = 1;
      await tester.pumpWidget(widget);
      await tester.pump();
      final logo = find.byType(Logo);
      expect(logo, findsOneWidget);
    });
    testWidgets('Should render a background image', (tester) async {
      Device.devicePixelRatio = 1;
      await tester.pumpWidget(widget);
      final _image = find.descendant(
          of: find.byType(ShaderMask), matching: find.byType(Image));
      final _imageFinder = tester.widget<Image>(_image).image as AssetImage;
      expect(_imageFinder.assetName, AppImages.imageSignUpPath);
    });
    testWidgets('Should render a from sign up', (tester) async {
      Device.devicePixelRatio = 1;
      await tester.pumpWidget(widget);
      await tester.pump();
      final form = find.byType(FormSignUp);
      expect(form, findsOneWidget);
    });
  });
}
