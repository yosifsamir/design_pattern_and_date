/*
The Prototype Design Pattern is a creational design pattern that allows you to create new objects by cloning existing ones,
 without having to know their specific class.
This pattern is useful when you want to create a large number of similar objects that differ only in their state.
By using the Prototype pattern, you can avoid the overhead of creating new objects from scratch, and instead,
you can simply clone an existing object and modify its state as necessary.

Sure, let's say you're working on a game that involves creating a large number of enemies with different attributes such as health,speed, and attack power.
 Instead of creating each enemy object from scratch, you can create a prototype object that has the default values for these attributes.
 Then, you can clone this object and modify its state to create new enemy objects with different attributes.

 */

main(){

  MachineEnemy m1=MachineEnemy("Youssef", 24 , Address(10.0, 20.0));
  MachineEnemy m2=m1.shallowClone();
  MachineEnemy m3=m1.deepClone();

  print("MachineEnemy m1 ==> ${m1.hashCode}");
  print("MachineEnemy m2 ==> ${m2.hashCode}");
  print("MachineEnemy m3 ==> ${m3.hashCode}");

  print("Data ------------------");

  m2.name="Ahmad";
  m1.address.lan = 50.0;
  m1.address.lat = 50.0;

  print("MachineEnemy m1 ==> $m1");
  print("MachineEnemy m2 ==> $m2");
  print("MachineEnemy m2 ==> $m3");
}

abstract class EnemyPrototype{
  String _name;
  int _age;
  Address _address;


  EnemyPrototype(this._name, this._age,this._address);

  EnemyPrototype shallowClone();
  EnemyPrototype deepClone();


  set age(int value) {
    _age = value;
  }

  set name(String value) {
    _name = value;
  }

  int get age => _age;

  String get name => _name;


  Address get address => _address;

  set address(Address value) {
    _address = value;
  }

  @override
  String toString() {
    return 'EnemyPrototype{_name: $_name, _age: $_age, _address: $_address}';
  }
}

class MachineEnemy extends EnemyPrototype{
  MachineEnemy(super.name, super.age,super._address);

  @override
  MachineEnemy shallowClone() {
    return MachineEnemy(name, age,address);
  }

  @override
  MachineEnemy deepClone() {
    return MachineEnemy(name, age,Address(super.address.lan, super.address.lat));
  }

}

class RockEnemy extends EnemyPrototype{
  RockEnemy(super.name, super.age,super._address);

  @override
  RockEnemy shallowClone() {
    return RockEnemy(name, age,address);
  }
  @override
  RockEnemy deepClone() {
    return RockEnemy(name, age,Address(super.address.lan, super.address.lat));
  }
}

class Address{
  double _lan;
  double _lat;

  Address(this._lan, this._lat);

  double get lat => _lat;

  set lat(double value) {
    _lat = value;
  }

  double get lan => _lan;

  set lan(double value) {
    _lan = value;
  }

  @override
  String toString() {
    return 'Address{_lan: $_lan, _lat: $_lat}';
  }
}

