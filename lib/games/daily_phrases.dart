import 'package:flutter/material.dart';
import 'dart:math';


class AppDailyPhrases extends StatefulWidget{
  @override
  _App createState() => _App();
}

class _App extends State<AppDailyPhrases>{

  final List<String> _phrases = ["A", "B", "C", "D"];
  String _text = "";
  final Random _random = Random();


  @override
  Widget build(BuildContext context) {
    _changeText();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text(
                "Daily phrases", style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.blueAccent,
            ),
            body: Container(
              child:Padding(padding: EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Image.asset("images/logo.png"),
                        Text(_text, style: TextStyle(fontSize: 24),),
                        ElevatedButton(onPressed: () {
                          _changeText();
                        },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.
                                all<EdgeInsets>(
                                    const EdgeInsets.fromLTRB(36, 14, 36, 14)),
                                backgroundColor: const
                                MaterialStatePropertyAll<Color>(Colors.blueAccent),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                    const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        side: BorderSide(color: Colors.blueAccent)
                                    )
                                )),
                            child: const Text("Clique",
                              style: TextStyle(color: Colors.white, fontSize: 20),))
                      ],
                    ),
                  )
              ),
            )
        ));
  }

  void _changeText(){
    int randomNumber = _random.nextInt(_phrases.length);
    setState(() {
      _text = _phrases[randomNumber];
    });
  }
}