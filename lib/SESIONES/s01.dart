class Sesion1 {
  void Leccion01_interpolaciones_y_constantes() {
    print('Hola Mundo!');
    //var myName = 'Antonio';
    final myName = 'Antonio'; //Es una constante en tiempo de ejecucion, ya no se puede modificar más
    late final String mySurname; //Igual que final pero se asigna tardíamente.
    //Código
    mySurname = 'Muñoz';

    const myNameConst =
        'Antonio'; //Esto es una constante en tiempo de construcción

    //Interpolaciones
    print('Hola, soy $myName');
    print('Hola soy ${myName.toUpperCase()}!!');
  }

  void Leccion02_Tipos_de_datos() {
    final myName = 'Antonio'; //Es una constante en tiempo de ejecucion, ya no se puede modificar más

    print("""
    Hola 
    Mundo, 
    soy
    $myName
    :D
    """);

    final bool ok = true; //nulables igual a c#

    //Listas: formas de declarar.
    final List<String> abilities = [
      'Programacion en Flutter',
    ]; //Listados, se puede quitar el <String>
    final abilities2 = <String>['Programacion en Flutter'];

    //dynamic: Intentar evitar. Puede ser cualquier tipo de dato y
    //acepta nulos: siempre es nulable (?)
    dynamic errorMessage = 'Hola';
    errorMessage = 123;
    errorMessage = null;
    errorMessage = false;

    //errorMessage += 1; //CUIDADO, HACER ESTO DARÍA ERROR.
    print('$errorMessage');
  }

  void Leccion03_Maps() {
    //Se basa en un esquema key - Value, para agrupar datos de una sola cosa
    //Es dart todo son objetos, porque tienen métodos propios.
    //La key puede ser de cualquier tipo, pero combiene que todas las keys sean del mismo tipo.
    //el value puede ser de cualquier tipo.
    //Es muy similar a los diccionarios de c#
    final Map<String, dynamic> pokemon = {
      'name': 'Ditto',
      'hp': 100,
      'isAlive': true,
      'abilities': <String>['impostor'],
      'sprites': <int, String>{
        //Map dentro de otro map
        1: 'ditto/front.png',
        2: 'ditto/back.png',
      },
    };

    print(pokemon);
    print('Name: ${pokemon['name']}');
    print('Name: ${pokemon['sprites']}');

    print('${pokemon['sprites'][1]}');
    print('${pokemon['sprites'][2]}');
  }

  void Leccion04_List_Iterables_Sets() {
    //Un iterable se devuelve entre paréntsis.
    //Es un objeto que sabe que tiene más objetos dentro y es capaz de iterarlos
    final numbers = [1, 2, 3, 4, 5, 5, 5, 5, 6, 7, 8, 9];

    //Esto es una lista, pero .reversed devuelve un iterable
    print(
      'List original $numbers elementos: ${numbers.length} index 0: ${numbers[0]}',
    );
    print('Lista reversa: ${numbers.reversed}');

    //Aqui ya es un iterable
    final reverseNumbers = numbers.reversed;

    //PAra recuperar la lista original, usar toList()
    final original = reverseNumbers.toList();

    //Set: diferencias con lista es que el Set es un listado de valores únicos, no puede haber duplicados.
    //Aqui se eliman los duplicados y los devolvemos como lista
    final numbersSet = numbers.toSet().toList();

    //Observa, son muy parecidos a los IEnumerables de C#, puedes filtrar como si usaras linq
    final numberGreaterThan5 = numbers.where((num) {
      return num > 5;
    });
    //lo de arriba devuelve un Iterable.
    //Si queremos quitar los repetidos, añadir .toSet()

    print('>5: $numberGreaterThan5');
  }

  void Leccion05_Funciones_y_parametros() {
    // void dice que no devuelve nada
    print(greetEveryone());

    //Funciones con variables, se usa MUCHISIMO, basicamente es la forma de pasar parámetros base
    print(Saludar(name: "Antonio"));
  }

  //Si no asignamos valor de retorno, dart devuelve por defecto dynamic, haciendo que pueda devolver cualquier cosa.
  //Evitar no poner retorno, así evitamos posibles errores futuros
  /*las funciones landa con flecha es como hacer 
  funcion x () {
    return x;
  }
  pero más simplificado. Para añadir un cuerpo de la funcion, hay que hacer la sintaxis original
  */
  String greetEveryone() => 'Hello everyone!';

  //SIEMPRE DECLARAR EL TIPO DE LOS PARÁMETROS PARA EVITAR ERRORES FUTUROS
  int suma(int a, int b) => a + b;

  //Valores opcionales, observar la sintaxis del argumento b
  int sumaOpcional(int a, [int b = 0, int? c]) {
    //si es nulo, asigno a 0, en caso de hacer nulable a b ([int b?])
    c ??= 0;

    return a + b;
  }

  //Parámetros con nombre,
  //required obliga a pasarlo siempre,
  //mientras que asignar en los argumentos asigna un valor en caso de no pasarle nada
  String Saludar({required String name, String message = "Hola,"}) =>
      "$message $name";

  void Leccion06_Clases() {
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
