import 'dart:collection';

class Core {
  bool loggedIn = false;
  int loginRoutePageIndex = 0;
  int dashboardPageIndex = 0;
  bool displayCounter = false;
  final Map<int, int> counters = HashMap();
  int currentCounter = 0;
  int currentPatternId = 0;
  late Function changeAppState;
  String token = '';
  String apiEndpoint = 'https://10.0.2.2/';

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

  int getCurrentPatternId() {
    return currentPatternId;
  }

  String getToken() {
    return token;
  }

  void login(String token) {
    this.token = token;
    loggedIn = true;
    changeAppState();
  }

  void logout() {
    this.token = '';
    loggedIn = false;
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

  void openPatternDetails(int patternID) {
    //update the counter
    this.currentCounter = patternID;

    this.changeDashboardPageIndex(4);
  }

  void openCommentCard(int patternID) {
    this.currentPatternId = patternID;
    this.changeDashboardPageIndex(5);
  }

  int? getCurrentCounterValue() {
    if (this.counters.containsKey(this.currentCounter)) {
      return this.counters[this.currentCounter];
    } else {
      return null;
    }
  }

  void createCounter() {
    this.counters[this.currentCounter] = 0;
    changeAppState();
  }

  void changePatternId(int patternId) {
    this.currentPatternId = patternId;
    changeAppState();
  }
}
