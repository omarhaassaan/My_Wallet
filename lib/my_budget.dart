class MyBudget {
  // Set constructor as private
  MyBudget._privateConstructor();
  // Private variable to hold object
  static final MyBudget _instance = MyBudget._privateConstructor();
  // Getter for the single object
  static MyBudget get instance => _instance;
  // Variables
  String _name = '';
  double _currentBudget = 0;
  String _currency = '\$';
  // Setters
  bool addAmount(double a) {
    _currentBudget += a;
    return true;
  }

  bool subtractAmount(double a) {
    if (a > _currentBudget)
      return false;
    else {
      _currentBudget -= a;
      return true;
    }
  }

  // Getters
  double get currentBudget => _currentBudget;
  String get name => _name;
  String get currency => _currency;
}
