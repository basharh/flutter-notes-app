import 'package:flutter_notes_app/widgets/notes/single_note_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/test_material_app.dart';

void main() {
  group('SingleNoteCard', () {
    testWidgets('golden test', (tester) async {
      await tester.setScreenSize(width: 400, height: 150);

      await tester.pumpWidget(
        TestMaterialApp(
          child: SingleNoteCard(
            onTap: () {},
            title: 'Greeting',
            content: 'Hello, world! This is a sample note.',
          ),
        ),
      );

      await expectLater(
        find.byType(TestMaterialApp),
        matchesGoldenFile('golden/single_note_card.png'),
      );
    });
  });
}
