import 'package:flutter/material.dart';
import 'package:flutter_auth/screens/auth/log_in.dart';
import 'package:flutter_auth/screens/auth/sign_up.dart';
import 'package:flutter_auth/widgets/custom_button.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ana Ekran')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          // Ana eksende ortala isterseniz:
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Expanded: butonun kullanılabilir alana eşit pay ayırmasını sağlar
            Expanded(
              child: CustomButton(
                label: 'Login',
                onPressed:
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => LogIn())),
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
              ),
            ),
            // Row içinde yatay boşluk için width kullanın
            SizedBox(width: 16),
            Expanded(
              child: CustomButton(
                label: 'SignUp',
                onPressed:
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (_) => SignUp())),
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
