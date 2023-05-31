import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/foundation.dart';

import 'balance.dart';

export 'config.dart';

export 'balance.dart';

void main() async {
  initializeDateFormatting("fr_FR");
  // String day = DateFormat("yyyy-MM-dd").format(DateTime.now());
  final client = RetryClient(http.Client());
  final response =
      await client.get(Uri.http("localhost", "api/shopmanager/reports/last"));

  if (response.statusCode == 200) {
    final balance = Balance.fromJSON(response.body).toMap();
    if (kDebugMode) {
      print(balance.toString());
    }
  }
}
