import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utils/auth_service.dart'; // Ajustando la ruta de utils
import '../utils/login_screen.dart'; // Ajustando la ruta de login_screen
import '../pages/home_pages.dart'; // Ajustando la ruta de home_pages.dart

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return StreamBuilder<dynamic>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final user = snapshot.data;

          if (user == null) {
            return const LoginScreen();
          }

          return const HomePage();
        }

        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
