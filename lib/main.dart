import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';

// Importações de serviços e telas
import 'firebase_options.dart';
import 'services/auth_service.dart';
import 'pages/login_screen.dart';
import 'pages/home_screen.dart';
import 'pages/earnings_screen.dart';
import 'pages/add_delivery_screen.dart';

// Logger global
final logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    logger.e("Erro ao inicializar Firebase: $e");
  }

  runApp(const DeliveryManagerApp());
}

class DeliveryManagerApp extends StatelessWidget {
  const DeliveryManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<AuthService>(create: (_) => AuthService())],
      child: MaterialApp(
        title: 'Delivery Manager',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
        initialRoute: '/login',
        routes: {
          '/login': (context) => const LoginScreen(),
          '/home': (context) => const HomeScreen(),
          '/earnings': (context) => const EarningsScreen(),
          '/add_delivery': (context) => const AddDeliveryScreen(),
        },
      ),
    );
  }
}
