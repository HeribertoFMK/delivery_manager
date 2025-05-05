import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/auth_service.dart';
import 'pages/login_screen.dart';
import 'pages/register_screen.dart';
import 'pages/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:delivery_manager/utils/logger.dart'; // Ajuste para o caminho correto
import 'firebase_options.dart'; // Certifique-se que este arquivo existe!

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Altere esta linha para incluir as options
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform, // ← Esta é a chave!
    );
    runApp(
      ChangeNotifierProvider(
        create: (_) => AuthService(),
        child: const DeliveryManagerApp(),
      ),
    );
  } catch (e) {
    logger.e("Erro crítico: $e");
    runApp(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: Text('Erro ao inicializar o Firebase')),
        ),
      ),
    );
  }
}

class DeliveryManagerApp extends StatelessWidget {
  const DeliveryManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery Manager',
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
