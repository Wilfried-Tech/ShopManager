enum ReportType { mtn, orange, android, friandise, remede, callBox, reserve }

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
    case ReportType.callBox:
      return "assets/images/callbox.png";
    case ReportType.reserve:
      return "assets/images/reserve.jpeg";
    default:
      return "";
  }
}
