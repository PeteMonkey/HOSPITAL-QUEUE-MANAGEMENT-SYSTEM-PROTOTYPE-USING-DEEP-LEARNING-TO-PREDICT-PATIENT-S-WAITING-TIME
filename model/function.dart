import 'package:http/http.dart' as http;

fetchdata(String url) async {
  http.Response respond = await http.get(Uri.parse(url));
  return respond.body;
}
