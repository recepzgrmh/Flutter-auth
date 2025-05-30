import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/main.dart';
import 'package:flutter_auth/screens/auth/sign_up.dart';
import 'package:flutter_auth/widgets/custom_button.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  // Mevcut kullanıcıya doğrulama emaili gönderir
  Future<void> verifyAccount(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          content: const Text(
            "Email Gönderildi\nLütfen e-posta kutunuzu kontrol edin.",
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          content: const Text(
            "Hata\nKullanıcı bulunamadı veya email zaten doğrulanmış.",
          ),
          duration: const Duration(seconds: 4),
        ),
      );
    }
  }

  // Kullanıcının e-posta doğrulama durumunu kontrol eder
  Future<void> checkVerification(BuildContext context) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // Kullanıcı verilerini güncelleyin
      await user.reload();

      if (user.emailVerified) {
        // Firestore’da user dokümanı yoksa oluştur
        final docRef = FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid);
        final docSnapshot = await docRef.get();
        if (!docSnapshot.exists) {
          await docRef.set({
            "displayName": user.displayName,
            "email": user.email,
            "verifiedAt": DateTime.now(),
          });
        }

        // Tüm eski rotaları temizle ve HomeScreen'e git
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => MyApp()),
          (Route<dynamic> route) => false,
        );
      } else {
        // Aşağıda bir SnackBar göster
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            duration: const Duration(seconds: 4),
            content: const Text(
              "Hesap Doğrulanmadı\n"
              "Lütfen e-posta kutunuzu kontrol edin ve doğrulama linkine tıklayın.",
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar: Geri tuşu Get.offAll ile çalışıyor
      appBar: AppBar(
        leading: IconButton(
          onPressed:
              () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => const SignUp())),
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
                  color: Colors.blue,
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
                  onPressed:
                      () => checkVerification(
                        context,
                      ), // Fonksiyonu gerçekten çağırıyoruz
                  backgroundColor: Colors.blue.shade600,
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
                  onPressed:
                      () => verifyAccount(
                        context,
                      ), // E-posta doğrulama linki yeniden gönderiliyor
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
