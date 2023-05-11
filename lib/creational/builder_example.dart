
main() {
  final car = CarBuilder()
      .name("youssef")
      .color("RED")
      .build();

  print("Car:- $car");
}

class Car {
  String _name;
  String _model;
  String _color;
  int _year;
  bool _isAutomatic;
  bool _isBus;

  Car(this._name, this._model, this._color, this._year, this._isAutomatic,
      this._isBus);

  bool get isBus => _isBus;

  set isBus(bool value) {
    _isBus = value;
  }

  bool get isAutomatic => _isAutomatic;

  set isAutomatic(bool value) {
    _isAutomatic = value;
  }

  int get year => _year;

  set year(int value) {
    _year = value;
  }

  String get color => _color;

  set color(String value) {
    _color = value;
  }

  String get model => _model;

  set model(String value) {
    _model = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  @override
  String toString() {
    return 'Car{_name: $_name, _model: $_model, _color: $_color, _year: $_year, _isAutomatic: $_isAutomatic, _isBus: $_isBus}';
  }
}

class CarBuilder {
   String? _name;
   String? _model;
   String? _color;
   int? _year;
   bool? _isAutomatic;
   bool? _isBus;

  CarBuilder name(String name) {
    _name = name;
    return this;
  }

  CarBuilder model(String model) {
    _model = model;
    return this;
  }

  CarBuilder color(String color) {
    _color = color;
    return this;
  }

  CarBuilder year(int year) {
    _year = year;
    return this;
  }

  CarBuilder isAutomatic(bool isAutomatic) {
    _isAutomatic = isAutomatic;
    return this;
  }

  CarBuilder isBus(bool isBus) {
    _isBus = isBus;
    return this;
  }

  Car build() {
    return Car(_name??"", _model??"", _color??"", _year??0, _isAutomatic??false, _isBus??false);
  }
}
