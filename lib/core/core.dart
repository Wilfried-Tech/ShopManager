import 'package:http/http.dart' as http;

void main() {
  const headers = <String, String>{};

  http
      .get(Uri.http('localhost', 'shopmanager'), headers: headers)
      .then((value) {
    print(value.body);
  });
}
