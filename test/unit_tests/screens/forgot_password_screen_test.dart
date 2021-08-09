import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_device_type/flutter_device_type.dart';

import '../../../lib/src/blocs/reset_password_blocs/reset_password_bloc.dart';
import '../../../lib/src/screens/forgot_password_screen.dart';
import '../../config/route.dart' as router;
import '../../config/setup_firebase.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MyTypeFake extends Fake implements Route {}

main() {
  NavigatorObserver mockObserver;
  mockObserver = MockNavigatorObserver();
  setupCloudFirestoreMocks();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore.instance.settings =
        Settings(host: 'localhost:8082', sslEnabled: false);
    registerFallbackValue(MyTypeFake());
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
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    final iconImageFinder =
        tester.widget<Image>(find.byType(Image)).image as AssetImage;
    expect(iconImageFinder.assetName, 'assets/icons/logo_icon.png');
  });

  testWidgets('Should render icon name with correct name', (tester) async {
    await tester.pumpWidget(widget);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    final iconNameFinder = find.text('scratch');
    expect(iconNameFinder, findsOneWidget);
  });

  testWidgets('Should render Reset password text with correct text',
      (tester) async {
    await tester.pumpWidget(widget);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    final resetPasswordTextFinder = find.text('Reset password');
    expect(resetPasswordTextFinder, findsOneWidget);
  });

  testWidgets('Should render tutorial text with correct text', (tester) async {
    await tester.pumpWidget(widget);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    final tutorialTextFinder = find.text(
        "Enter the email associated with your account and we'll send an email with a link to reset your password.");
    expect(tutorialTextFinder, findsOneWidget);
  });

  testWidgets('Should render email text with correct text', (tester) async {
    await tester.pumpWidget(widget);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    final emailTextFinder = find.text('Email address');
    expect(emailTextFinder, findsOneWidget);
  });

  testWidgets('Should render a email TextFormField with correct TextFormField',
      (tester) async {
    await tester.pumpWidget(widget);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    final textFormFieldFinder = find.byType(TextFormField);
    expect(textFormFieldFinder, findsOneWidget);
  });

  testWidgets('Should render Send Button with correct Button', (tester) async {
    await tester.pumpWidget(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ResetPasswordBloc(),
        )
      ],
      child: MaterialApp(
        home: ForgotPasswordScreen(),
        onGenerateRoute: router.Router.generateRoute,
        navigatorObservers: [mockObserver],
      ),
    ));
    await tester.pumpAndSettle();
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.tap(find.widgetWithText(TextButton, 'Send'));
    verify(() => mockObserver.didPush(any(), any())).called(1);
  });

  testWidgets('Should render backgound image with correct image',
      (tester) async {
    Device.devicePixelRatio = 1;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);
    final backgroundImageFinder = find.descendant(
        of: find.byType(ShaderMask), matching: find.byType(Image));
    final backgoundImage =
        tester.widget<Image>(backgroundImageFinder).image as AssetImage;
    expect(backgoundImage.assetName, 'assets/images/background_image.png');
  });

  testWidgets('Should render tutorial with correct tutorial', (tester) async {
    Device.devicePixelRatio = 1;
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(widget);
    final tutorialFinder = find.text('Start from Scratch');
    expect(tutorialFinder, findsOneWidget);
  });
}
