import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:my_app/Page/reward/sleep_planet_home.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/Page/timeSettingwithPicker.dart';


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
            fit: BoxFit.cover,
          ),
        ),
        child: Column (
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SleepPlanteHomePage()),
                );
              },
              child: Container (
                height:screenHeight*0.5,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/plant.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                child: const Text('Enter your planet',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black54,
                      fontFamily: 'Inter-Bold'
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(screenWidth*0.25,10.0,screenWidth*0.25,10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Container(
                      width: screenWidth*0.5,
                      child: ElevatedButton(
                        child: Text("Start Sleep",style: TextStyle(fontSize: 24)),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                          ),
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(Colors.blue),
                          padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
                        ),
                        onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyTimeSetting()),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )

            ),
            ]
        )
      )
    );
  }
}


