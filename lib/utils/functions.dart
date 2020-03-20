import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<Map> getData()async{
  http.Response res = await http.get("https://api.hgbrasil.com/finance/?key=306361bc");
  return json.decode(res.body);
}

void changeCoins(String text, String type, double dolar, double euro, TextEditingController controlA, TextEditingController controlB){
  double value = double.parse(text.replaceAll(",", "."));
  if (type == "Real"){
    controlA.text = (value/dolar).toStringAsFixed(2);
    controlB.text = (value/euro).toStringAsFixed(2);
  }else if (type == "Dolar"){
    controlA.text = (value*dolar).toStringAsFixed(2);
    controlB.text = (value*dolar/euro).toStringAsFixed(2);
  }else if (type == "Euro"){
    controlA.text = (value*euro).toStringAsFixed(2);
    controlB.text = (value*euro/dolar).toStringAsFixed(2);
  }
}