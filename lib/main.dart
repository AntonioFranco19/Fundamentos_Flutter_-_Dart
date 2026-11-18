import 'package:flutter/material.dart';

import 'SESIONES/s01MetodosYEnumerables.dart';

void main() {
  //Sesion 4
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //Cualquier cosa que herede de StatelessWidget/StatefulWidget tiene que tener este override
  @override
  Widget build(BuildContext context) {
    // Siempre d3evolver MaterialApp con sus parametros home
    //Si devolvemos con const le decimos: NUNCA va a cambiar este MaterialApp, así es más rápido
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: Text('data')),
      ), //Muestra texto en la pantalla.
    );
  }
}
