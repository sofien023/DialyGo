import 'package:flutter/material.dart';
import 'appointment_model.dart';

class AppointmentProvider with ChangeNotifier {
  final List<Appointment> _appointments= [];

  List<Appointment> get appointments => _appointments;

  void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
    notifyListeners(); // Notify listeners about the change
  }
}