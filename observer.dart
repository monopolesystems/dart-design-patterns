class Publisher {
  Set<SubscriberInterface> subscribers = {};
  Function register(SubscriberInterface subscriber) {
    this.subscribers.add(subscriber);
    return () => this.unregister(subscriber);
  }

  unregister(SubscriberInterface subscriber) {
    this.subscribers.remove(subscriber);
  }

  void publish(dynamic data) {
    this.subscribers.forEach((subscriber) {
      subscriber.update(data);
    });
  }
}

abstract class SubscriberInterface {
  void update(dynamic data);
}

class Subscriber implements SubscriberInterface {
  int id;
  Subscriber(this.id);
  @override
  void update(data) {
    print('Subscriber ${this.id} got $data');
  }
}
