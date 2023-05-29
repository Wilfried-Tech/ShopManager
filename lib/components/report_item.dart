import 'package:flutter/material.dart';
import 'package:shop_manager/utils/helpers.dart';

class ReportItem extends StatelessWidget {
  const ReportItem(
      {super.key,
      required this.type,
      required this.title,
      required this.value});

  final ReportType type;
  final String title;
  final double value;

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
          padding: const EdgeInsets.all(2),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  getImageFromReportType(type),
                  semanticLabel: title,
                  width: 70,
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: [
                          Text(
                            title,
                            style: const TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "$value FCFA",
                            style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ))
              ]),
        ));
  }
}
