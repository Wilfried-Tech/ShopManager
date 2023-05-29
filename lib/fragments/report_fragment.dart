import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shop_manager/components/report_item.dart';
import 'package:shop_manager/fragments/fragment.dart';
import 'package:shop_manager/utils/helpers.dart';

class ReportFragment extends Fragment {
  const ReportFragment(super.parentState, {super.key});

  @override
  State<ReportFragment> createState() => _ReportFragmentState();

  @override
  void optionPressed() {}
}

class _ReportFragmentState extends State<ReportFragment> {
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
                DateFormat.yMMMMEEEEd("fr_FR")
                    .format(DateTime.now())
                    .capitalizeAll(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const ReportItem(
                        type: ReportType.friandise,
                        title: "Reserve",
                        value: 40000);
                  }),
            )
          ],
        ));
  }
}
