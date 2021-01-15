import 'package:flutter/material.dart';
import 'package:pullapp/pages/calculadora_imc.dart';
import 'package:pullapp/pages/mapa.dart';

void main(){
  runApp(MaterialApp(
    title: 'PullApp',
    home: new Home(),
  ));
} 

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<Container> listamos = List();

  var arreglox = [
    {"nombre": "Pierna", "imagen": "pierna.jpg", "ejercicio": "Sentadilla con pesas, 4 series de 12 repiticiones"},
    {"nombre": "Cinta Elastica", "imagen": "cinta.jpg", "ejercicio": "Trabajo con cinta, 4 series de 15 repeticiones"},
    {"nombre": "Cinta", "imagen": "cinta2.jpg", "ejercicio": "Trabajo con cinta, 2 series de 15 repeticiones"},
    {"nombre": "Pecho", "imagen": "pecho.jpg", "ejercicio": "trabajo con mancuernas, 4 series de 15 repiticiones"},
    {"nombre": "Abdomen", "imagen": "abdominal.jpg", "ejercicio": "Abdominales, 4 series de 12 repiticiones"},
    {"nombre": "Peso Muerto", "imagen": "peso.jpg", "ejercicio": "Trabajo barra, 2 series de 15 repeticiones"},
    {"nombre": "Espalda", "imagen": "espalda.jpg", "ejercicio": "STrabajo con peso corporals, 4 series de 10 repiticiones"},
    {"nombre": "Gluteos", "imagen": "gluteos.jpg", "ejercicio": "Trabajo con pesas, 4 series de 15 repeticiones"},
    {"nombre": "Mas Gluteos", "imagen": "gluteos2.jpg", "ejercicio": "Trabajo con barra, 4 series de 15 repeticiones"},
    {"nombre": "Barra", "imagen": "barra.jpg", "ejercicio": "Trabajo con barra, 4 series de 15 repeticiones"},
    {"nombre": "Mancuernas", "imagen": "mancuernas.jpg", "ejercicio": "Trabajo con mancuerna, 4 series de 15 repeticiones"},
    {"nombre": "Estiramiento", "imagen": "estiramiento.jpg", "ejercicio": "Trabajo con cinta 4 repeticiones de 15"},
  ];

  listado() async{
    for (var i = 0; i < arreglox.length; i++) {
    final arreglo = arreglox[i];
    final String imagen = arreglo["imagen"];

    listamos.add(new Container(
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Column(
          children: <Widget>[
            new Hero(
              tag: arreglo['nombre'],
              child: new Material(
                child: new InkWell(
                  onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new Detail(
                      nombre: arreglo['nombre'],
                      imagen: imagen, 
                      ejercicio: arreglo['ejercicio']
                    ),
                  )),
                  child: new Image.asset(
                    "images/$imagen",
                    fit: BoxFit.contain
                  ),
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(3.0)
            ),
            new Text(
              arreglo['nombre'],
              style: new TextStyle(fontSize: 20.0),              
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void initState() { 
    listado();
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('PullApp'), backgroundColor: Colors.orange,),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text('Ejercicios'),
              accountEmail: new Text('compumovilgr3@gmail.com'),
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('images/estiramiento.jpg'),
                )
              ),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Calculadora IMC"),              
              trailing: new Icon(Icons.fitness_center),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => MiCalculadora(),
                )),
            ),
            new Divider(),
            new ListTile(
              title: new Text("Mapa"),              
              trailing: new Icon(Icons.fitness_center),
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                builder: (BuildContext context) => Mapa(),
                )),
            ),
          ],
        ),
      ),
      body: new GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 0.1,
        childAspectRatio: 0.700,
        children: listamos,
        ),
    );
  }
}

class Detail extends StatelessWidget {
  Detail({this.nombre, this.imagen, this.ejercicio});
  final String nombre;
  final String imagen;
  final String ejercicio;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: new ListView(
        children: <Widget>[
          new Container(
            height: 387.0,
            child: new Hero(
              tag: nombre,
              child: new Material(
                child: new InkWell(
                  child: new Image.asset(
                    "images/$imagen",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )),
            new IniciarNombre(
                nombre: nombre,
              ),
              new IniciarIcon(),
              new Informacion(
                ejercicio: ejercicio,
              ),
        ],
      ),
    );
  }
}

class IniciarNombre extends StatelessWidget {
  IniciarNombre({this.nombre});
  final String nombre;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),      
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  nombre,
                  style: new TextStyle(fontSize: 20.0, color: Colors.blue), 
                ),
                new Text(
                  "$nombre\@gmail.com",
                  style: new TextStyle(fontSize: 15.0, color: Colors.blueGrey), 
                ),
              ],
            )
            ),
            new Row(
              children: <Widget>[
                new Icon(
                  Icons.star,
                  size: 30.0,
                  color: Colors.orange,
                ),
                new Icon(
                  Icons.star,
                  size: 30.0,
                  color: Colors.red,
                ),
                new Icon(
                  Icons.star,
                  size: 30.0,
                  color: Colors.purple,
                ),
                new Text(
                  "12",
                  style: new TextStyle(fontSize: 18.0),
                )
              ],
            )
        ],
      ),
    );
  }
}

class IniciarIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: new EdgeInsets.all(10.0),
      child: new Row(
        children: <Widget>[
          new IconTec(
            icon: Icons.call,
            tec: "Llamar"
                ), 
                new IconTec(
            icon: Icons.message,
            tec: "WhastApp"
                ),
                new IconTec(
            icon: Icons.photo,
            tec: "Foto"
                ),
                  ],
      ),
    );
  }
}

class IconTec extends StatelessWidget {
  IconTec({this.icon, this.tec});
  final IconData icon;
  final String tec;
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Column(
        children: <Widget>[
          new Icon(
            icon,
            size: 50.0,
            color: Colors.blue,
          ),
          new Text(
            tec,
            style: new TextStyle(fontSize: 12.0, color: Colors.blue),
          )
        ],
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  Informacion({this.ejercicio});
  final String ejercicio;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      padding: new EdgeInsets.all(10.0),
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(10.0),
          child: new Text(
            ejercicio,
            style: new TextStyle(fontSize: 16.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}