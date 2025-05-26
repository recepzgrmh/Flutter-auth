import 'package:flutter/material.dart';
import 'package:flutter_auth/widgets/custom_button.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: Geri tuşu Get.offAll ile çalışıyor
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        toolbarHeight: 100,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Icon(
                  Icons.email_outlined,
                  size: 100,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Lütfen mailinize gelen doğrulama linkine tıklayın",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 30),

              // "Devam Et" butonu
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: "Devam Et",
                  onPressed: () {},
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  verticalPadding: 16,
                  minHeight: 48,
                  elevation: 5,
                  borderRadius: BorderRadius.zero,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text(
                "Doğrulama maili ulaşmadı mı?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 15),

              // "Tekrar Gönder" butonu
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  label: "Tekrar Gönder",
                  onPressed: () {},
                  backgroundColor: const Color(0xFFE8EEF2),
                  foregroundColor: Colors.black,
                  verticalPadding: 16,
                  minHeight: 48,
                  elevation: 5,
                  borderRadius: BorderRadius.zero,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
