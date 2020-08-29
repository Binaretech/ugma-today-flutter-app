import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:ugma_today/config/config.dart';
import 'package:ugma_today/routes/api_routes.dart';
import 'package:ugma_today/screens/home.dart';
import 'package:ugma_today/utils/http/http.dart';
import 'package:ugma_today/widgets/costs_list.dart';
import '../helper.dart';

class MockRequest extends Mock implements http.Client {}

void main() {
  final costs = {
    'data': List.generate(
        10,
        (index) => {
              'name': 'name$index',
              'comment': 'asdadasdasd',
              'currency': 0,
              'currencyName': 'Bs',
              'id': index,
              'price': (index + 1 * 100).toString(),
            })
  };

  testWidgets('show home screen', (WidgetTester tester) async {
    http.Client client = MockRequest();
    when(client.get('${config('url')}/${apiRoutes.cost}'))
        .thenAnswer((_) async => http.Response(jsonEncode(costs), 200));

    Request.customClient = client;

    await tester.pumpWidget(
      makeReduxTestableWidget(child: Home()),
    );

    await tester.pumpAndSettle();

    expect(find.byType(CostList), findsWidgets);
  });
}