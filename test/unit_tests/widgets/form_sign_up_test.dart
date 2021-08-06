import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:mobile_app/src/constants/constants_text.dart';
import 'package:mobile_app/src/widgets/form_sign_up.dart';
// import 'package:mockito/mockito.dart';
import 'package:mocktail/mocktail.dart';

import '../../config/setup_firebase.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MyTypeFake extends Fake implements Route {}

main() {
  NavigatorObserver mockObserver;
  mockObserver = MockNavigatorObserver();
  setupCloudFirestoreMocks();

  setUpAll(() async {
    registerFallbackValue(MyTypeFake());
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore.instance.settings =
        Settings(host: 'localhost:8082', sslEnabled: false);
  });
  final widget = MaterialApp(
      home: MultiBlocProvider(providers: [
    BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
  ], child: FormSignUp()));
  testWidgets('Should render with correct subtitle', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    final subtitleFinder = find.text(SignUpText.createAccountToContinueText);
    expect(subtitleFinder, findsOneWidget);
  });
  testWidgets('Should render with correct label fullName', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    final labelFullNameFinder = find.text(SignUpText.fullNameText);
    expect(labelFullNameFinder, findsOneWidget);
  });
  testWidgets('Should render with correct label email', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    final labelEmailFinder = find.text(SignUpText.emailText);
    expect(labelEmailFinder, findsOneWidget);
  });
  testWidgets('Should render with correct label passWord', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    final labelPassWordFinder = find.text(SignUpText.passwordText);
    expect(labelPassWordFinder, findsOneWidget);
  });
  testWidgets('Should render with correct footer title ', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    final footerTitleFinder = find.text(SignUpText.alreadyHaveAnAccountText);
    expect(footerTitleFinder, findsOneWidget);
  });
  testWidgets('Should render with button login here', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    final formFinder = find.byType(InkWell);
    final inkWellFinder = find.descendant(
        of: formFinder, matching: find.text(SignUpText.loginHereText));
    expect(inkWellFinder, findsOneWidget);
  });
  testWidgets('Should navigation to login screen', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: FormSignUp(),
      navigatorObservers: [mockObserver],
    ));
    await tester.pumpAndSettle();
    await tester.tap(find.byType(InkWell));
    await tester.pumpAndSettle();
    verify(() => mockObserver.didPush(any(), any())).called(1);
  });
}
