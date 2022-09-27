import 'package:flutter/material.dart';
import 'package:my_app/Page/setting.dart';

class MyBrightness extends StatelessWidget {
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
                image: AssetImage('images/brightness.png'),
              ),
            ),
          ),
          Container(
              width: screenWidth,
              height: screenWidth * 0.25,
              margin: const EdgeInsets.all(10),
              padding: new EdgeInsets.fromLTRB(20, 5.0, 20.0, 5.0),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(20,47,67,1),
                  border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                  borderRadius: BorderRadius.all(Radius.circular(100))
              ),
              child: SwitchScreen()
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
  var textValue1 = 'Notification';
  var textValue2 = 'Phone screen will dim down \n30mins before sleep.';

  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
        textValue1 = 'Notification';
        textValue2 = 'Phone screen will dim down \n30mins before sleep.';
      });
    }
    else
    {
      setState(() {
        isSwitched = false;
        textValue1 = 'Notification';
        textValue2 = 'Phone screen will dim down \n30mins before sleep.';
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // return Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    return Column(
        children:[
          Text('$textValue1',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)
          ),
          Row(
            children: [
              SizedBox(width: 10),
              Text('$textValue2', style: TextStyle(color: Colors.white,fontSize: 15,height: 2)),
              SizedBox(width: 80),
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
              ),],
          ),

        ]);
  }
}