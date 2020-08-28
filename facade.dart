library facade;

class ComplexSubSystem {
  int performanceStep1() {
    return 1;
  }

  int performanceStep2() {
    return 2;
  }

  int performanceStep3() {
    return 3;
  }
}

class Facade {
  ComplexSubSystem complexSubSystem = new ComplexSubSystem();
  List<int> perform() {
    return [
      complexSubSystem.performanceStep1(),
      complexSubSystem.performanceStep2(),
      complexSubSystem.performanceStep3()
    ];
  }
}
