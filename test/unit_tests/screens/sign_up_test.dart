import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:mobile_app/src/constants/constants_text.dart';
import 'package:mobile_app/src/screens/sign_up_screen.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

class MockSignUpBloc extends Mock implements SignUpBloc {}

main() {
  Firebase.initializeApp();
  final widget = MaterialApp(
    home: MultiBlocProvider(providers: [
      BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
    ], child: SignUpScreen()),
  );
  SignUpBloc signUpBloc = SignUpBloc();

  testWidgets('Should render with correct title for mobile', (tester) async {
    tester.binding.window.physicalSizeTestValue = Size(812, 375);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(widget);
    tester.pumpAndSettle();
    final titleFinder = find.descendant(
        of: find.byType(Scaffold),
        matching: find.text(SignUpText.titleMobileText));
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('Should render with correct title for tabLet', (tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1024, 768);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(widget);
    tester.pumpAndSettle();
    final titleFinder = find.descendant(
        of: find.byType(Scaffold), matching: find.text(SignUpText.titleText));
    expect(titleFinder, findsOneWidget);
  });

  testWidgets(
      'Should render progress indicator when bloc state is [SignUpLoading]',
      (tester) async {
    await tester.pumpWidget(widget);
    signUpBloc.emit(SignUpLoading());
    await tester.pumpAndSettle();

    final indicatorFinder = find.byType(CircularProgressIndicator);
    expect(indicatorFinder, findsOneWidget);
  });
  testWidgets(
      'Should render red error text field with error message when signUp bloc state is [SignUpFailure]',
      (tester) async {
    final errorMessage = SignUpText.alreadyHaveAnAccountText;
    final FirebaseAuthException exception =
        FirebaseAuthException(code: 'email-already-in-use');
    await tester.pumpWidget(widget);
    signUpBloc.emit(SignUpAuthFailure(exception));
    await tester.pump();

    final errorMessageFinder = find.text(errorMessage);
    expect(errorMessageFinder, findsOneWidget);
    expect(
        (tester.widget(find.byType(Container)) as Container).color, Colors.red);
  });
}
