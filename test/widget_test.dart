import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:aballe_mobprog/main.dart';

void main() {
  testWidgets('App launches successfully', (WidgetTester tester) async {
    await tester.pumpWidget(const RoblesFacebook());

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}