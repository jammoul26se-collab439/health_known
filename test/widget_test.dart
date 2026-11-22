import 'package:flutter_test/flutter_test.dart';
import 'package:health_known/screens/loading_screen.dart';
import 'package:flutter/material.dart';
void main() {
  testWidgets('Loading screen test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoadingScreen(),
      ),
    );

    expect(find.text('Loading ...'), findsOneWidget);
  });
}