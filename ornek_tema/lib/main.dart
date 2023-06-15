import 'package:flutter/material.dart';
import 'package:ornek_tema/tema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: TemaPage.tema,
        home: Scaffold(
          appBar: AppBar(
            title: Text('My App'),
          ),
          body: Center(
            child: Text(
              'Merhaba, dünya!',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          
        ));
  }
}
