library adapter;

import 'dart:math';

class CelsiusService {
  getTemperature() {
    return Random().nextInt(100);
  }
}

abstract class AdapterInterface {
  double getAbsoluteTemperature();
}

class Adapter implements AdapterInterface {
  CelsiusService service;
  Adapter(this.service);

  @override
  double getAbsoluteTemperature() {
    return this.service.getTemperature() + 273.15;
  }
}
