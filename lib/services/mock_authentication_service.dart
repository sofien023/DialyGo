import 'package:flutter/material.dart';

class MockAuthenticationService with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    // Simulate login delay
    await Future.delayed(const Duration(seconds: 1));

    // Set isLoggedIn to true
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> register(String email, String password) async {
    // Simulate registration delay
    await Future.delayed(const Duration(seconds: 1));

    // Set isLoggedIn to true
    _isLoggedIn = true;
    notifyListeners();
  }

  Future<void> logout() async {
    // Simulate logout delay
    await Future.delayed(const Duration(seconds: 1));

    // Set isLoggedIn to false
    _isLoggedIn = false;
    notifyListeners();
  }
}