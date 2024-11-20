import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/authentication_service.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: ExactAssetImage(
                'assets/logo.png', // Replace with your image path
                scale: 1.0, // Adjust the scale if needed

              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'DialyGo', // Replace with user's name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('Birthdate: November 16, 2024'), // Replace with user's birthdate
            const SizedBox(height: 10),
            const Text('Phone: +1 (123) 456-7890'), // Replace with user's phone number
            const SizedBox(height: 10),
            const Text('Email: DialyGo@example.com'), // Replace with user's email
            const SizedBox(height: 20),
            _buildButton(context, Icons.logout, 'Logout', () {
              Provider.of<AuthenticationService>(context, listen: false).logout();
              // Navigate to login page and remove all other routes
              Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, IconData icon, String text, VoidCallback onPressed) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 24),
            const SizedBox(width: 10),
            Text(text),
          ],
        ),
      ),
    );
  }
}