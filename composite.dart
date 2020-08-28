library composite;

abstract class Component {
  double getPrice();
}

class Product extends Component {
  double price;
  Product(this.price);
  @override
  double getPrice() {
    return this.price;
  }
}

class Package extends Component {
  List<Component> children;
  Package(this.children);
  @override
  double getPrice() {
    return this
            .children
            .map((e) => e.getPrice())
            .reduce((value, element) => value + element) +
        0.59; //let's say 0.59 is the overhead for every packing;
  }
}
