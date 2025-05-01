import 'package:flutter/material.dart';
import 'package:delivery_manager/services/auth_service.dart';
import 'package:delivery_manager/utils/logger.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  void _loginWithEmail() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    final user = await _authService.signInWithEmail(email, password);
    if (user != null) {
      logger.i("Usuário logado: ${user.email}");
    } else {
      logger.w("Falha ao logar com e-mail");
    }
  }

  void _loginWithGoogle() async {
    final user = await _authService.signInWithGoogle();
    if (user != null) {
      logger.i("Usuário logado com Google: ${user.email}");
    } else {
      logger.w("Falha ao logar com Google");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "E-mail"),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "Senha"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _loginWithEmail,
              child: const Text("Entrar com E-mail"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _loginWithGoogle,
              child: const Text("Entrar com Google"),
            ),
          ],
        ),
      ),
    );
  }
}
