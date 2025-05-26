import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/custom_button.dart';
import 'package:flutter_auth/widgets/text_inputs.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController fullName = TextEditingController();
  final TextEditingController lastName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        toolbarHeight: 50,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                "Hesap Oluştur",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Başlamak İçin Kayıt Olun!",
                style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 40),

              // TextInputs widget'ları
              TextInputs(labelText: 'İsim', controller: fullName),
              const SizedBox(height: 20),
              TextInputs(labelText: 'Soyisim', controller: lastName),
              const SizedBox(height: 20),
              TextInputs(labelText: 'E-mail', controller: email, isEmail: true),
              const SizedBox(height: 20),
              TextInputs(
                labelText: 'Şifre',
                controller: password,
                isPassword: true,
              ),
              const SizedBox(height: 20),
              Text(
                "Devam ederek Kullanım Şartları'nı kabul etmiş olursunuz.\nGizlilik Politikamızı okuyun.",
                style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
              ),
              const SizedBox(height: 30),

              // "Kayıt Ol" butonu
              CustomButton(
                label: "Kayıt Ol",
                onPressed: () {},
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                verticalPadding: 16,
                minHeight: 48,
                elevation: 3,
                borderRadius: const BorderRadius.all(Radius.circular(6)),
                textStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
