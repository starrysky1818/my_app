import 'package:flutter/material.dart';
import 'package:my_app/Page/setting.dart';

class MyNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MySetting()),
                );
              },
              child: new Container(
                width: screenWidth,
                padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                color: Color.fromRGBO(10,39,59,1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                        Icons.chevron_left,
                        color: Colors.white
                    ),
                  ],
                ),
              )
          ),
          Container(
            width: screenWidth,
            height: screenWidth * 0.42,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage('images/notifications.png'),
              ),
            ),
          ),
          Container(
              width: screenWidth,
              height: screenWidth * 0.25,
              margin: const EdgeInsets.all(10),
              padding: new EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(20,47,67,1),
                  border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child: SwitchScreen(
              )
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  @override
  SwitchClass createState() => new SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue = 'Send Sleep Notification';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue = 'Send Sleep Notification';
      });
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue = 'Send Sleep Notification';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // return Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[ Text('$textValue', style: TextStyle(color: Colors.white,fontSize: 20),),
          Transform.scale(
              scale: 2,
              child: Switch(
                onChanged: toggleSwitch,
                value: isSwitched,
                activeColor: Colors.white,
                activeTrackColor: Colors.blue,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
              )
          ),
        ]);
  }
}