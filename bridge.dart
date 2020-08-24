abstract class Color {
  String colorValue;
  Color(this.colorValue);
  void paint() {
    print('Painting with ${this.colorValue}');
  }
}

class Red extends Color {
  Red() : super('Red');
}

class Yellow extends Color {
  Yellow() : super('Yellow');
}

abstract class Shape {
  Color color;
  Shape(this.color);
  draw();
  paint() {
    this.color.paint();
  }
}

class Circle extends Shape {
  double radius;
  Circle(this.radius, Color color) : super(color);

  @override
  draw() {
    print('Draw circle of radius ${this.radius}');
  }
}

class Square extends Shape {
  double side;
  Square(this.side, Color color) : super(color);

  @override
  draw() {
    print('Draw square of radius ${this.side}');
  }
}
