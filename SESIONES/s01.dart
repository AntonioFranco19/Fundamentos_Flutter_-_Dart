class Sesion1 {
  void Leccion01() {
    print('Hola Mundo!');
    //var myName = 'Antonio';
    final myName = 'Antonio'; //Es una constante en tiempo de ejecucion, ya no se puede modificar más
    late final mySurname; //Igual que final pero se asigna tardíamente.
    //Código
    mySurname = 'Muñoz';

    const myNameConst =
        'Antonio'; //Esto es una constante en tiempo de construcción
    //usar const hace que la aplicacion sea más rápida.

    //Interpolaciones
    print('Hola, soy $myName');
    print('Hola soy ${myName.toUpperCase()}!!');
  }
}
