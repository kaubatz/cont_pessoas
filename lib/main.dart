import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Contador de Pessoas",
    home: Home()
  )
  );
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _people = 0;
  String _msg = "Pode entrar";

  void _changePeople(int number){
    setState(() {
      if(_people == 0 && number < 0){
        _msg = "Não há pessoas";
      }
      else if (_people == 10 && number > 0){
        _msg = "Lotado";
      }
      else {
        _msg = "Pode Entrar!!!";
        _people += number;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //return Container();
    return Stack(
      children: <Widget>[
        Image.asset("images/restaurant.jpg", fit: BoxFit.cover, height: 1000,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Pessoas: $_people", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      onPressed: () {
                        _changePeople(1);
                      },
                      child: Text("+1", style: TextStyle(color: Colors.white, fontSize: 40),)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: FlatButton(
                      onPressed: () {
                        _changePeople(-1);
                      },
                      child: Text("-1", style: TextStyle(color: Colors.white, fontSize: 40),)
                  ),
                ),
              ],
            ),
            Text(_msg,style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic, fontSize: 30),)
          ],
        ),
      ],
    );
  }
}
