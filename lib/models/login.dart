import 'dart:convert';
import 'package:http/http.dart' as http;

class Login {
  final bool success;
  final String jwt, message;

  Login(this.success, [this.jwt, this.message]);

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(obj['success'], obj['jwt'], obj['message']);
  }

  static Future<Login> getLogin(String _user, String _pass) async {
    final String _body = '{"id" : "$_user","password" : "$_pass"}';
    var result = await http.post("https://api.deardiamond.id/login",
        body: _body);
    var resultJson = json.decode(result.body);
    return Login.fromJson(resultJson);
  }
}
