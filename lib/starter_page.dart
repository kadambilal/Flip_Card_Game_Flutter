import 'package:flutter/material.dart';
import 'package:mobil_vize/settings_page.dart';
import 'home_page.dart';

class StarterPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<StarterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text(
          "Başlangıç",
          textAlign: TextAlign.center,
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.settings),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: new EdgeInsets.symmetric(horizontal: 100.0, vertical: 25.0),
            child: Text(
              "Nasıl Oynanır ?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            margin: new EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Text(
              "Hafıza oyunu toplam 20 karttan oluşur. Bu 20 kartın başlangıçta görünmeyen yüzlerinde her sayıdan 2 tane olmak üzere 10 farklı sayı yazmaktadır.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            margin: new EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Text(
              "Oyunu kazanmak için oyuncuların aynı sayıların bulunduğu kartları sırasıyla açması gerekmektedir.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            margin: new EdgeInsets.symmetric(
              horizontal: 10.0,
            ),
            child: Text(
              "Oyunu oynamak için lütfen başla butonuna tıklayınız.. (Hatırlatmak isteriz ki butona tıkladığınız andan itibaren süreniz başlayacaktır. İyi Eğlenceler..)",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Container(
            child: RaisedButton(
              color: Colors.blue[300],
              highlightColor: Colors.red,
              elevation: 10,
              child: Text(
                "Başla",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              ),
            ),
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}
