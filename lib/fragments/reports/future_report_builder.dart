import 'package:flutter/material.dart';
import 'package:http/retry.dart';
import 'package:shop_manager/components/report_item.dart';
import 'package:http/http.dart' as http;
import 'package:shop_manager/core/core.dart';
import 'package:shop_manager/utils/helpers.dart';

class FutureReportBuilder extends StatelessWidget {
  const FutureReportBuilder({super.key, this.date, required this.setday});

  final String? date;
  final void Function(String) setday;

  Future<List<ReportItem>> _fetchReportData() async {
    String day = date == null ? "last" : date!;
    final client = RetryClient(http.Client());
    final response = await client.get(getRequestUrl("reports/$day"));

    if (response.statusCode == 200) {
      List<ReportItem> list = [];
        final balance = Balance.fromJSON(response.body).toMap();
        balance.forEach((key, value) {
          if (key != "day") {
            list.add(ReportItem.fromValue(
                type: reportTypeByName(key), title: key, value: value));
          }
        });
      setday(balance["day"]);
      return list;
    } else {
      throw Exception(
          "Couldn't fetch data now, check your connection and retry");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchReportData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (context, index) {
              return snapshot.data?.elementAt(index);
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Retry"),
          ); //build(context);
        } else {
          return ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return ReportItem.shimming();
            },
          );
        }
      },
    );
  }
}
