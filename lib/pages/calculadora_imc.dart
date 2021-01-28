import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:decimal/decimal.dart';

class MiCalculadora extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => Calculadora();
}

class Calculadora extends State<MiCalculadora> {
  final controller_peso = TextEditingController();
  final controller_talla = TextEditingController();
  final my_form_key = GlobalKey<FormState>();
  final d = Decimal;

  String muestreImc = "";
  String pesoSugerido = "";

  //formula para la mujer
  void PesoIdealMujer() {
    int pesoidealm = 21;
    int decimals = 2;
    int formula = pow(10, decimals);

    //validaciones campos vacios
    if (my_form_key.currentState.validate()) {
      double peso = double.parse(controller_peso.text);
      double altura = double.parse(controller_talla.text);
      double rtaAltura = (altura) / 100;
      double alturapordos = rtaAltura * rtaAltura;
      double result = peso / alturapordos;

      double d = result;
      d = (d * formula).round() / formula;

      //formula para sugerir el peso de la persona
      double sugerido = (pesoidealm * peso) / d;
      sugerido = (sugerido * formula).round() / formula;

      setState(() {
        muestreImc = "IMC es: $d";
      });

      setState(() {
        pesoSugerido = "Peso ideal es: $sugerido Kg";
      });
    }
  }

  //formula para el hombre
  void PesoIdealHombre() {
    int pesoidealh = 24;
    int decimals = 2;
    int formula = pow(10, decimals);

    //validaciones campos vacios
    if (my_form_key.currentState.validate()) {
      double peso = double.parse(controller_peso.text);
      double altura = double.parse(controller_talla.text);
      double rtaAltura = (altura) / 100;
      double alturapordos = rtaAltura * rtaAltura;
      double result = peso / alturapordos;

      double d = result;
      d = (d * formula).round() / formula;

      //formula para sugerir el peso de la persona
      double sugerido = (pesoidealh * peso) / d;
      sugerido = (sugerido * formula).round() / formula;

      setState(() {
        muestreImc = "IMC es: $d";
      });

      setState(() {
        pesoSugerido = "Peso ideal es: $sugerido Kg";
      });
    }
  }

  //Formula para hacer una operacion arimetica
  //lo que esten perdidos con la formula vamos a crear una mas simple
  void OperacionMatematica() {
    //realizamos las validaciones si algun campo este vacio
    if (my_form_key.currentState.validate()) {
      double numero1 = double.parse(controller_peso.text);
      double numero2 = double.parse(controller_talla.text);

      double result = numero1 / numero2;
      //lo puede cambiar por +  o  - o *

      setState(() {
        muestreImc = "La division es: $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ui.Size logicalSize = MediaQuery.of(context).size;
    final double _height = logicalSize.height;
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        title: new Text('Calculadora IMC'),
      ),
      body: Form(
          key: my_form_key,
          child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 500,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50)),
                    ),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.center,
                          child: new Image(
                            width: 200.0,
                            height: 150.0,
                            image: new AssetImage('images/scale.png'),
                          ),
                        )
                      ],
                    ),
                  ),

                  //agregamos un Container
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 150,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: controller_peso,
                            validator: (value) {
                              if (value.isEmpty) return "Digita el Peso Kg";
                            },
                            decoration: InputDecoration(
                                hintText: "Peso Kg",
                                icon: Icon(Icons.account_balance_wallet,
                                    color: Colors.purpleAccent)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Divider(),
                        Container(
                          width: 150,
                          height: 50,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(color: Colors.black, blurRadius: 5)
                              ]),
                          child: TextFormField(
                            controller: controller_talla,
                            validator: (value) {
                              if (value.isEmpty) return "Digita Estatura Cm";
                            },
                            decoration: InputDecoration(
                                hintText: "Estatura Cm",
                                icon: Icon(Icons.present_to_all,
                                    color: Colors.blueAccent)),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    height: 30.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: PesoIdealMujer,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.pinkAccent,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[Icon(Icons.person), Text('Mujer')],
                        ),
                      ),
                      VerticalDivider(),
                      FlatButton(
                        onPressed: PesoIdealHombre,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        color: Colors.blueAccent,
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: <Widget>[
                            Icon(Icons.person),
                            Text('Hombre')
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 40.0,
                  ),
                  //caja de resultado
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFFE2E64), Color(0xFFfF781D8)]),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    //creamos resultado del TextFormField
                    child: Center(
                      child: Text(
                        muestreImc,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 15.0,
                  ),
                  Container(
                    height: 50.0,
                    width: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFFf04B4AE), Color(0xFFf81F7F3)]),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    //creamos resultador del TextFormField
                    child: Center(
                      child: Text(
                        pesoSugerido,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                  ),
                  new Container(
                    padding: EdgeInsets.all(2.0),
                    child: Stack(
                      children: <Widget>[
                        Align(
                          child: new Image(
                            width: 300.0,
                            height: 200.0,
                            image: new AssetImage('images/imcx.png'),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ))),
    );
  }
}
