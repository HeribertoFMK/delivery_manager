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
          if (constraints.maxWidth > 600) {
            // Layout para telas maiores (tablet ou web)
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.delivery_dining, size: 64),
                  const SizedBox(width: 32),
                  const Text(
                    'Bem-vindo ao Delivery Manager!',
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            );
          } else {
            // Layout para celular
            return const Center(
              child: Text(
                'Bem-vindo ao Delivery Manager!',
                style: TextStyle(fontSize: 18),
              ),
            );
          }
        },
      ),
    );
  }
}
