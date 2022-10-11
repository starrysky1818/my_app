import 'package:flutter/material.dart';
import 'package:my_app/Page/reward/sleep_planet_home.dart';
import 'package:get_storage/get_storage.dart';


class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/home.png'),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SleepPlanteHomePage()),
            );
            },
          child: Image.asset('images/plant.png',
            width: screenWidth,
          ),
        ),
      )
    );
  }
}


