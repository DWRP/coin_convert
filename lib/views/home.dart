import 'package:coin_count/utils/functions.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double dolar;  
  double euro;

  final TextEditingController rControl = TextEditingController();
  final TextEditingController dControl = TextEditingController();
  final TextEditingController eControl = TextEditingController();

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
                dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                print(dolar);
                print(euro);
                return SingleChildScrollView(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        size: 120, 
                        color: Colors.amber,
                      ),

                      buildTextF(
                        "Real",
                         "R\$",
                         rControl,
                         changeCoins,
                         dolar,
                         euro,
                         dControl,
                         eControl),
                      Divider(),
                      buildTextF(
                        "Dolar", 
                        "\$",
                        dControl,
                        changeCoins,
                        dolar,
                        euro,
                        rControl,
                        eControl),
                      Divider(),
                      buildTextF(
                        "Euro",
                         "€",
                         eControl,
                         changeCoins,
                         dolar,
                         euro,
                         rControl,
                         dControl),
                    ],
                  ),
                );
              }
          }
        }
      
      ),
    );
  }
}


Widget buildTextF(String label, String prefx, TextEditingController ctr, Function change, double dolar, double euro,TextEditingController ctr1,TextEditingController ctr2){
  return TextField(
    controller: ctr,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontSize: 25
      ),
      border: OutlineInputBorder(),
      prefixText: prefx
    ),
    style: TextStyle(
      fontSize: 25
    ),
    onChanged: (item){
      change(item,label,dolar,euro, ctr1, ctr2);
      },
  );
}