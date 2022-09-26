import 'package:flutter/material.dart';
import 'body.dart';

class MyAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(10),
          padding: new EdgeInsets.fromLTRB(20, 40.0, 20.0, 40.0),
          child:
            Body(),
      ),
      backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}