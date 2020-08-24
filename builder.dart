library builder;

abstract class Builder {
  Product product;
  buildStepA() {
    product.addStep('A');
  }

  buildStepB() {
    product.addStep('B');
  }

  reset();
  Product getProduct() {
    return this.product;
  }
}

class ConcreteBuilderA extends Builder {
  @override
  reset() {
    this.product = new ProductA();
  }
}

class ConcreteBuilderB extends Builder {
  @override
  reset() {
    this.product = new ProductB();
  }
}

abstract class Product {
  List<String> _steps = [];
  List<String> get steps => this._steps;
  void addStep(String step);
}

class ProductA extends Product {
  void addStep(String step) {
    this._steps.add('ProdA - $step');
  }
}

class ProductB extends Product {
  void addStep(String step) {
    this._steps.add('ProdB - $step');
  }
}

class Director {
  Builder _builder;
  Director(this._builder);
  void changeBuilder(Builder builder) {
    this._builder = builder;
  }

  Product makeA() {
    return (this._builder
          ..reset()
          ..buildStepA())
        .getProduct();
  }

  Product makeB() {
    return (this._builder
          ..reset()
          ..buildStepB())
        .getProduct();
  }

  Product makeAB() {
    return (this._builder
          ..reset()
          ..buildStepA()
          ..buildStepB())
        .getProduct();
  }
}
