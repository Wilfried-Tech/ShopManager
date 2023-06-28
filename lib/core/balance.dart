import 'dart:convert';

import 'package:intl/intl.dart' show DateFormat;

class Balance {
  Balance(this.day, this.mtn, this.orange, this.smobilpay, this.friandise,
      this.remede, this.callbox, this.reserve, this.cecaw);

  factory Balance.fromJSON(String json) {
    var data = jsonDecode(json);
    return Balance(
        DateFormat("yyyy-MM-dd").parse(data["day"]),
        double.parse(data["mtn"]),
        double.parse(data["orange"]),
        double.parse(data["smobilpay"]),
        double.parse(data["friandise"]),
        double.parse(data["remede"]),
        double.parse(data["callbox"]),
        double.parse(data["reserve"]),
        double.parse(data["cecaw"]));
  }

  DateTime day;
  double mtn, orange, smobilpay, friandise, remede, callbox, reserve, cecaw;

  Map<String, dynamic> toMap() {
    return {
      "day": DateFormat("yyyy-MM-dd").format(day),
      "mtn": mtn,
      "orange": orange,
      "smobilpay": smobilpay,
      "friandise": friandise,
      "remede": remede,
      "callbox": callbox,
      "reserve": reserve,
      "cecaw": cecaw
    };
  }
}
