
class RootStore {
  RootStore._privateConstuctor();

  static final RootStore _instance = RootStore._privateConstuctor();

  RootStore factory () {
    return _instance;
  }
}