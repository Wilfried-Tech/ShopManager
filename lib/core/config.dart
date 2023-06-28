
import 'package:flutter/foundation.dart';


String _requestPath = "/api/shopmanager";

Uri _requestUri = (kReleaseMode)
    ?  Uri.http("localhost", _requestPath)
    : Uri.http("localhost", _requestPath);

Uri getRequestUrl(String path) {
  return _requestUri.replace(path: "$_requestPath/$path");
}