import 'package:flutter/material.dart';

class AppGasAlc extends StatefulWidget{
  @override
  _AppGasAlc createState() => _AppGasAlc();
}

class _AppGasAlc extends State<AppGasAlc>{
  late TextEditingController _controller;
  String _textDigited = "";

  @override
  void initState(){
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: _home()
    );
  }
  Widget _home(){
    return Scaffold(
        appBar: AppBar(
          title: Text("Gasolina ou alcóol?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
          backgroundColor: Colors.blue[900],
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(8, 16, 8, 8), child: Image.asset("images/gas.png"),),
                  const Padding(padding: EdgeInsets.fromLTRB(8, 16, 8, 8),
                    child: Text("Saiba qual a melhor opção para "
                        "abastecimento do seu carro",
                      //textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.bold, fontSize: 28),),),
                  Padding(padding: EdgeInsets.all(12),
                  child: TextField(
                    style: TextStyle(fontSize: 20),
                    cursorColor: Colors.blue[900],
                    controller: _controller,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.blue[900]!,width: 2.0
                        ),),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Colors.blue[900]!, // Cor da borda quando focado
                            width: 2.0, // Largura da borda
                          ),


                        ),


                        prefixIconColor: Colors.blue[900],
                        labelText: "Digite aqui",
                        labelStyle:TextStyle(color: Colors.blue[900]),
                        prefixIcon: Icon(Icons.search)
                    ),
                  ),),
                  TextButton(onPressed: (){
                    setState(() {
                      _textDigited = _controller.text.toString();
                    });
                  }, child: Text("Obter")),
                  Text(_textDigited)
                ],
            ),
          ),
        )
    );
  }

}