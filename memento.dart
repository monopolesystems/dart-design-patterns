abstract class Restorable {
  Memento saveState();
  void restoreState(Memento state);
}

class Editor implements Restorable {
  int x = 0, y = 1, z = 2;
  @override
  void restoreState(Memento memento) {
    final Editor state = memento.state;
    this.x = state.x;
    this.y = state.y;
    this.z = state.z;
  }

  @override
  Memento saveState() {
    return new Memento<Editor>(new Editor()
      ..x = this.x
      ..y = this.y
      ..z = this.z);
  }

  @override
  String toString() {
    return '(${this.x},${this.y},${this.z})';
  }
}

class Memento<T> {
  T state;
  Memento(this.state);
}

class Caretaker<T> {
  List<Memento> history = [];
  Restorable originator;
  Caretaker(this.originator);

  void push() {
    this.history.add(this.originator.saveState());
  }

  void pop() {
    final memento = this.history.length > 0 ? this.history.removeLast() : null;
    if (memento != null) this.originator.restoreState(memento);
  }
}
