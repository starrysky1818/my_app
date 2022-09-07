import 'package:flutter/material.dart';

class MySetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('images/setting1.png'),
              ),
            ),
          ),
        GestureDetector(
            onTap: (){
              print("Container clicked");
            },
            child: new Container(
              width: 500.0,
              padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
              color: Colors.blueGrey[900],
              child: new Row(
                  children: [
                    new Text("Sleep Time Setting"),
                  ],
              ),
            )
        )],
      ),
    );
  }
}