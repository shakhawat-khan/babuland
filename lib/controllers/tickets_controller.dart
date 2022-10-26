import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/tickets_model.dart';

Future<TicketModel> getTicketData() async {
  http.Response response;

  response = await http.get(
      Uri.parse(
        'http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_ms',
      ),
      headers: {'MOBILE_NUMBER': '01717956094'});

  if (response.statusCode == 200) {
    // print(response.body);
    return TicketModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}
