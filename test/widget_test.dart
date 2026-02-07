import 'package:flutter_test/flutter_test.dart';
import 'package:rideexpress_app/main.dart';

void main() {
  testWidgets('App builds without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const RidExpressApp());
    expect(find.text('RidExpress'), findsOneWidget);
  });
}
