import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/authentication_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState()=> _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        leading: Image.asset("assets/logo.png"), // Add logo to leading property
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(labelText: 'Username'),
                    validator: (value) => value == null || value.isEmpty ? 'Enter username' : null,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(labelText: 'Password'),
                    obscureText:true,
                    validator: (value) => value == null || value.isEmpty ? 'Enter password' : null,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: (value) => value == null || value.isEmpty || value != _passwordController.text ? 'Passwords do not match' : null,
                  ),
                ),
                if (authService.error.isNotEmpty)
                  Text(authService.error, style: const TextStyle(color: Colors.red)),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await authService.register(_usernameController.text, _passwordController.text);
                        if (authService.isLoggedIn) {
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      }
                    },
                    child: const Text('Register'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}