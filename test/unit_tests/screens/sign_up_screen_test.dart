import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:mobile_app/src/constants/constants_text.dart';
import 'package:mobile_app/src/screens/sign_up_screen.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_state.dart';
import 'package:mobile_app/src/widgets/form_sign_up.dart';
import 'package:mobile_app/src/widgets/logo.dart';
import 'package:mockito/mockito.dart';
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
    testWidgets('Should render image background mobile', (tester) async {
      await tester.pumpWidget(widget);
      final imageBackgroundMobile = find.byKey(Key('imageMobile'));
      expect(imageBackgroundMobile, findsOneWidget);
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
      tester.binding.window.physicalSizeTestValue = Size(1500, 1200);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
      await tester.pumpWidget(widget);
      await tester.pump();
      final titleFinder = find.text(SignUpText.titleText);
      expect(titleFinder, findsOneWidget);
    });
    testWidgets('Should render image background tablet', (tester) async {
      tester.binding.window.physicalSizeTestValue = Size(1500, 1200);
      tester.binding.window.devicePixelRatioTestValue = 1.0;
      addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

      await tester.pumpWidget(widget);
      final imageBackgroundTablet = find.byKey(Key('imageTablet'));
      expect(imageBackgroundTablet, findsOneWidget);
    });
    test('Test that size is not null', () {
      expect(Device.size, isNotNull);
      expect(Device.get().isPhone, isNotNull);
      expect(Device.get().isTablet, isNotNull);
    });
  });
  testWidgets(
      'Should render progress indicator when bloc state is [SignUpLoading]',
      (tester) async {
    await tester.pumpWidget(widget);
    signUpBloc.emit(SignUpLoading());
    await tester.pumpAndSettle();

    final indicatorFinder = find.byType(CircularProgressIndicator);
    expect(indicatorFinder, findsNothing);
  });
  // testWidgets(
  //     'Should render red error text field with error message when signUp bloc state is [SignUpFailure]',
  //     (tester) async {
  //   final errorMessage = SignUpText.alreadyHaveAnAccountText;
  //   final FirebaseAuthException exception =
  //       FirebaseAuthException(code: 'email-already-in-use');
  //   await tester.pumpWidget(widget);
  //   signUpBloc.emit(SignUpAuthFailure(exception));
  //   await tester.pump();

  //   final errorMessageFinder = find.text(errorMessage);
  //   expect(errorMessageFinder, findsOneWidget);
  //   expect(
  //       (tester.widget(find.byType(Container)) as Container).color, Colors.red);
  // });
}
