import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _password,
              decoration: const InputDecoration(labelText: 'Senha'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            // Botão de Login Regular
            ElevatedButton(
              onPressed: () async {
                final auth = Provider.of<AuthService>(context, listen: false);
                await auth.login(_email.text, _password.text);

                if (!mounted) return;

                if (auth.isLoggedIn) {
                  // Ignora o lint APENAS nesta linha, após verificar mounted
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: const Text('Entrar'),
            ),

            // Botão de Login com Google
            ElevatedButton.icon(
              icon: const Icon(Icons.login),
              label: const Text('Entrar com Google'),
              onPressed: () async {
                final auth = Provider.of<AuthService>(context, listen: false);
                await auth.loginWithGoogle();

                if (!mounted) return;

                if (auth.isLoggedIn) {
                  // Ignora o lint APENAS nesta linha
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
