import 'package:apppocsa/src/components/visual/appBar/appBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar: AppBarWidget("Prueba"),
      )
    ));
    expect(find.text('Prueba'), findsOneWidget);
  });
}