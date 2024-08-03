import 'package:flutter/material.dart';
import 'dart:math';
import 'package:daily_phrases/constants/constants.dart';

class AppJokenPo extends StatefulWidget{
  @override
  _AppJokenPo createState() => _AppJokenPo();
}

class _AppJokenPo extends State<AppJokenPo>{
  final List<String> _options = ["images/pedra.png", "images/papel.png", "images/tesoura.png"];
  final Random _random = Random();
  String _image = "images/padrao.png";
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _home()
    );
  }
  ///_home retorna o widget principal da tela
  Widget _home(){
    return
      Scaffold(
        appBar: AppBar(
          title: const Text(JOKEN_PO_TITLE, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Padding(
                  padding: EdgeInsets.all(14),
                      child: Text("Escolha do App", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                  ),
                  Padding(padding: const EdgeInsets.all(14),
                  child: Image.asset(_image),),
                  const Padding(padding: EdgeInsets.all(14),
                    child: Text("Escolha uma das opções abaixo:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                  Padding(padding: EdgeInsets.all(14),
                    child: Text(_result, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children:<Widget>[
                        GestureDetector(onTap: (){_choiceOponentHandleGesture("pedra");},
                        child: Image.asset("images/pedra.png", height: 95),),
                        GestureDetector(onTap: (){_choiceOponentHandleGesture("papel");},
                          child: Image.asset("images/papel.png", height: 95),),
                        GestureDetector(onTap: (){_choiceOponentHandleGesture("tesoura");},
                          child: Image.asset("images/tesoura.png", height: 95),),
                      ]
                  )
                ],
              ),
            )
            ),
          ),
        );
  }

  void _choiceOponentHandleGesture(String option){
      int index = _random.nextInt(_options.length);
      setState(() {
        _image = _options[index];
        String _appChoice = _image.split(".")[0].split("/")[1];
        switch(option){
          case "pedra":
            if(_appChoice == "papel"){
              _result = "Vc perdeu!";
            }else if(_appChoice == "pedra"){
              _result = "Empate!";
            }else{
              _result = "Vc venceu!";
            }
            break;
          case "papel":
            if(_appChoice == "papel"){
              _result = "Empate!";
            }else if(_appChoice == "tesoura"){
              _result = "Vc perdeu!";
            }else{
              _result = "Vc venceu!";
            }
            break;
          case "tesoura":
            if(_appChoice == "papel"){
              _result = "Vc venceu!";
            }else if(_appChoice == "pedra"){
              _result = "Vc perdeu!";
            }else{
              _result = "Empate!";
            }
            break;
        }
      });
  }
}