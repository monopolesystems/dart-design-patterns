library mediator;

abstract class Mediator {
  notify(Component component, String event) {}
}

class ConcreteMediator implements Mediator {
  Component1 component1;
  Component2 component2;
  ConcreteMediator(this.component1, this.component2);
  @override
  notify(Component component, String event) {
    switch (event) {
      case 'A2':
        component1.doActionA1();
        break;
      default:
    }
  }
  // regis
}

abstract class Component {
  Mediator _mediator;
  setMediator(Mediator mediator) {
    this._mediator = mediator;
  }
}

class Component1 extends Component {
  doActionA1() {
    print('Action A1');
  }

  doActionB1() {
    print('Action B1');
  }
}

class Component2 extends Component {
  doActionA2() {
    print('Action A2');
    this._mediator.notify(this, 'A2');
  }

  doActionB2() {
    print('Action B2');
  }
}
