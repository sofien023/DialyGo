import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/appointment_model.dart';
import '../../models/appointment_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});


  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  Future<List<Appointment>>? _futureAppointmentData;

  @override
  void initState() {
    super.initState();
    _loadAppointmentData();
  }

  Future<void> _loadAppointmentData() async {
    setState(() {
      _futureAppointmentData = fetchAppointmentData();
    });
  }

  Future<List<Appointment>> fetchAppointmentData() async {
    try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('apiUrl', '3000');

// Retrieve the API URL from Shared Preferences
    String? apiUrl = prefs.getString('apiUrl');

// In your fetchAppointmentData function
    final response = await http.get(Uri.parse(apiUrl!));
      if (response.statusCode == 200) {
        // Check if the response is JSON
        if (response.headers['content-type']?.contains('application/json') ?? false) {
          final jsonData = jsonDecode(response.body) as List<dynamic>;
          // Adjust fromJson to match your JSON structure
          return jsonData.map((appointmentJson) => Appointment.fromJson(appointmentJson)).toList();
        } else {
          // Handle HTML response or throw an error
          throw Exception('Invalid response format: Expected JSON, got HTML');
        }
      } else {
        throw Exception('Failed to load appointment data: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error fetching appointment data: $error');
      rethrow; // Rethrow the error to be handled bythe UI
    }
  }

  @override
  Widget build(BuildContext context) {
    final Object? args = ModalRoute.of(context)!.settings.arguments;
    final Appointment? appointment = args is Appointment ? args : null;

    if (appointment != null) {
      Provider.of<AppointmentProvider>(context, listen: false).addAppointment(appointment);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Schedule Appointment')),
      body: Center(
        child: FutureBuilder<List<Appointment>>(
          future: _futureAppointmentData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              final appointments = snapshot.data!;
              // Check if appointments is empty
              if (appointments.isEmpty) {
                return const Text('There are no appointments');
              } else {
                // Process and display appointment data here
                return ListView.builder(
                  itemCount: appointments.length,
                  itemBuilder: (context, index) {
                    final appointment = appointments[index];
                    return ListTile(
                      title: Text(appointment.title),
                      subtitle: Text(appointment.description),
                      // Add other appointment details as needed
                    );
                  },
                );
              }
            } else {
              return const Text('No appointment data available.');
            }
          },
        ),
      ),
    );
  }
}