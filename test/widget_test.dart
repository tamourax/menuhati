import 'package:flutter_test/flutter_test.dart';
import 'package:menuhati/app.dart';

void main() {
  testWidgets('Onboarding screen loads smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Discover Cafés'), findsOneWidget);
  });
}
