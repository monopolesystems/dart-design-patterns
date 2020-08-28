library chainofresponsibility;

import 'dart:io';

class Request {
  List<String> _handleFlags = [];
  set handleFlags(List<String> flags) => this._handleFlags = flags;
}

abstract class HandlerInterface {
  void execute(Request request);
  void setNext(HandlerInterface next);
}

abstract class BaseHandler implements HandlerInterface {
  HandlerInterface _next;
  @override
  void setNext(HandlerInterface next) {
    this._next = next;
  }

  @override
  void execute(Request request) {
    bool hasHandled = this.handle(request);
    if ( //! hasHandled && // this can be added to skip forwarding when handled by atleast one handler
        this._next != null) this._next.execute(request);
  }

//the return bool can be used to stop forwarding once a handler has taken care of things.
  bool handle(Request request);
}

class ConcreteHandlerA extends BaseHandler {
  @override
  bool handle(Request request) {
    if (request._handleFlags.contains('A')) {
      print('Handling A');
      return true;
    } else {
      return false;
    }
  }
}

class ConcreteHandlerB extends BaseHandler {
  @override
  bool handle(Request request) {
    if (request._handleFlags.contains('B')) {
      print('Handling B');
      return true;
    } else {
      return false;
    }
  }
}
