import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_app/src/constants/constants_text.dart';
import 'package:mobile_app/src/widgets/logo.dart';

main() {
  final widget = MaterialApp(home: Logo());

  testWidgets('Should render with correct app name', (tester) async {
    await tester.pumpWidget(widget);
    await tester.pumpAndSettle();
    final appNameFinder = find.text(AppConstantsText.nameApp);
    expect(appNameFinder, findsOneWidget);
  });
  testWidgets('Should render a logo icon', (tester) async {
    await tester.pumpWidget(widget);
    final _image =
        find.descendant(of: find.byType(Padding), matching: find.byType(Image));
    final _imageFinder = tester.widget<Image>(_image).image as AssetImage;
    expect(_imageFinder.assetName, AppIcons.imageLogoPath);
  });
}
