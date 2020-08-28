abstract class Iterable {
  int get length;
}

class ListIterable implements Iterable {
  final List _list;
  ListIterable(this._list);

  @override
  int get length => this._list.length;
}

abstract class Iterator {
  next();
  bool hasNext();
}

class ListIterator extends Iterator {
  ListIterable _listIterable;
  int index = 0;
  ListIterator(this._listIterable);

  @override
  next() => _listIterable._list[this.index++];

  @override
  bool hasNext() => this.index < (this._listIterable.length);
}

class ListReverseIterator extends Iterator {
  ListIterable _listIterable;
  int index;
  ListReverseIterator(this._listIterable) {
    index = this._listIterable.length;
  }

  @override
  bool hasNext() => this.index > 0;

  @override
  next() => this._listIterable._list[--this.index];
}
