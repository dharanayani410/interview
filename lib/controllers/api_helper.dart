import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiHelper {
  ApiHelper._();

  static final ApiHelper apiHelper = ApiHelper._();

  Future<Map?> fetchData() async {
    String api =
        "https://pharmafast.cscodetech.cloud//user_api/u_login_user.php";

    http.Response res = await http.post(Uri.parse(api), body: jsonEncode({}));

    if (res.statusCode == 200) {
      Map data = jsonDecode(res.body) as Map;

      return data;
    }
    return null;
  }
}
