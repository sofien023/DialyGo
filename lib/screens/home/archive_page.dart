import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace with data fetched from your backend
    final sessions = [
      {'date': DateTime(2024, 3, 8), 'time': '10:00', 'notes': 'Successful session'},
      {'date': DateTime(2024, 3, 1), 'time': '14:30', 'notes': 'Minor complication'},
    ];
    final dateFormat = DateFormat('yyyy-MM-dd');
    final timeFormat = DateFormat('HH:mm');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive'),

      ),
      backgroundColor: Colors.grey[100],

      body: ListView.builder(
        itemCount: sessions.length,
        itemBuilder: (context, index) {
          final session = sessions[index];
          final sessionDate = session['date'] as DateTime; //Type cast to DateTime
          return ListTile(
            title: Text(dateFormat.format(sessionDate)),
            subtitle: Text('${timeFormat.format(sessionDate)} - ${session['notes']}'),
          );
        },
      ),
    );
  }
}