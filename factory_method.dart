import 'dart:async';
import 'dart:math';

abstract class Logistics {
  List<Transport> transports = [];
  Logistics();
  Transport getFreeTransport();
}

class RoadLogistics extends Logistics {
  Transport getFreeTransport() {
    Transport transport =
        this.transports.singleWhere((t) => !t.blocked, orElse: () => null);
    if (transport == null) {
      transport = new Truck(Random().nextInt(100).toString());
    }
    return transport;
  }
}

class SeaLogistics extends Logistics {
  Transport getFreeTransport() {
    Transport transport =
        this.transports.singleWhere((t) => !t.blocked, orElse: () => null);
    if (transport == null) {
      transport = new Ship(Random().nextInt(100).toString());
    }
    return transport;
  }
}

abstract class Transport {
  String name;
  bool _blocked = false;
  Transport(this.name);
  bool get blocked => this._blocked;
  set blocked(bool val) {
    this._blocked = val;
    print('${this.name} block = ${this._blocked}');
  }

  Future<void> deliver();

  @override
  String toString() {
    return '${this.name} (${this.blocked})';
  }
}

class Truck extends Transport {
  Truck(String name) : super('TRUCK - $name');
  Future<void> deliver() {
    this.blocked = true;
    num time = Random().nextInt(5);
    print('${this.name} is delivering for ${time} seconds');
    return new Future.delayed(
        new Duration(seconds: time), () => this.blocked = false);
  }
}

class Ship extends Transport {
  Ship(String name) : super('SHIP - $name');
  Future<void> deliver() {
    this.blocked = true;
    num time = Random().nextInt(5);
    print('${this.name} is delivering for ${time} seconds');
    return new Future.delayed(
        new Duration(seconds: time), () => this.blocked = false);
  }
}

enum Option { Road, Sea }

RoadLogistics _roadLogistics = new RoadLogistics();
SeaLogistics _seaLogistics = new SeaLogistics();

Logistics getLogistics(Option option) {
  Logistics logistics;
  switch (option) {
    case Option.Road:
      logistics = _roadLogistics;
      break;
    case Option.Sea:
      logistics = _seaLogistics;
      break;
  }
  return logistics;
}
