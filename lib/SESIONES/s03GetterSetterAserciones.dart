void main() {
  final mySquare = Square(side: 10);

  print('area: ${mySquare.area}');
}

class Square {
  //Usando el setter en el constructor
  /*
  Square({required double side}) {
    this.side = side;
  }*/

  //Validacion con assert, EN PRODUCCION ESTÁN DESACTIVADAS
  Square({required double side}) 
  : assert(side >= 0, 'side must be >= 0'), _side = side;

  double _side = 1; //Colocar _ delante significa
  //que es privado a nivel de biblioteca, no a nivel de clase
  //Se inicializa porque si no dart te obliga a inicializarlo en el constructor,
  //aunque se utilice el set

  //El set establece condiciones cuando se cambia un valor
  set side(double value) {
    if (value <= 0) throw 'Value must be >= 0';

    _side = value;
  }

  //En lugar de hacer un método con el cálculo del área,
  //dart permite usar getters para sacar un valor calculado a raiz de los atributos
  double get area {
    return _side * _side;
  }
}
