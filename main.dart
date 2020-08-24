import 'factory_method.dart' as factoryMethod;
import 'abstract_factory.dart' as abstractFactory;
import 'builder.dart' as builder;
import 'prototype.dart' as prototype;
import 'singleton.dart' as singleton;

import 'adapter.dart' as adapter;
import 'bridge.dart' as bridge;

main(List<String> args) async {
  print('****** DEBUG: STARTED  ******');
  // factoryMethodClient.call();
  // abstractFactoryClient();
  // builderClient();
  // prototypeClient();
  // singletonClient();
  // adapterClient();
  bridgeClient();
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
