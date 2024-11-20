import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home/home_screen.dart';
import '../../screens/on_boarding_screen.dart';
import '../../services/authentication_service.dart';

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationService>(
      builder: (context, authService, child) {
        if (authService.isLoggedIn) {
          return const HomeScreen();
        } else {
          return const OnboardingScreen(); // Start with OnboardingScreen
        }
      },
    );
  }
}