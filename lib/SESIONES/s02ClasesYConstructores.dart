void main() {
  final spiderman = Hero(
    name: "Spiderman",
    power: "Lanzar telarañas, trepar, superfuerza",
  );

  final Map<String, dynamic> rawJson = {
    'name': 'Tony Startk',
    'power': 'Dinero',
    'isAlive': true,
  };

  Hero ironman = Hero.fromMap(map: rawJson);
}

class Hero {
  //null safety: Flutter es MUY estricto porque supone un crash de nuestra aplicacion si manejamos un valor null

  String name;
  String power;
  bool isAlive;

  //Aquí hay error porque cuando se llama al constructor la inicialización ya es muy tarde (null safety)
  /*
  Hero({required String name, required String power}){
    this.name = name;
    this.power = name;
  }*/
  /*
  Otra sintaxis del constructor, solucionando el problema de la asignacion tardía
  Hero({required String name, required String power})
  : this.name = name,
    this.power = power;
  }*/

  //Sintaxis más sencilla y preventora de errores de asignacion tardía
  Hero({required this.name, required this.power, this.isAlive = true});

  //Constructor con nombre, para adecuar la creacion de Hero a distintas posibilidades.
  //aqui hay un margen de error, en caso de escribir mal las variables del map puede dar error
  //Cuando se lea de un archivo, map o set, SIEMPRE validar nulos
  Hero.fromMap({required Map<String, dynamic> map})
    : name = map['name'] ?? 'no name found',
      power = map['power'] ?? 'no power found',
      isAlive = map['isAlive'] ?? false;

  @override
  String toString() {
    return "$name, $power, ${isAlive ? 'Está vivo' : 'Murió'}";
  }
}
