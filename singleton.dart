library singleton;

class Singleton {
  static Singleton _instance;
  Singleton._();
  static getInstance() {
    if (Singleton._instance == null) {
      Singleton._instance = new Singleton._();
    }
    return Singleton._instance;
  }
}
