import 'package:flutter_test/flutter_test.dart';
import 'package:kinsen_ops/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinsen_ops/app.dart';

void main() {
  testWidgets('System Scan: All main tabs should load without errors', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: KinsenOpsApp(),
      ),
    );

    // Verify Fleet (Initial)
    expect(find.text('Fleet Management'), findsOneWidget);

    // Navigate to Washers
    await tester.tap(find.text('Washers'));
    await tester.pumpAndSettle();
    expect(find.text('Washers Dashboard'), findsOneWidget);

    // Navigate to Shifts
    await tester.tap(find.text('Shifts'));
    await tester.pumpAndSettle();
    expect(find.text('Weekly Schedule'), findsOneWidget);

    // Navigate to Chat
    await tester.tap(find.text('Chat'));
    await tester.pumpAndSettle();
    expect(find.text('Conversations'), findsOneWidget);

    // Navigate to Intelligence
    await tester.tap(find.text('Intelligence'));
    await tester.pumpAndSettle();
    expect(find.text('Intelligence & Imports'), findsOneWidget);
  });
}
