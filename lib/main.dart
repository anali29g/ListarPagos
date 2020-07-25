import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;
  List pagosData;
  getData() async {
    http.Response response = await http.get(
        "https://sigapdev2-consultarecibos-back.herokuapp.com/recaudaciones/alumno/concepto/listar_cod/17207064");

    data = json.decode(response.body);
    setState(() {
      pagosData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Lista de Pagos'),
          backgroundColor: Colors.indigo[900],
        ),
        body: Column(
          children: [
            Row(children: [
              Expanded(
                child: Text('',
                    style: TextStyle(
                      height: 2.0,
                      fontSize: 5.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Expanded(
                child: Text('N°recibo',
                    style: TextStyle(
                      height: 3.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Expanded(
                child: Text(' Fecha',
                    style: TextStyle(
                      height: 3.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Expanded(
                child: Text('Moneda',
                    style: TextStyle(
                      height: 3.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Expanded(
                child: Text('Importe',
                    style: TextStyle(
                      height: 3.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Expanded(
                child: Text('Tipo',
                    style: TextStyle(
                      height: 3.0,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ]),
            Expanded(
              child: Container(
                  child: ListView.builder(
                itemCount: pagosData == null ? 0 : pagosData.length,
                itemBuilder: (BuildContext context, int index) {
                  index = index + 1;
                  return Card(
                      child: Padding(
                          padding: const EdgeInsets.all(8.6),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.6),
                                child: Text(
                                  "$index",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.6),
                                  child: Text(
                                    "${pagosData[index - 1]["numero"]}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(8.6),
                                  child: Text(
                                    "${pagosData[index - 1]["fecha"]}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(8.6),
                                  child: Text(
                                    "${pagosData[index - 1]["moneda2"]}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(8.6),
                                  child: Text(
                                    "${pagosData[index - 1]["importe"]}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400),
                                  )),
                              Padding(
                                  padding: const EdgeInsets.all(8.6),
                                  child: Text(
                                    "${pagosData[index - 1]["validado"]}",
                                    style: TextStyle(
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.w400),
                                  ))
                            ],
                          )));
                },
              )),
            )
          ],
        ));
  }
}
