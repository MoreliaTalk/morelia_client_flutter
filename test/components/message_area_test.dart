import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:morelia_client_flutter/components/common/message_area.dart';

void main() {
  testWidgets('Test widget "Message" create', (WidgetTester tester) async {
    Message messageWidget =
        const Message(text: "Hello!", type: TypesMessages.my);
    await tester.pumpWidget(MaterialApp(home: messageWidget));

    var widgetFinder = find.byWidget(messageWidget);
    expect(widgetFinder, findsOneWidget);

    Message foundedWidget = tester.firstWidget(widgetFinder);
    Text foundedText = tester.firstWidget(find.text("Hello!"));
    assert(
        foundedText.data == foundedWidget.text && foundedText.data == "Hello!");
  });

  testWidgets('Test widget "Message"(type "my") create',
      (WidgetTester tester) async {
    Message messageWidget =
        const Message(text: "Hello!", type: TypesMessages.my);
    await tester.pumpWidget(MaterialApp(home: messageWidget));

    var widgetFinder = find.byWidget(messageWidget);
    expect(widgetFinder, findsOneWidget);

    Message foundedWidget = tester.firstWidget(widgetFinder);
    assert(foundedWidget.type == TypesMessages.my);
  });

  testWidgets('Test widget "Message"(type "otherUser") create',
      (WidgetTester tester) async {
    Message messageWidget =
        const Message(text: "Hello!", type: TypesMessages.otherUser);
    await tester.pumpWidget(MaterialApp(home: messageWidget));

    var widgetFinder = find.byWidget(messageWidget);
    expect(widgetFinder, findsOneWidget);

    Message foundedWidget = tester.firstWidget(widgetFinder);
    assert(foundedWidget.type == TypesMessages.otherUser);
  });

  testWidgets('Test message_area create', (WidgetTester tester) async {
    MessageArea messageAreaWidget = const MessageArea(messagesList: [
      Message(text: "Hello!", type: TypesMessages.my),
      Message(text: "Hello!", type: TypesMessages.my),
      Message(text: "Hello!", type: TypesMessages.my),
      Message(text: "Hello!", type: TypesMessages.my),
      Message(text: "Hello!", type: TypesMessages.my),
    ]);
    await tester.pumpWidget(MaterialApp(home: messageAreaWidget));
    expect(find.byWidget(messageAreaWidget), findsOneWidget);
    expect(find.text("Hello!"), findsNWidgets(5));
  });
}
