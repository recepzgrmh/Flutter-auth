import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/auth/log_in.dart';
import 'package:flutter_auth/screens/home_screen.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_auth/screens/auth/verify_account.dart';
import 'package:flutter_auth/screens/main_screen.dart';

class AuthStateSwitcher extends StatefulWidget {
  const AuthStateSwitcher({super.key});

  @override
  State<AuthStateSwitcher> createState() => _AuthStateSwitcherState();
}

class _AuthStateSwitcherState extends State<AuthStateSwitcher> {
  // Kullanıcının e-posta onay durumunu yeniden yüklemek için
  Future<void> _reloadIfNeeded() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.reload();
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _reloadIfNeeded();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // Bağlantı henüz kurulmamışsa yükleme göstergesi
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          // Giriş yapmış kullanıcı
          final user = snapshot.data!;
          if (user.emailVerified) {
            return HomeScreen();
          } else {
            return VerifyAccount();
          }
        } else {
          // Giriş yapmamış kullanıcı
          return MainScreen();
        }
      },
    );
  }
}
