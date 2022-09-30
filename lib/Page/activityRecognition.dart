import 'package:flutter/material.dart';
import 'package:my_app/Page/setting.dart';
import 'package:get_storage/get_storage.dart';

class ActivityRecognition extends StatelessWidget {
  const ActivityRecognition({super.key});

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
                  MaterialPageRoute(builder: (context) => MySetting()),
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
                image: AssetImage('images/notifications.png'),
              ),
            ),
          ),
          Container(
              width: screenWidth,
              height: screenWidth * 0.2,
              margin: const EdgeInsets.all(10),
              padding: EdgeInsets.fromLTRB(20, 10.0, 20.0, 10.0),
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
  var textValue = 'detection of activity';
  final switchData = GetStorage();

  @override
  void initState() {
    super.initState();

    if (switchData.read('doa') != null) {
      setState(() {
        isSwitched = switchData.read('doa');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        textValue,
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      Transform.scale(
          scale: 2,
          child: Switch(
            onChanged: (value) {
              setState(() {
                isSwitched = value;
                switchData.write('doa', isSwitched);
              });
            },
            value: isSwitched,
            activeColor: Colors.white,
            activeTrackColor: Colors.blue,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.grey,
          )),
    ]);
  }
}
