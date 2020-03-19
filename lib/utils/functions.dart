import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> getData()async{
  http.Response res = await http.get("https://api.hgbrasil.com/finance/?key=306361bc");
  return json.decode(res.body);
}