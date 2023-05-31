import 'dart:convert';

import 'package:intl/intl.dart' show DateFormat;

class Balance {
  Balance(this.day, this.mtn, this.orange, this.smobilpay, this.friandise,
      this.remede, this.callbox, this.reserve, this.cecaw);

  factory Balance.fromJSON(String json) {
    var data = jsonDecode(json);
    return Balance(
        DateFormat("yyyy-MM-dd").parse(data["day"]),
        int.parse(data["mtn"]),
        int.parse(data["orange"]),
        int.parse(data["smobilpay"]),
        int.parse(data["friandise"]),
        int.parse(data["remede"]),
        int.parse(data["callbox"]),
        int.parse(data["reserve"]),
        int.parse(data["cecaw"]));
  }

  DateTime day;
  int mtn, orange, smobilpay, friandise, remede, callbox, reserve, cecaw;

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
