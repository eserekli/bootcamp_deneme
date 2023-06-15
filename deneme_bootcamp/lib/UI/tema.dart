import 'package:flutter/material.dart';

class TemaPage {
  static ThemeData tema = ThemeData(
    primaryColor: Colors.red, // Uygulamanın başlık çubuğu, düğmeler ve sekmelerin rengi olarak kullanılır.
    accentColor: Colors.green, // İkincil bir vurgu rengi olarak kullanılır, örneğin kaydırma çubuğu veya seçili öğelerde kullanılabilir.
    brightness: Brightness.dark, // Uygulama arka planının ve genel olarak ne kadar parlak olduğunu belirtir.
    scaffoldBackgroundColor: Colors.white, // Scaffold'ın arka plan rengidir.
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.red,
    ),
    fontFamily: 'Poppins', // Yazı tiplerini belirler, örneğin başlık, düğme veya metin stillerinde kullanılır.
    appBarTheme: AppBarTheme(
      color: Colors.red, // Başlık çubuğunun rengi
      elevation: 4, // Başlık çubuğunun z-eğimi, gölge efekti sağlar.
      iconTheme: IconThemeData(color: Colors.white), // Başlık çubuğundaki simgelerin rengi
      textTheme: TextTheme(
        headline6: TextStyle(
          fontSize: 20, // Başlık çubuğundaki metnin font boyutu
          fontWeight: FontWeight.bold, // Başlık çubuğundaki metnin kalınlığı
          color: Colors.white, // Başlık çubuğundaki metnin rengi
        ),
      ),
    ),
  );
}
