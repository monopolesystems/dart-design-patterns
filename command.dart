library command;

abstract class CommandInterface {
  void execute();
}

class Receiver {
  void actualLogic(int a) {
    print('Actual Logic is run with ${a}');
  }
}

class Command1 implements CommandInterface {
  Receiver receiver;
  int a;
  Command1(this.receiver, this.a);
  @override
  void execute() {
    this.receiver.actualLogic(this.a);
  }
}

class Command2 implements CommandInterface {
  @override
  void execute() {}
}
