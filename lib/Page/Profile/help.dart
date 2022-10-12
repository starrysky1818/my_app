import 'package:flutter/material.dart';
import 'package:my_app/Page/Profile/body.dart';
import 'package:my_app/Page/Profile/accountPage.dart';
import 'package:my_app/Page/Profile/profile_pic.dart';

class Help extends StatelessWidget {
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
                  MaterialPageRoute(
                      builder: (context) => MyAccount()),
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
            margin: const EdgeInsets.all(10),
            padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Text("How to set the sleep time and wake up time?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text("Settings -> Sleep Time Setting -> Select Sleep Time and Select Wake Up Time -> Confirm :)",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            margin: const EdgeInsets.all(10),
            padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Text("How to get your sleep report?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text("Just click Summary :)",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            margin: const EdgeInsets.all(10),
            padding: new EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 20),
                Text("How to get some rewards from your sleep?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text("After you set the sleep time and wake up time, "
                    "you will get 20 dollars rewards, you can go to home button and"
                    "click the planet, then you can buy some decorations to make your plant more beautiful :)",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15.0),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(10, 39, 59, 1),
    );
  }
}