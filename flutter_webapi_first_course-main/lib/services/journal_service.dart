import 'package:http/http.dart' as http;

class JournalService {
  static const String url = "http://192.168.0.99:3000/";
  static const String resource = "learnhttp";

  String getUrl() {
    return "$url$resource";
  }

  register(String content) {
    http.post(Uri.parse(getUrl()), body: {"content": content});
  }

  Future<String> get() async {
    http.Response response = await http.get(Uri.parse(getUrl()));
    print(response.body);
    return response.body;
  }
}
