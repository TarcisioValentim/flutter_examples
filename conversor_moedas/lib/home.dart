import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

//constante para receber minha URL(api+key)..
const request = "https://api.hgbrasil.com/finance?format=json&key=697d454d";

//future
Future<Map> getData() async {
  http.Response response = await http.get(request);
//return json.decode(response.body);
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Falha ao carregar um post');
  }
}

//class
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //controladores
  final hojeController = TextEditingController();
  final dolarController = TextEditingController();
  final realController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double hoje;
  double euro;
//funcoes
  void _clearAll() {
    hojeController.selection = hoje as TextSelection;
    dolarController.text = "";
    realController.text = "";
    euroController.text = "";
  }

  void _realChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double real = double.parse(text);
    dolarController.text = (real / dolar).toStringAsFixed(2);
    euroController.text = (real / euro).toStringAsFixed(2);
  }

  void _dolarChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }

  void _euroChanged(String text) {
    if (text.isEmpty) {
      _clearAll();
      return;
    }
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                    child: Text(
                  "Carregando Dados...",
                  style: TextStyle(color: Colors.amber, fontSize: 25.0),
                  textAlign: TextAlign.center,
                ));
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao Carregar Dados :(",
                      style: TextStyle(color: Colors.amber, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  hoje = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Icon(Icons.monetization_on,
                            size: 150.0, color: Colors.amber),
                        //metodo TextField
                        Container(
                          color: Colors.red,
                          child: widgetTextField(hojeController),
                        ),
                        Divider(),
                        buildTextField(
                            "Dólar", "US\$", dolarController, _dolarChanged),
                        Divider(),
                        buildTextField(
                            "Reais", "R\$", realController, _realChanged),
                        Divider(),
                        buildTextField(
                            "Euros", "€", euroController, _euroChanged),
                      ],
                    ),
                  );
                }
            }
          }),
    );
  }

  widgetTextField(
    TextEditingController c,
  ) {
    return TextField(
      controller: c,
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.black),
        border: InputBorder.none,
        icon: Icon(Icons.donut_large),
      ),
    );
  }

  Widget buildTextField(
      String label, String prefix, TextEditingController c, Function f,
      {Text child}) {
    return TextField(
      controller: c,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.amber),
          border: OutlineInputBorder(),
          prefixText: prefix),
      style: TextStyle(color: Colors.amber, fontSize: 25.0),
      onChanged: f,
      keyboardType: TextInputType.number,
    );
  }
}
