import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            image: AssetImage('images/home.png'),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          fixedColor: Colors.blueGrey,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home, color: Colors.grey,),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search, color: Colors.white),
            ),
            BottomNavigationBarItem(
              label: "Notice",
              icon: Icon(Icons.notifications, color: Colors.white),
            ),
            BottomNavigationBarItem(
              label: "Friends",
              icon: Icon(Icons.person, color: Colors.white),
            ),
          ],
          onTap: (int indexOfItem) {}),
    );
  }
}


