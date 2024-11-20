import 'package:flutter/material.dart';

class AuthenticationModel with ChangeNotifier {
  bool _isLoggedIn = false;
  String _errorMessage = '';

  bool get isLoggedIn => _isLoggedIn;
  String get errorMessage => _errorMessage;

  Future<void> login(String username, String password) async {
    _errorMessage = '';
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2)); // Simulate delay
    if (username == 'test' && password == 'test') { // REPLACE with actual authentication
      _isLoggedIn = true;
    } else {
      _errorMessage = 'Invalid credentials';
    }
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}