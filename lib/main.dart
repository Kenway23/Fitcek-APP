import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import '/pages/profile_page.dart';
import '/pages/splash_page.dart';
import '/pages/login_page.dart';
import '/pages/register_page.dart';
import '/pages/navigation_page.dart';
import '/pages/rekomendasi_page.dart';
import '/pages/outfit_ai_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inisialisasi Gemini - ganti dengan API key kamu
  Gemini.init(apiKey: 'AIzaSyDh2sA9cisnwRHXNSFpUqzJ4Xz6fwQFM6w');

  final result = await Gemini.instance.text("Hello!");
  print(result);

  runApp(const FitCekApp());
}

class FitCekApp extends StatelessWidget {
  const FitCekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FitCek',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      // Ganti routes menjadi onGenerateRoute untuk kirim data
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (_) => const SplashPage());
          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());
          case '/register':
            return MaterialPageRoute(builder: (_) => const RegisterPage());
          case '/home':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) => NavigationPage(
                user: {'name': args['name']!, 'email': args['email']!},
              ),
            );
          case '/collection':
            return MaterialPageRoute(builder: (_) => const RekomendasiPage());
          case '/ai':
            return MaterialPageRoute(builder: (_) => const OutfitAIPage());
          case '/profile':
            final args = settings.arguments as Map<String, dynamic>;
            return MaterialPageRoute(
              builder: (_) =>
                  ProfilePage(name: args['name']!, email: args['email']!),
            );
          default:
            return null;
        }
      },
    );
  }
}
