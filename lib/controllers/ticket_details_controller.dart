import 'dart:convert';

import 'package:babuland/models/ticket_details_model.dart';
import 'package:http/http.dart' as http;

Future<TicketDetailsModel> getTicketDetailsData(String order_id) async {
  http.Response response;

  response = await http.get(
      Uri.parse(
        'http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_dt',
      ),
      headers: {'ORDER_ID': order_id});

  if (response.statusCode == 200) {
    print(response.body);
    return TicketDetailsModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load');
  }
}
