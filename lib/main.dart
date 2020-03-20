import 'package:flutter/material.dart';

import 'views/home.dart';

void main () async{
    runApp (
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          hintColor: Colors.blue
        ),
      )
    );
}