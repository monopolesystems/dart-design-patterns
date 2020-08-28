import 'dart:async';

import 'factory_method.dart' as factoryMethod;
import 'abstract_factory.dart' as abstractFactory;
import 'builder.dart' as builder;
import 'prototype.dart' as prototype;
import 'singleton.dart' as singleton;

import 'adapter.dart' as adapter;
import 'bridge.dart' as bridge;
import 'composite.dart' as composite;
import 'decorator.dart' as decorator;
import 'facade.dart' as facade;
import 'flyweight.dart' as flyweight;
import 'proxy.dart' as proxy;

import 'chainofresponsibility.dart' as chainofresponsibility;
import 'command.dart' as command;
import 'iterator.dart' as iterator;
import 'mediator.dart' as mediator;
import 'memento.dart' as memento;
import 'observer.dart' as observer;

main(List<String> args) async {
  print('****** DEBUG: STARTED  ******');
  // factoryMethodClient.call();
  // abstractFactoryClient();
  // builderClient();
  // prototypeClient();
  // singletonClient();
  // adapterClient();
  // bridgeClient();
  // compositeClient();
  // decoratorClient();
  // facadeClient();
  // flyweightClient();
  // proxyClient();
  // chainofresponsibilityClient();
  // commandClient();
  // iteratorClient();
  // mediatorClient();
  // mementoClient();
  observerClient();
  // new Timer(new Duration(seconds: 10), () => print('Hello'));
  print('****** DEBUG: FINISHED ******');
}

void factoryMethodClient() {
  // For changing the Concrete class, change the factory.
  const factoryMethod.Option option = factoryMethod
      .Option.Road; //Changing this single value would change the behavior
  factoryMethod.Logistics logistics = factoryMethod.getLogistics(option);
  factoryMethod.Transport truck1 = logistics.getFreeTransport();
  print(truck1);
  truck1.deliver();
  factoryMethod.Transport truck2 = logistics.getFreeTransport();
  print(truck2);
  truck2.deliver();
}

void abstractFactoryClient() {
  // For changing the class of product, change the factory.
  const abstractFactory.Option option = abstractFactory
      .Option.windows; // Changing this value would change the family.
  abstractFactory.WidgetFactory widgetFactory =
      abstractFactory.getWidgetFactory(option);
  widgetFactory.getButton().draw();
  widgetFactory.getTextbox().draw();
}

void builderClient() {
  // For changing the product, change the builder
  // For changing the variant, call different methods in the builder
  builder.Builder _builder =
      new builder.ConcreteBuilderB(); // Chaning this to get different products
  builder.Director director = new builder.Director(_builder);
  builder.Product product1 = director
      .makeAB(); // change the method to get different variants of the same product
  print(product1.steps);
  builder.Product product2 = director.makeA();
  print(product2.steps);
}

void prototypeClient() {
  // Make objects clonable by implementing a clone method in the Class.
  prototype.Point2D point2D = new prototype.Point2D(1, 2);
  print(point2D.distanceFromOrigin());
  prototype.Point2D clone = point2D.clone();
  print(clone.distanceFromOrigin());
  prototype.Point3D point3D = new prototype.Point3D(1, 2, 3);
  print(point3D.distanceFromOrigin());

  prototype.Point2D point = new prototype.Point3D(1, 1);
  print(point.distanceFromOrigin());
}

void singletonClient() {
  // Singleton. duh!
  singleton.Singleton _singleton = singleton.Singleton.getInstance();
  assert(singleton.Singleton.getInstance() == _singleton);
  print(singleton.Singleton.getInstance() == _singleton);
}

void adapterClient() {
  // adapter the interface of the service provider to the client interface.
  // Don't do much with the functionality itself. Then it becomes a Facade
  adapter.CelsiusService service = new adapter.CelsiusService();
  adapter.Adapter _adapter = new adapter.Adapter(service);
  print(_adapter.getAbsoluteTemperature());
}

void bridgeClient() {
  // by seperating the hierarchies for Color and Shape
  // - We stop the Subclass explosion
  // - We seperate concerns or paint and draw.
  bridge.Color color = new bridge.Red();
  bridge.Shape circle = new bridge.Circle(10.0, color);
  circle.draw();
  circle.paint();
}

