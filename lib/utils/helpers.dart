import 'package:flutter/foundation.dart';

enum ReportType {
  mtn,
  orange,
  android,
  friandise,
  remede,
  callbox,
  reserve,
  cecaw
}

extension StringExtension on String {
  String capitalize() =>
      length > 0 ? "${this[0].toUpperCase()}${substring(1).toLowerCase()}" : '';
  String capitalizeAll() {
    return replaceAll(RegExp(" +"), ' ')
        .split(" ")
        .map((str) => str.capitalize())
        .join(" ");
  }
}

String getImageFromReportType(ReportType type) {
  switch (type) {
    case ReportType.mtn:
      return "assets/images/mtn.jpeg";
    case ReportType.orange:
      return "assets/images/orange.png";
    case ReportType.android:
      return "assets/images/smobilpay.png";
    case ReportType.friandise:
      return "assets/images/friandises.jpeg";
    case ReportType.remede:
      return "assets/images/remede.png";
    case ReportType.callbox:
      return "assets/images/callbox.png";
    case ReportType.reserve:
      return "assets/images/reserve.jpeg";
    case ReportType.cecaw:
      return "assets/images/cecaw.jpeg";
    default:
      return "";
  }
}

reportTypeByName(String name) {
  name = name == "smobilpay"? "android" : name;
  return ReportType.values.byName(name);
}

class Logger {
  static void log(Object? o){
    if (kDebugMode) {
      print(o);
    }
  }
}