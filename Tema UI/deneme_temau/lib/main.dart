import 'package:flutter/material.dart';
import 'package:deneme_temau/tema.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: theme(), // Uygulama temasını kullanın
      home: LoginPage(), // Kullanıcı giriş sayfasını ana sayfa olarak belirleyin
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Girişi'), // Sayfa başlığı
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Kullanıcı Adı',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Şifre',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                child: Text('Giriş Yap'), // Düğme metni
              ),
              SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: Text('Üye Ol'), // Üye ol butonu metni
              ),
            ],
          ),
        ),
      ),
    );
  }
}
