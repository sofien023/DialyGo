import 'package:flutter/material.dart';

class AuthenticationService with ChangeNotifier {
  bool isLoggedIn = false;
  String _error = '';

  /*bool get isLoggedIn => _isLoggedIn;*/
  String get error => _error;

  Future<void> login(String username, String password) async{
    _error = '';
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2)); // Simulate network delay

    // REPLACE with your actual authentication logic
    if (username == 'test' && password == 'test') {
      isLoggedIn = true;
    } else {
      _error = 'Invalid credentials';
    }
    notifyListeners();
  }

  Future<void> register(String username, String password) async {
    _error = '';
    notifyListeners();
    await Future.delayed(const Duration(seconds: 2));// Simulate network delay

    // REPLACE with your actual registration logic
    if (username.isNotEmpty && password.isNotEmpty) {
      isLoggedIn = true;
    } else {
      _error = 'Username and password cannot be empty';
    }
    notifyListeners();
  }

  void logout() {
    isLoggedIn = false;
    _error = '';
    notifyListeners();
  }
}