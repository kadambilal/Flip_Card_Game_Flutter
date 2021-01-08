import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayarlar", textAlign: TextAlign.center),
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        children: [
          Container(
            padding: new EdgeInsets.only(left: 80, top: 100),
            child: Text(
              "Geliştirici : Bilal Kadam",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Container(
            padding: new EdgeInsets.only(left: 90, top: 15),
            child: Text(
              "Versiyon: 1.0.0",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
