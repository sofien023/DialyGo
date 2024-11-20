import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home/home_screen.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/register_screen.dart';
import 'screens/home/appointment_screen.dart';
import 'screens/home/archive_page.dart';
import 'screens/home/ambulance_request_screen.dart';
import 'screens/on_boarding_screen.dart';
import 'screens/home/profile_page.dart';
import 'screens/auth/authentication_wrapper.dart';
import 'services/authentication_service.dart';
import 'screens/home/health_monitoring_page.dart';
import 'screens/home/dialysis_report_page.dart';
void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DialyGo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfilePage(),
        '/appointment': (context) => const AppointmentScreen(),
        '/archive': (context) => const ArchivePage(),
        '/ambulanceRequest': (context) => const AmbulanceRequestScreen(),
        '/healthm' : (context) => const HealthMonitoringPage(),
        '/diarep' : (context) => const DialysisReportPage(),
      },
      home: const AuthenticationWrapper(),
    );
  }
}