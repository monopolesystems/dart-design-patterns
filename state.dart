class Context {
  State state;
  Context(State initialState) {
    this.state = initialState;
  }

  pressDown() {
    this.state.pressDown();
  }

  pressUp() {
    this.state.pressUp();
  }
}

abstract class State implements VolumeInterface {
  Context context;
}

abstract class VolumeInterface {
  void pressDown();
  void pressUp();
}

class MediaVolumeState extends State implements VolumeInterface {
  int volume = 0;
  @override
  pressDown() {
    print('Volume reduced to ${--this.volume}');
  }

  @override
  pressUp() {
    print('Volume increased to ${++this.volume}');
  }
}
