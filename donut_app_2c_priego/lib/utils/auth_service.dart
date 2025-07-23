// auth_service.dart

class MockUser {
  final String email;

  MockUser({required this.email});
}

class AuthService {
  MockUser? _currentUser;

  // Stream simulado de autenticación
  Stream<MockUser?> get authStateChanges async* {
    yield _currentUser;
  }

  // Iniciar sesión simulado
  Future<MockUser> signInWithEmailAndPassword(String email, String password) async {
    // Aquí podrías validar con un backend real o simularlo
    if (email.isNotEmpty && password == '123456') {
      _currentUser = MockUser(email: email);
      return _currentUser!;
    } else {
      throw Exception('Credenciales inválidas');
    }
  }

  // Registrar simulado
  Future<MockUser> registerWithEmailAndPassword(String email, String password) async {
    // Simulación de registro
    _currentUser = MockUser(email: email);
    return _currentUser!;
  }

  // Cerrar sesión
  Future<void> signOut() async {
    _currentUser = null;
  }

  // Obtener usuario actual
  MockUser? get currentUser => _currentUser;
}
