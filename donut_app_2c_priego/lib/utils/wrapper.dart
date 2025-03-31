import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../utils/auth_service.dart'; // Ajustando la ruta de utils
import '../utils/login_screen.dart'; // Ajustando la ruta de login_screen
import '../home_pages.dart'; // Ajustando la ruta de home_pages.dart

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    
    return StreamBuilder<User?>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          
          if (user == null) {
            return const LoginScreen();
          }
          
          return const HomePage(); // HomeScreen no existe en la imagen, posiblemente sea HomePage
        }
        
        // Muestra un indicador de carga mientras se establece la conexión
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
