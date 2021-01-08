import 'dart:async';

import 'package:flip_card/flip_card.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

/* String rand() {
  var rand = new Random();
  while (true) {
    var rand_index = rand.nextInt(26);
    if (rand_index != 0 && !buttonText.contains(rand_index)) {
      buttonText.add(rand_index);
      String x = rand_index.toString();
      return x;
    }
  }
}
*/

class _HomePageState extends State<HomePage> {
  List<bool> kartFlip = [
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];

  List<String> sayi = [
    "1",
    "1",
    "2",
    "2",
    "3",
    "3",
    "4",
    "4",
    "5",
    "5",
    "6",
    "6",
    "7",
    "7",
    "8",
    "8",
    "9",
    "9",
    "20",
    "20"
  ];
  int previousIndex = -1;
  bool flip = false;
  //  GlobalKey, kartları değiştirmek için a tuşunu kullanarak kartı yalnızca
  // istendiğinde dönecek şekilde yapılandırabilirsiniz

  List<GlobalKey<FlipCardState>> cardStateKey =
      List.generate(20, (index) => GlobalKey<FlipCardState>());

  int time = 0;
  Timer timer;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        time = time + 1;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer(); // bu ekran acılır acılmaz sure baslayacak.
    sayi.shuffle(); // sayi listesinin içindeki verileri karıstırır.
  }

  showResult() {
    // sonucu ekrana bastırmak için
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text("kazandınız"),
        backgroundColor: Colors.blue[100],
        content: Text("skorunuz : $time"),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Text("Tekrar Oyna"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hafıza Oyunu"),
        backgroundColor: Colors.blue[300],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(6.0),
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
              itemCount: sayi.length,
              itemBuilder: (context, index) => FlipCard(
                key: cardStateKey[index],
                onFlip: () {
                  if (!flip) {
                    flip = true;
                    previousIndex = index;
                  } else {
                    flip = false;
                    if (previousIndex != index) {
                      if (sayi[previousIndex] != sayi[index]) {
                        cardStateKey[previousIndex].currentState.toggleCard();
                        previousIndex = index;
                      } else {
                        kartFlip[previousIndex] = false;
                        kartFlip[index] = false;
                        print(kartFlip);

                        if (kartFlip.every((t) => t == false)) {
                          showResult(); // kazanıldığında ekrana kazandınız mesajının basılması için
                          timer.cancel(); // kazanma durumunda süre durduruldu.
                        }
                      }
                    }
                  }
                },
                direction: FlipDirection
                    .HORIZONTAL, // kartalrın dokunuldugunda donmesı saglanacak
                flipOnTouch: true,
                front: Container(
                  width: 50.0,
                  height: 50.0,
                  margin: EdgeInsets.all(4.0),
                  color: Colors.lightBlueAccent,

                  //  child: RaisedButton
                  // (onPressed: startTimer()),
                ),
                back: Container(
                  width: 70.0,
                  height: 70.0,
                  margin: EdgeInsets.all(4.0),
                  color: Colors.white,
                  child: Center(
                    child: Text("${sayi[index]}"),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: new Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Süre : $time",
                    style: TextStyle(
                        color: Colors.black54,
                        fontStyle: FontStyle.italic,
                        fontSize: 35),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
