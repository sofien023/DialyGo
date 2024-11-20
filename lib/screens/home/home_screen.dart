import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Home'),


      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            _buildButton(context, Icons.healing, 'Health Monitoring', () => Navigator.pushNamed(context, '/healthm')),
            const SizedBox(height: 20),
            _buildButton(context, Icons.bloodtype_outlined, 'Dialysis Report', () => Navigator.pushNamed(context, '/diarep')),
            const SizedBox(height: 20),
            _buildButton(context, Icons.medical_services, 'Request Ambulance', () {
              Navigator.pushNamed(context, '/ambulanceRequest');
            }),
            const SizedBox(height: 20), // Increased spacing between buttons
            _buildButton(context, Icons.calendar_today, 'Schedule Appointment', () => Navigator.pushNamed(context, '/appointment')),
            const SizedBox(height: 20),
            _buildButton(context, Icons.history, 'View Archive', () => Navigator.pushNamed(context, '/archive')),


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
          padding: const EdgeInsets.all(24.0), // Increased padding within button
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, size: 40),
            const SizedBox(width: 10),
            Text(text),
          ],
        ),
      ),
    );
  }
}