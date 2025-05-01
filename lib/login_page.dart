import 'package:flutter/material.dart';
import 'package:delivery_manager/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginWithEmail() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    try {
      await AuthService().loginWithEmail(email, password);
      if (!mounted) return;
      // StreamBuilder em main.dart redirecionará automaticamente para HomePage
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro: $e')));
    }
  }

  void _loginWithGoogle() async {
    try {
      await AuthService().loginWithGoogle();
      if (!mounted) return;
      // Redirecionamento automático via StreamBuilder
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Erro: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'E-mail'),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Senha'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loginWithEmail,
              child: const Text('Entrar com E-mail'),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _loginWithGoogle,
              icon: const Icon(Icons.login),
              label: const Text('Entrar com Google'),
            ),
          ],
        ),
      ),
    );
  }
}
