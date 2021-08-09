import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:mobile_app/src/blocs/sign_up_bloc/sign_up_state.dart';
import 'package:mobile_app/src/constants/constants_text.dart';
import 'package:mobile_app/src/widgets/form_sign_up.dart';
import 'package:mocktail/mocktail.dart';
import '../../config/setup_firebase.dart';
import '../../config/route_help.dart' as router;

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
  SignUpBloc signUpBloc = SignUpBloc();
  final widget = MaterialApp(
    home: MultiBlocProvider(providers: [
      BlocProvider<SignUpBloc>(create: (context) => SignUpBloc()),
    ], child: FormSignUp()),
    onGenerateRoute: router.Router.generateRoute,
    navigatorObservers: [mockObserver],
  );
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
    final inWellFinder = find.byType(InkWell);
    final btnFinder = find.descendant(
        of: inWellFinder, matching: find.text(SignUpText.loginHereText));
    expect(btnFinder, findsOneWidget);
  });
  testWidgets('Should navigation to login screen', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    final _columnFinder = find.byType(Column);
    final _inkWellFinder =
        find.descendant(of: _columnFinder, matching: find.byType(InkWell));
    final _textFinder = find.descendant(
        of: _inkWellFinder, matching: find.text(SignUpText.loginHereText));
    await tester.tap(_textFinder);
    await tester.pumpAndSettle();
    verify(() => mockObserver.didPush(any(), any())).called(2);
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
}
