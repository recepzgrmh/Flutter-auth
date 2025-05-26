import 'package:flutter/material.dart';
import 'package:flutter_auth/log_in.dart';
import 'package:flutter_auth/sign_up.dart';
import 'package:flutter_auth/widgets/custom_button.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Auth'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade600,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogIn()),
                    );
                  },
                  label: 'Giriş Yap',
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  label: 'Kayıt Ol',
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
