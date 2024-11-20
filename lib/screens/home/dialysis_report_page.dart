import 'package:flutter/material.dart';

class DialysisReportPage extends StatelessWidget {
  const DialysisReportPage({super.key});

  @override
  Widget build(BuildContext context){
    // Sample dialysis report data (replace with actual data)
    final reportData = {
      'patientName': 'John Doe',
      'treatmentDate': '2023-11-16',
      'treatmentTime': '10:00 AM - 1:00 PM',
      'bloodFlowRate': '250 ml/min',
      'dialysateFlowRate': '500 ml/min',
      'ultrafiltrationRate': '1000 ml/hr',
      'preWeight': '70 kg',
      'postWeight': '68 kg',
      'bloodPressure': '120/80 mmHg',
      'notes': 'Patient tolerated treatment well.',
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialysis Report'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildReportSection('Patient Information', [
              _buildReportItem('Patient Name', reportData['patientName']!),
              _buildReportItem('Treatment Date', reportData['treatmentDate']!),
              _buildReportItem('Treatment Time', reportData['treatmentTime']!),
            ]),
            _buildReportSection('Treatment Parameters', [
              _buildReportItem('Blood Flow Rate', reportData['bloodFlowRate']!),
              _buildReportItem('Dialysate Flow Rate', reportData['dialysateFlowRate']!),
              _buildReportItem('Ultrafiltration Rate', reportData['ultrafiltrationRate']!),
            ]),
            _buildReportSection('Weight andBlood Pressure', [
              _buildReportItem('Pre-Weight', reportData['preWeight']!),
              _buildReportItem('Post-Weight', reportData['postWeight']!),
              _buildReportItem('Blood Pressure', reportData['bloodPressure']!),
            ]),
            _buildReportSection('Notes', [
              _buildReportItem('Notes', reportData['notes']!),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildReportSection(String title, List<Widget> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        ...items,
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildReportItem(String label, String value) {
    return Row(
      children: [
        Text('$label: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(value),
      ],
    );
  }
}