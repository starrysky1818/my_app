import 'package:flutter/material.dart';
import 'package:my_app/Page/Profile/profile_pic.dart';

import '../setting.dart';
import 'accountPage.dart';

class SettingProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
        body: Column(
          children: <Widget>[
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
                child: Container(
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 10.0),
                  color: const Color.fromRGBO(10,39,59,1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Icon(
                          Icons.chevron_left,
                          color: Colors.white
                      ),
                      SizedBox(width:10),
                      Text(
                        "Settings",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ],
                  ),
                )
            ),
            const Divider(
              color: Colors.white12,
              indent: 30,
              endIndent: 30,
            ),

            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
                child: Container(
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  margin: const EdgeInsets.fromLTRB(20,0,20,0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20,47,67,1),
                      border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Account Security",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                          Icons.chevron_right,
                          color: Colors.white
                      ),
                    ],
                  ),
                )
            ),

            const SizedBox(
              height:10,
            ),

            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
                child: Container(
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  margin: const EdgeInsets.fromLTRB(20,0,20,0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20,47,67,1),
                      border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Message Notifications",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                          Icons.chevron_right,
                          color: Colors.white
                      ),
                    ],
                  ),
                )
            ),

            const SizedBox(
              height:15,
            ),

            Container(
              width: screenWidth,
              padding: const EdgeInsets.fromLTRB(20.0, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                Text(
                "Privacy",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12.0,
                ),
                ),
                ],
              ),
            ),
            const SizedBox(
              height:10,
            ),

            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
                child: Container(
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  margin: const EdgeInsets.fromLTRB(20,0,20,0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20,47,67,1),
                      border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Friends' Permissions",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                          Icons.chevron_right,
                          color: Colors.white
                      ),
                    ],
                  ),
                )
            ),
            const SizedBox(
              height:10,
            ),
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
                child: Container(
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  margin: const EdgeInsets.fromLTRB(20,0,20,0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20,47,67,1),
                      border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "My Information & Authorizations",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                          Icons.chevron_right,
                          color: Colors.white
                      ),
                    ],
                  ),
                )
            ),

            const SizedBox(
              height:10,
            ),
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                },
                child: Container(
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  margin: const EdgeInsets.fromLTRB(20,0,20,0),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(20,47,67,1),
                      border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                      borderRadius: BorderRadius.all(Radius.circular(100))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Information Shared with Third Parties",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                        ),
                      ),
                      Icon(
                          Icons.chevron_right,
                          color: Colors.white
                      ),
                    ],
                  ),
                )
            ),

          ],
        ),
        backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }
}