import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/components/message_area.dart';

void main() {
  testWidgets('Test message widget', (WidgetTester tester) async {
    Message messageWidget = const Message(text: "Hello!", type: TypesMessages.my);
    await tester.pumpWidget(MaterialApp(home: messageWidget));

    expect(find.byWidget(messageWidget), findsOneWidget);
    expect(find.text("Hello!"), findsOneWidget);
  });
}