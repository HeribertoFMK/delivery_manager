import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              auth.logout();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth > 600;

          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.delivery_dining, size: isWide ? 64 : 48),
              const SizedBox(height: 20),
              Text(
                'Bem-vindo ao Delivery Manager!',
                style: TextStyle(fontSize: isWide ? 24 : 18),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/add_delivery');
                },
                child: const Text('Nova Entrega'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/earnings');
                },
                child: const Text('Ver Ganhos'),
              ),
            ],
          );
        },
      ),
    );
  }
}
