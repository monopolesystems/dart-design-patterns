abstract class ServiceInterface {
  void perform(int a) {}
}

class Service implements ServiceInterface {
  @override
  void perform(int a) {
    print('Service is performing on $a');
  }
}

class ServiceProxy implements ServiceInterface {
  ServiceInterface _service;
  ServiceProxy(this._service);
  @override
  void perform(int a) {
    print('Proxy Redirection');
    this._service.perform(a);
  }
}
