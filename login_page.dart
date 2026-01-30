import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'dashboard.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = AuthService();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Telemedicine Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController),
            TextField(
              controller: passwordController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                await auth.login(
                  emailController.text,
                  passwordController.text,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const Dashboard(),
                  ),
                );
              },
              child: const Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
