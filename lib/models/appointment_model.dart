import 'package:flutter/material.dart';

class Appointment {
  final String title; // Could be "Ambulance Request"
  final String description; // Could include details like session type
  final DateTime date;
  final TimeOfDay time;final String sessionType;// e.g., "Emergency", "Routine", "Follow-up"

  Appointment({
    required this.title,
    required this.description,
    required this.date,
    required this.time,
    required this.sessionType,
  });

  // ... other methods ...

  // Example factory constructor to create an Appointment from form data
  factory Appointment.fromAmbulanceRequest(
      DateTime date, TimeOfDay time, String sessionType) {
    return Appointment(
      title: 'Ambulance Request',
      description: 'Session Type: $sessionType',
      date: date,
      time: time,
      sessionType: sessionType,
    );
  }

  // Add a factory constructor to create an Appointment from JSON data
  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      title: json['title'] as String,
      description: json['description'] as String,
      date: DateTime.parse(json['date'] as String),
      time: _timeOfDayFromJson(json['time'] as String),
      sessionType: json['sessionType'] as String,
    );
  }

  // Helper function to parse TimeOfDay from JSON
  static TimeOfDay _timeOfDayFromJson(String timeString) {
    final parts = timeString.split(':');
    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }

  // Add a method to convert Appointment to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'time': '${time.hour}:${time.minute}',
      'sessionType': sessionType,
    };
  }
}