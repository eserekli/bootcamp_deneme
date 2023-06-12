import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_bootcamp/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _signInWithEmailAndPassword() async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      String uid = userCredential.user!.uid;

      // Firestore'da users koleksiyonundan kullanıcıyı sorgula
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();
      // Firestore'da vet koleksiyonundan kullanıcıyı sorgula
      DocumentSnapshot vetSnapshot = await FirebaseFirestore.instance.collection('Vet').doc(uid).get();

      if (userSnapshot.exists && userSnapshot.get('isUser') == 'true') {
        print('Giriş yapıldı, User için izin verildi.');
        Navigator.pushReplacementNamed(context, '/userpage'); // User PROFİL SAYFASINA VERİLİCEK BURAYADA!!
      } else if (vetSnapshot.exists && vetSnapshot.get('isVet') == 'true') {
        print('Giriş yapıldı, Vet için izin verildi.');
       Navigator.push(context, MaterialPageRoute(builder: ((context) {
                return HomePage();// VETERİNER PROFİL SAYFASI VERİLİCEK BURAYA YOL OLARAK!!
              }))); // Vet sayfasına yönlendir
      } else {
        print('Giriş reddedildi, izin verilmedi.');
        // İzin verilmediyse uygun işlemi yapabilirsiniz (örneğin hata mesajı göstermek)
      }
    } catch (e) {
      print('Hata: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Giriş Ekranı'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-posta',
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Şifre',
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _signInWithEmailAndPassword,
              child: Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
