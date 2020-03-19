import 'package:coin_count/utils/functions.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "CONVERT U \$",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
          ),
          ),
        centerTitle: true,
      ),


      body: FutureBuilder<Map>(
        future: getData(),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 6,
                    semanticsLabel: "Loading",
                    backgroundColor: Colors.lime,
                  ),
                );
            default:
              if(snapshot.hasError){
                return Center(
                  child: Text("Erro ao carregar dados!!! :("),
                );
              }else{
                return Container(
                  child: Text("Carregou!!!"),
                );
              }
          }
        }
      
      ),
    );
  }
}