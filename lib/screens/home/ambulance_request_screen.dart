import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/appointment_model.dart';
import '../../models/appointment_provider.dart'; // Assuming you have this provider
import 'package:provider/provider.dart';

class AmbulanceRequestScreen extends StatefulWidget {
  const AmbulanceRequestScreen({super.key});

  @override
  State<AmbulanceRequestScreen> createState() => _AmbulanceRequestScreenState();
}

class _AmbulanceRequestScreenState extends State<AmbulanceRequestScreen> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String? _selectedSessionType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ambulance Request'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Date input
              TextFormField(
                decoration: const InputDecoration(labelText: 'Date'),
                readOnly: true,
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null && picked != _selectedDate) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
                controller: TextEditingController(
                  text: _selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                      : '',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date';
                  }
                  return null;
                },
              ),

              // Time input
              TextFormField(
                decoration: const InputDecoration(labelText: 'Time'),
                readOnly: true,
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null && picked != _selectedTime) {
                    setState(() {
                      _selectedTime = picked;
                    });
                  }
                },
                controller: TextEditingController(
                  text: _selectedTime != null
                      ? _selectedTime!.format(context)
                      : '',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a time';
                  }
                  return null;
                },
              ),

              // Session type input (dropdown)
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(labelText: 'Session Type'),
                value: _selectedSessionType,
                onChanged: (newValue) {
                  setState(() {
                    _selectedSessionType = newValue;
                  });
                },
                items: <String>['Emergency', 'Routine', 'Follow-up']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a session type';
                  }
                  return null;
                },
              ),

              // Request Ambulance button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Create an Appointment object
                    final appointment = Appointment.fromAmbulanceRequest(
                      _selectedDate!,
                      _selectedTime!,
                      _selectedSessionType!,
                    );

                    // Add the appointment to the provider
                    Provider.of<AppointmentProvider>(context, listen: false)
                        .addAppointment(appointment);

                    // You can navigate to another screen or show a confirmation message
                    // For now, let's just print the appointment details
                    print('Appointment created: $appointment');
                  }
                },
                child: const Text('Request Ambulance'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}