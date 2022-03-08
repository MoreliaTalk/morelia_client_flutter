import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:morelia_client_flutter/components/communication_page.dart';
import 'package:morelia_client_flutter/components/message_area.dart';

void main() {
  testWidgets('Test widget "CommunicationPage" create',
      (WidgetTester tester) async {
    CommunicationPage comPageWidget = const CommunicationPage(uuid: "123");
    await tester.pumpWidget(MaterialApp(home: comPageWidget));

    var widgetFinder = find.byWidget(comPageWidget);
    expect(widgetFinder, findsOneWidget);

    CommunicationPage foundedWidget = tester.firstWidget(widgetFinder);
    assert(foundedWidget.uuid == "123");

    expect(find.byType(MessageArea), findsOneWidget);
  });
}
