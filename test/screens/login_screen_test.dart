import 'dart:js';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import "package:mobile_app/src/blocs/login_blocs/login_blocs.dart";
import 'package:mobile_app/src/blocs/login_blocs/login_states.dart';
import 'package:mobile_app/src/constants/constants.dart';
import "package:mobile_app/src/screens/login_screen.dart";
import 'package:mockito/mockito.dart';

class MockLoginBloc extends Mock implements LoginBloc {}

void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  Firebase.initializeApp();
  final LoginScreenWidget = MaterialApp(
    home: MultiBlocProvider(
      providers: [BlocProvider<LoginBloc>(create: (context) => LoginBloc())],
      child: LoginScreen(),
    ),
  );
  LoginBloc loginBloc = LoginBloc();
  testWidgets('Should render with correct title for mobile',
      (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(812, 375);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);
    await tester.pumpWidget(LoginScreenWidget);
    tester.pumpAndSettle();
    final titleFinder = find.descendant(
        of: find.byType(Scaffold),
        matching: find.text(AppLoginScreen.welcomeBack));
    expect(titleFinder, findsOneWidget);
  });
  testWidgets('Should render with correct title for tabLet', (tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1024, 768);
    addTearDown(tester.binding.window.clearPhysicalSizeTestValue);

    await tester.pumpWidget(LoginScreenWidget);
    tester.pumpAndSettle();
    final titleFinder = find.descendant(
        of: find.byType(Scaffold),
        matching: find.text(AppLoginScreen.welcomeBack));
    expect(titleFinder, findsOneWidget);
  });
  testWidgets(
      'Should render progress indicator when bloc state is [LoginLoading]',
      (tester) async {
    await tester.pumpWidget(LoginScreenWidget);
    loginBloc.emit(LoginLoading());
    await tester.pumpAndSettle();

    final titleFinder = find.descendant(
        of: find.byType(Scaffold), matching: find.text("Loading"));
    expect(titleFinder, findsOneWidget);
  });
}
