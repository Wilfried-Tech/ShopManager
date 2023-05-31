import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_manager/utils/helpers.dart';

class ReportItem extends StatelessWidget {
  const ReportItem(
      {super.key,
      required this.type,
      required this.title,
      required this.value});
  factory ReportItem.fromValue(
      {required ReportType type,
      required String title,
      required double value}) {
    return ReportItem(
        type: Image.asset(
          getImageFromReportType(type),
          semanticLabel: title,
          width: 70,
        ),
        title: Text(
          title.capitalize(),
          style: const TextStyle(fontSize: 18),
        ),
        value: Text(
          "$value FCFA",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ));
  }

  factory ReportItem.shimming() {
    int duration = 7000;
    return ReportItem(
        type: AnimatedOpacity(
          duration: Duration(milliseconds: duration),
          curve: Curves.easeInOut,
          opacity: Random().nextInt(10).isEven ? 1.0 : 0.5,
          child: Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        title: AnimatedOpacity(
          duration: Duration(milliseconds: duration),
          curve: Curves.easeInOut,
          opacity: Random().nextInt(10).isEven ? 1.0 : 0.5,
          child: Container(
            width: 70,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        value: AnimatedOpacity(
          duration: Duration(milliseconds: duration),
          curve: Curves.easeInOut,
          opacity: Random().nextInt(10).isEven ? 1.0 : 0.5,
          child: Container(
            width: 70,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ));
  }

  final Widget type;
  final Widget title;
  final Widget value;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            border: Border.all(color: Theme.of(context).primaryColorDark)),
        padding: const EdgeInsets.all(1),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        height: 70,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(color: Theme.of(context).primaryColorDark)),
          padding: const EdgeInsets.fromLTRB(7, 2.5, 2, 2.5),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                type,
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [title],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [value],
                      )
                    ],
                  ),
                ))
              ]),
        ));
  }
}
