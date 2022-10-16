import 'package:flutter/material.dart';
import 'package:my_app/Page/user.dart';
import '../notifications_manager.dart';
import 'friendPage.dart';
import 'package:my_app/Page/user.dart';
import 'package:my_app/Bottom.dart';

class searchFriends extends StatefulWidget {
  @override
  _searchFriends createState() => new _searchFriends();
}

class _searchFriends extends State<searchFriends> {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column (
          children: <Widget>[
            GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BottomNavigationWidget(index: 2)),
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
                        "Add friends",
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
            Container(
              width: screenWidth,
              margin: const EdgeInsets.fromLTRB(20,20,20,10),
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 5.0),
              decoration: const BoxDecoration(
                  color: Color.fromRGBO(20,47,67,1),
                  borderRadius: BorderRadius.all(Radius.circular(50))
              ),
              alignment: Alignment.center,
              child: new Container(
                child: buildForm(),
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromRGBO(10,39,59,1),
    );
  }

  List<User> users = [
    User(name: "Hari Prasad Chaudhary", accNumber: 12345, password: "ss123"),
    User(name:"Hua Li", accNumber: 25372, password: "ss123"),
    User(name:"HaHa123 :)", accNumber: 16463, password: "ss123"),
    User(name:"David Mars", accNumber: 23456, password: "ss123"),
    User(name:"Aurn Thapa", accNumber: 34567, password: "ss123"),
    User(name: "John Bal", accNumber: 45678, password: "ss123")
  ];
  List<User> items = <User>[];

  void filterSearchResults(String query) {
    if(query.isNotEmpty) {
      List<User> dummyListData = <User>[];
      for (var item in users) {
        if(item.name.contains(query.toLowerCase())
            || item.name.contains(query.toUpperCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
      });
    }
  }

  TextEditingController uAccController = new TextEditingController();
  GlobalKey formKey = new GlobalKey<FormState>();
  late String userAccount;

  Widget buildForm() {
    return Form(
      //set globalKey for getting FormState
      key: formKey,

      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: uAccController,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(12),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                borderSide: BorderSide(
                    color: Color.fromRGBO(39,69,92,1)
                )
              ),
              labelText: "Search Username",
              labelStyle: TextStyle(
                color: Colors.white70,
                fontSize: 20,
              ),
              hintText: "Alan",
              hintStyle: TextStyle(color: Colors.white24),
              icon: Icon(
                Icons.search,
                color: Colors.white70,
              ),
            ),
            onChanged: (value) {
              value = value.toString();
              filterSearchResults(value);
            },
          ),

          //searched results
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        items[index].name,
                      style: const TextStyle(color: Colors.lightBlue),
                    ),
                    subtitle: Text(
                        '${items[index].accNumber}',
                      style: const TextStyle(color: Colors.lightBlueAccent),
                    ),
                    trailing: Wrap(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.add),
                          color: Colors.white,
                          onPressed: () {
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Are you sure you want to send a friend request?'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () => {
                                      Navigator.pop(context, 'YES'),
                                    },
                                    child: const Text('YES'),
                                  ),
                                  TextButton(
                                    onPressed: () => {
                                      Navigator.pop(context, 'NO'),
                                    },
                                    child: const Text('NO'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    color: Colors.white12,
                    indent: 10,
                    endIndent: 10,
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

