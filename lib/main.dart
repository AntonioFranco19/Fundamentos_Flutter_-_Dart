import 'package:flutter/material.dart';

import '../SESIONES/s01.dart';

void main() {
  //Sesion 4
  runApp(myApp());
}

class myApp extends StatelessWidget{
  const myApp({super.key});

  
  //Cualquier cosa que herede de StatelessWidget/StatefulWidget tiene que tener este override
  @override 
  Widget build(BuildContext context) {
    // Siempre d3evolver MaterialApp con sus parametros home
    return MaterialApp(
      home: Text("Hola mundo!") //Muestra texto en la pantalla.
    );
  }

}