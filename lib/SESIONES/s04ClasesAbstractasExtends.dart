void main() {
  final nuclearPlant = NuclearPlant(initialEnergy: 100);

  print('Nuclear: ${chargePhone(nuclearPlant)}');
}

double chargePhone(EnergyPlant plant) {
  if (plant.energyLeft < 10) {
    throw Exception('Not enough energy');
  }

  return plant.energyLeft - 10;
}

enum PlantType { nuclear, wind, water }

//No se puede instanciar, se necesita un subtipo que extienda esta clase
abstract class EnergyPlant {
  EnergyPlant({required this.energyLeft, required this.type});

  double energyLeft;
  final PlantType type; //nuclear, wind, water

  //Sin implementacion porque las subclases lo desarrollarán en sí mismas
  void consumeEnergy({required double amount});
}

// extends o implements
class NuclearPlant extends EnergyPlant {
  NuclearPlant({required double initialEnergy})
    //Llamada al constructor padre
    : super(energyLeft: initialEnergy, type: PlantType.nuclear);

  @override
  void consumeEnergy({required double amount}) {
    if (amount > energyLeft) amount = energyLeft;

    energyLeft -= (amount*0.5);
  }
}


/*La diferencia de implements con extends es que implements se utiliza cuando no queremos 
todos los metodos de la clase padre, sino que queremos unos pocos. 
extends se utiliza cuando sí queremos todos los métodos en nuestra clase hija */
class WindPlant implements EnergyPlant {
  @override
  double energyLeft;
  
  @override
  final PlantType type = PlantType.wind;
  WindPlant({required this.energyLeft});

  @override
  void consumeEnergy({required double amount}) {
    if (amount > energyLeft) amount = energyLeft;

    energyLeft -= amount;
  }
}
