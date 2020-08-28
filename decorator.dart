library decorator;

abstract class NotifierInterface {
  void notify();
}

class Notifier extends NotifierInterface {
  NotifierInterface wrapee;
  Notifier(this.wrapee);
  notify() {
    wrapee.notify();
  }
}

class SMSNotify extends Notifier {
  SMSNotify(NotifierInterface wrapee) : super(wrapee);
  @override
  void notify() {
    print('SMS Notification');
    super.notify();
  }
}

class EmailNotify extends Notifier {
  EmailNotify(NotifierInterface wrapee) : super(wrapee);
  @override
  void notify() {
    print('Email Notify');
    super.notify();
  }
}
