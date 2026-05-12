import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_5/main.dart';

void main() {
  testWidgets('renders seven xylophone keys', (WidgetTester tester) async {
    await tester.pumpWidget(const XylophoneApp());

    expect(find.text('Xylophone'), findsNWidgets(7));
    expect(find.byType(XylophoneScreen), findsOneWidget);
  });
}
