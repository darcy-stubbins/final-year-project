import 'package:my_app/coreFunctionality/loginController.dart';

class Core {
  bool loggedIn = false;
  int loginRoutePageIndex = 0;
  int dashboardPageIndex = 0;
  bool displayCounter = false;
  late Function changeAppState;

  static Core singleton = Core._();

  Core._() {
    //empty constructor
  }

  static Core getInstance() {
    return Core.singleton;
  }

  void setChangeAppState(Function changeAppState) {
    this.changeAppState = changeAppState;
  }

  bool getDisplayCounter() {
    return displayCounter;
  }

  Function getChangeAppState() {
    return changeAppState;
  }

  int getLoginRoutePageIndex() {
    return loginRoutePageIndex;
  }

  int getDashboardPageIndex() {
    return dashboardPageIndex;
  }

  void login() {
    loggedIn = LoginController.login();
    changeAppState();
  }

  void changeLoginRoutePageIndex(int pageIndex) {
    loginRoutePageIndex = pageIndex;
    changeAppState();
  }

  void changeDashboardPageIndex(int pageIndex) {
    dashboardPageIndex = pageIndex;
    changeAppState();
  }

  void changeDisplayCounter(bool displayCounter) {
    this.displayCounter = displayCounter;
    changeAppState();
  }
}
