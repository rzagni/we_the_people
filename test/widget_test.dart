import 'package:flutter_test/flutter_test.dart';
import 'package:we_the_people/app/app.dart';

void main() {
  testWidgets('app builds', (WidgetTester tester) async {
    await tester.pumpWidget(const WeThePeopleApp());
    expect(find.text('We the People'), findsOneWidget);
  });
}
