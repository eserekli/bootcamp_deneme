import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_bootcamp/main.dart';
import 'package:flutter/material.dart';

import 'UI/tema.dart';

class VetPage extends StatefulWidget {
  const VetPage({Key? key});

  @override
  State<VetPage> createState() => _VetPageState();
}

class _VetPageState extends State<VetPage> {
  var collection = FirebaseFirestore.instance.collection("Vet");
  late List<Map<String, dynamic>> items = [];
  bool isLoaded = false;

  void _incrementCounter() async {
    List<Map<String, dynamic>> tempList = [];
    var data = await collection.get();
    data.docs.forEach((element) {
      tempList.add(element.data());
    });

    setState(() {
      items = tempList;
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _incrementCounter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Vet Sayfası"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyApp();
              }));
            },
          ),
          // Diğer AppBar özellikleri
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
                  hintText: "Aramak İstediğiniz Kelimeyi Girin!",
                  suffixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(20)),
                            leading: const CircleAvatar(
                              backgroundColor:  Color(0xff6ae792),
                            ),
                            title: Row(
                              children: [
                                Text(items[index]["name"]?? "Veri YOK"),
                                SizedBox(width:10,),
                                Text(items[index]["İŞ"]?? "Veri YOK"),

                              ],
                            ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        // Diğer Scaffold içeriği
      ),
    );
  }
}
