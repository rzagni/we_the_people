import 'package:flutter_test/flutter_test.dart';
import 'package:we_the_people_admin/app/app.dart';

void main() {
  testWidgets('admin app loads survey screen', (WidgetTester tester) async {
    await tester.pumpWidget(const WeThePeopleAdminApp());
    await tester.pumpAndSettle();

    expect(find.text('Admin - Create Survey'), findsOneWidget);
    expect(find.text('Create Survey'), findsOneWidget);
  });
}