void compositeClient() {
  // When you need a tree structure of unknown depth
  composite.Component pack1 = new composite.Package(
      new List(100).map((e) => new composite.Product(5)).toList());
  print(pack1.getPrice());
  composite.Component pack2 = new composite.Package(
      new List(100).map((e) => new composite.Product(5)).toList());
  composite.Component superPack = new composite.Package([pack1, pack2]);
  print(superPack.getPrice());
}

// Decorator Client

// IMP: The class which wants be decorated need to implement/extend the Notifier Interface
class Component implements decorator.NotifierInterface {
  @override
  void notify() {}
}

void decoratorClient() {
  Component component = new Component();
  // the casting in the function parameter casts the incoming component to the decorator interface
  void notifyClient(decorator.NotifierInterface component) {
    component = new decorator.SMSNotify(component); //keep wrapping
    component = new decorator.EmailNotify(component); //keep wrapping
    component.notify();
  }

  notifyClient(component);
}

void facadeClient() {
  facade.Facade _facade = new facade.Facade();
  print(_facade.perform());
}

void flyweightClient() {
  //TODO: Not completed
}

void proxyClient() {
  // Proxy and the actual service share the same interface.
  // This shows one of the advantages of programming for Interface rather than concrete types.
  // A concrete dependency would need changes in client and server for a proxy implementation.
  proxy.ServiceInterface _service = new proxy.Service();
  proxy.ServiceInterface _proxy = new proxy.ServiceProxy(_service);
  _proxy.perform(123);
}

void chainofresponsibilityClient() {
  // Based on some content of the request, the handlers decide whether to work on it or not.
  chainofresponsibility.Request request = new chainofresponsibility.Request();
  request.handleFlags = ['A', 'B', 'C'];
  // chainofresponsibility.HandlerInterface handler =
  //     new chainofresponsibility.ConcreteHandlerA()
  // handler.setNext(new chainofresponsibility.ConcreteHandlerB());
  chainofresponsibility.HandlerInterface handler =
      new chainofresponsibility.ConcreteHandlerA()
        ..setNext(new chainofresponsibility.ConcreteHandlerB());
  handler.execute(request);
}

void commandClient() {
  //receiver is there it actually runs;
  command.Receiver receiver = new command.Receiver();
  // _command is prepared using the receiver and argument
  command.CommandInterface _command = new command.Command1(receiver, 10);
  _command.execute();
}

void iteratorClient() {
  iterator.Iterable iterable = new iterator.ListIterable([1, 2, 3, 4, 5]);
  //changing the concrete iterator type below decides the behavior. No other client code needs to change
  iterator.Iterator _forwardIterator = new iterator.ListIterator(iterable);
  iterator.Iterator _reverseIterator =
      new iterator.ListReverseIterator(iterable);
  while (_forwardIterator.hasNext()) {
    print(_forwardIterator.next());
  }
  while (_reverseIterator.hasNext()) {
    print(_reverseIterator.next());
  }
}

void mediatorClient() {
  mediator.Component1 component1 = new mediator.Component1();
  mediator.Component2 component2 = new mediator.Component2();
  mediator.Mediator _mediator =
      new mediator.ConcreteMediator(component1, component2);
  component1.setMediator(_mediator);
  component2.setMediator(_mediator);
  component2.doActionA2();
}

void mementoClient() {
  //Editor is the main class and it implements Restorable.
  memento.Editor editor = new memento.Editor();
  //Caretaker uses a Restorable type for saving and restoring states.
  memento.Caretaker caretaker = new memento.Caretaker(editor);
  print(editor);
  caretaker.push();
  editor.x++;
  editor.y--;
  editor.z += 10;
  print(editor);
  caretaker.push();
  editor.x++;
  editor.y--;
  editor.z += 10;
  print(editor);
  caretaker.pop();
  print(editor);
  caretaker.pop();
  print(editor);
  caretaker.pop();
  print(editor);
}

void observerClient() {
  observer.Publisher publisher = new observer.Publisher();
  observer.SubscriberInterface subscriber1 = new observer.Subscriber(1);
  observer.SubscriberInterface subscriber2 = new observer.Subscriber(2);
  // Returning an unregister function is not necessary.
  // The idea is for the subscriber client to decide when to register and unregister
  final unregister1 = publisher.register(subscriber1);
  final unregister2 = publisher.register(subscriber2);
  publisher.publish('Hello');
  unregister1();
  unregister2();
  publisher.publish('Hello Hello');
}
