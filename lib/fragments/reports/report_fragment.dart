import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_manager/fragments/fragment.dart';
import 'package:shop_manager/fragments/reports/future_report_builder.dart';
import 'package:shop_manager/utils/helpers.dart';

class ReportFragment extends Fragment {
  const ReportFragment(super.parentState, {super.key});

  @override
  State<ReportFragment> createState() => ReportFragmentState();

  @override
  void optionPressed() {}
}

class ReportFragmentState extends State<ReportFragment> {
  final String _day = "last";
  String _sday = "";
  
  void setday(String s) => setState(() => _sday = DateFormat.yMMMMEEEEd("fr_FR").format(DateFormat("yyyy-MM-dd").parse(s)));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        primary: false,
        floatingActionButton: FloatingActionButton(
          onPressed: widget.optionPressed,
          tooltip: "Nouveau rapport",
          child: const Icon(Icons.add),
        ),
        body: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(5),
              child: Text(
                _sday.capitalizeAll(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(child: FutureReportBuilder(date: _day, setday: setday))
          ],
        ));
  }
}
