import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_auth/auth_state_switcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // .env yüklemesi
  try {
    await dotenv.load(fileName: ".env");
    print("📌 `.env` dosyası başarıyla yüklendi!");
  } catch (e) {
    print("🚨 `.env` dosyası yüklenemedi! Hata: $e");
  }

  // Firebase başlatma
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      print("🔥 Firebase Başlatıldı!");
    } else {
      print("Firebase zaten başlatılmış.");
    }

    // Dil kodunu initialize'dan sonra ayarlıyoruz
    FirebaseAuth.instance.setLanguageCode('tr');
  } catch (e) {
    print("🚨 Firebase Başlatma Hatası: $e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      home: AuthStateSwitcher(),
    );
  }
}
