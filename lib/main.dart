import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:logger/logger.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Importações do projeto
import 'firebase_options.dart';
import 'services/auth_service.dart';
import 'providers/locale_provider.dart';

import 'pages/login_screen.dart';
import 'pages/home_screen.dart';
import 'pages/earnings_screen.dart';
import 'pages/add_delivery_screen.dart';
import 'screens/settings_screen.dart'; // nova tela de configurações

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

  runApp(
    MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
        ChangeNotifierProvider<LocaleProvider>(create: (_) => LocaleProvider()),
      ],
      child: const DeliveryManagerApp(),
    ),
  );
}

class DeliveryManagerApp extends StatelessWidget {
  const DeliveryManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp(
      title: 'Delivery Manager',
      debugShowCheckedModeBanner: false,
      locale: localeProvider.locale,
      supportedLocales: const [Locale('en'), Locale('pt')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/earnings': (context) => const EarningsScreen(),
        '/add_delivery': (context) => const AddDeliveryScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
