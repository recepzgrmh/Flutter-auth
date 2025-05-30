import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> logOut() async {
    // 1) Oturumu kapat
    await FirebaseAuth.instance.signOut();

    // 2) Tüm önceki rotaları temizleyip MainScreen'e git
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => MainScreen()),
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: logOut, child: Text('Çıkış Yap')),
      ),
    );
  }
}
