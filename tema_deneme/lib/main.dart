import 'package:flutter/material.dart';
import 'package:your_theme_file.dart'; // Uygulama teması dosyasını ekleyin

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: theme(), // Uygulama temasını kullanın
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ana Sayfa'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Başlık Yazısı',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button 1'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button 2'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Button 3'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.person),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
