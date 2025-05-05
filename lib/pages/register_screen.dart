import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _confirmPassword = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextField(
                      controller: _email,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      controller: _password,
                      decoration: const InputDecoration(labelText: 'Senha'),
                      obscureText: true,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () async {
                        final auth = Provider.of<AuthService>(
                          context,
                          listen: false,
                        );
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
                    const SizedBox(height: 12),
                    ElevatedButton.icon(
                      icon: const Icon(Icons.login),
                      label: const Text('Entrar com Google'),
                      onPressed: () async {
                        final auth = Provider.of<AuthService>(
                          context,
                          listen: false,
                        );
                        await auth.loginWithGoogle();
                        if (!mounted) return;
                        if (auth.isLoggedIn) {
                          // Ignora o lint APENAS nesta linha, após verificar mounted
                          // ignore: use_build_context_synchronously
                          Navigator.pushReplacementNamed(context, '/home');
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
