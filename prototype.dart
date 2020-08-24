import 'dart:math';

abstract class Cloneable {
  Cloneable clone();
}

class Point2D implements Cloneable {
  double x, y;
  Point2D(this.x, this.y);
  @override
  Point2D clone() {
    return new Point2D(this.x, this.y);
  }

  double distanceFromOrigin() {
    return magnitude(this.x, this.y);
  }
}

class Point3D extends Point2D {
  double z;
  Point3D(double x, double y, [this.z = 0]) : super(x, y);
  @override
  Point3D clone() {
    Point3D clone = super.clone();
    clone.z = this.z;
    return clone;
  }

  @override
  double distanceFromOrigin() {
    return magnitude(super.distanceFromOrigin(), this.z);
  }
}

double magnitude(double x, double y) {
  return sqrt(x * x + y * y);
}
