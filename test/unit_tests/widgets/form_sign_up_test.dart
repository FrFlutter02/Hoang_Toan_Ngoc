import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/src/constants/constants_text.dart';
import 'package:mobile_app/src/widgets/form_sign_up.dart';

import '../../config/setup_firebase.dart';

main() {
  setupCloudFirestoreMocks();

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    FirebaseFirestore.instance.settings =
        Settings(host: 'localhost:8082', sslEnabled: false);
  });
  final widget = MaterialApp(home: FormSignUp());
  testWidgets('Should render with correct app name', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    final appNameFinder = find.text(AppConstantsText.nameApp);
    expect(appNameFinder, findsOneWidget);
  });
}
