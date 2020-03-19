import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async/async.dart';

import 'views/home.dart';

const url_api = "https://api.hgbrasil.com/finance/?key=306361bc";

void main () async{
    http.Response res = await http.get(url_api);
    print(res.body);

    runApp (
      MaterialApp(
        home: Home(),
      )
    );
}