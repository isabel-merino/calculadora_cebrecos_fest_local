class GlobalVariables {
  // Singleton pattern
  static final GlobalVariables _instance = GlobalVariables._internal();

  factory GlobalVariables() {
    return _instance;
  }

  GlobalVariables._internal();

  // Definition of global variable
  double summ = 0.00;
}

