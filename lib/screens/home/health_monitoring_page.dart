import 'package:flutter/material.dart';

class HealthMonitoringPage extends StatefulWidget {
  const HealthMonitoringPage({super.key});

  @override
  State<HealthMonitoringPage> createState() => _HealthMonitoringPageState();}

class _HealthMonitoringPageState extends State<HealthMonitoringPage> {
  // Sample health data (replace with actual data from sensors or APIs)
  int heartRate = 75;
  double bodyTemperature = 36.8;
  int stepsCount = 5000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Monitoring'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMetricCard('Heart Rate', heartRate.toString(), 'bpm', Icons.favorite, Colors.red),
            _buildMetricCard('Body Temperature', bodyTemperature.toString(), '°C', Icons.thermostat, Colors.orange),
            _buildMetricCard('Steps Count', stepsCount.toString(), 'steps', Icons.directions_walk, Colors.green),
            // Add more metric cards as needed
          ],
        ),
      ),
    );
  }

  Widget _buildMetricCard(String title, String value, String unit, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('$value$unit', style: const TextStyle(fontSize: 24)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}