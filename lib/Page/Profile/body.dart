import 'package:flutter/material.dart';
import 'package:my_app/Page/Profile/help.dart';
import 'package:my_app/Page/Profile/information.dart';
import 'package:my_app/Page/Profile/profile_pic.dart';
import 'package:my_app/Page/Profile/settingProfile.dart';
import 'package:my_app/Page/loginPage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../reward/application.dart';
import '../reward/reward_manager.dart';
import '../setting.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [

        ProfilePic(),
        SizedBox(
          height:30,
        ),
        Container(
            width: screenWidth,
            margin: const EdgeInsets.all(4),
            padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                Icon(Icons.account_box_rounded,
                    size: 40.0,
                    color: Colors.white
                    ),
                SizedBox(width: 15),
                Text("Account information",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0),
                ),
                SizedBox(width: 75),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        // change !!!
                        MaterialPageRoute(builder: (context) => Info()),
                      );
                    },
                    child: Container(
                      //width: screenWidth,
                      color: Color.fromRGBO(20,47,67,1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                              Icons.chevron_right,
                              color: Colors.white
                          ),
                        ],
                      ),
                    )
                )
              ],
            )
        ),
        SizedBox(
          height:10,
        ),
        Container(
            width: screenWidth,
            margin: const EdgeInsets.all(4),
            padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                Icon(Icons.settings,
                    size: 40.0,
                    color: Colors.white
                ),
                SizedBox(width: 15),
                Text("Settings",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0),
                ),
                SizedBox(width: 175),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        // change !!!
                        MaterialPageRoute(builder: (context) => SettingProfile()),
                      );
                    },
                    child: Container(
                      //width: screenWidth,
                      color: Color.fromRGBO(20,47,67,1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                              Icons.chevron_right,
                              color: Colors.white
                          ),
                        ],
                      ),
                    )
                )
              ],
            )
        ),
        SizedBox(
          height:10,
        ),
        Container(
            width: screenWidth,
            margin: const EdgeInsets.all(4),
            padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                Icon(Icons.help_center,
                    size: 40.0,
                    color: Colors.white
                ),
                SizedBox(width: 15),
                Text("Help Centre",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0),
                ),
                SizedBox(width: 145),
                GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Help()),
                      );
                    },
                    child: Container(
                      //width: screenWidth,
                      color: Color.fromRGBO(20,47,67,1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                              Icons.chevron_right,
                              color: Colors.white
                          ),
                        ],
                      ),
                    )
                )
              ],
            )
        ),
        SizedBox(
          height:10,
        ),
        Container(
            width: screenWidth,
            margin: const EdgeInsets.all(4),
            padding: new EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
            decoration: BoxDecoration(
                color: Color.fromRGBO(20,47,67,1),
                border: Border.all(color: Color.fromRGBO(39,69,92,1)),
                borderRadius: BorderRadius.all(Radius.circular(100))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 5),
                Icon(Icons.logout,
                    size: 40.0,
                    color: Colors.white
                ),
                SizedBox(width: 15),
                Text("Log Out",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0),
                ),
                SizedBox(width: 175),
                GestureDetector(
                    onTap: () async {
                      WidgetsFlutterBinding.ensureInitialized();
                      await Application.initAppSetup();
                      await GetStorage.init();
                      RestartWidget.restartApp(context);
                    },
                    child: Container(
                      //width: screenWidth,
                      color: Color.fromRGBO(20,47,67,1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                              Icons.chevron_right,
                              color: Colors.white
                          ),
                        ],
                      ),
                    )
                )
              ],
            )
        ),
      ],
    );
  }
}

