import 'package:flutter/material.dart';
import 'package:my_app/Bottom.dart';
import 'package:get_storage/get_storage.dart';

class MyBrightness extends StatelessWidget {
  const MyBrightness({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BottomNavigationWidget(index: 1)),
                );
              },
              child: Container(
                width: screenWidth,
                padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                color: const Color.fromRGBO(10, 39, 59, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Icon(Icons.chevron_left, color: Colors.white),
                  ],
                ),
              )),
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
              padding: const EdgeInsets.fromLTRB(20, 5.0, 20.0, 5.0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(20, 47, 67, 1),
                  border:
                      Border.all(color: const Color.fromRGBO(39, 69, 92, 1)),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
              child: const SwitchScreen()),
        ],
      ),
      backgroundColor: const Color.fromRGBO(10, 39, 59, 1),
    );
  }
}

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  SwitchClass createState() => SwitchClass();
}

class SwitchClass extends State {
  bool isSwitched = false;
  var textValue1 = 'Brightness Adjustment';

  final switchData = GetStorage();

  var textValue = 'Send Sleep Notification';

  late var textValue2 = "Phone screen brightness will\nremain the same before sleep.";

  @override
  void initState() {
    super.initState();

    if (switchData.read('brightness') != null) {
      setState(() {
        isSwitched = switchData.read('brightness');
        textValue2 = switchData.read("screenText");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // return Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    return Column(children: [
      Text(textValue1,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      Row(
        children: [
          const SizedBox(width: 10),
          Text(textValue2,
              style: const TextStyle(
                  color: Colors.white, fontSize: 15, height: 2)),
          const SizedBox(width: 70),
          Transform.scale(
              scale: 2,
              child: Switch(
                onChanged: (value) {
                  setState(() {
                    isSwitched = value;
                    switchData.write('brightness', isSwitched);
                    if (isSwitched) {
                      textValue2 =
                          'Phone screen will dim down\n30mins before sleep.';
                    } else {
                      textValue2 =
                          'Phone screen brightness will\nremain the same before sleep.';
                    }
                  });
                },
                value: isSwitched,
                activeColor: Colors.white,
                activeTrackColor: Colors.blue,
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
              )),
        ],
      ),
    ]);
  }
}
