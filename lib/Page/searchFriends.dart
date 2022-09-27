// import 'package:flutter/material.dart';
// import 'package:my_app/Page/homePage.dart';
//
// class MyFriends extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery
//         .of(context)
//         .size
//         .width;
//     //double screenHeight = MediaQuery.of(context).size.height * 0.3;
//     int searchAccount = 0;
//     return Scaffold(
//       body: Column(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           SizedBox(height: 10),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0),
//             child: TextField(
//               onChanged: (value) {
//                 setState(() {
//                   searchAccount = value as int;
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 suffixIcon: Icon(Icons.search),
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           Expanded(
//             child: FutureBuilder(
//               builder: (context, AsyncSnapshot<List<Show>> snapshot) {
//                 if (snapshot.hasData) {
//                   return Center(
//                     child: ListView.separated(
//                       padding: const EdgeInsets.all(8),
//                       itemCount: snapshot.data!.length,
//                       itemBuilder: (BuildContext context, int index) {
//                         return snapshot.data![index].title
//                             .contains(searchAccount)
//                             ? ListTile(
//                           leading: CircleAvatar(
//                             backgroundImage: NetworkImage(
//                                 '${snapshot.data?[index].imageUrl}'),
//                           ),
//                           title: Text('${snapshot.data?[index].title}'),
//                           subtitle: Text(
//                               'Score: ${snapshot.data?[index].score}'),
//                         )
//                             : Container();
//                       },
//                       separatorBuilder: (BuildContext context, int index) {
//                         return snapshot.data![index].title
//                             .toLowerCase()
//                             .contains(searchAccount)
//                             ? Divider()
//                             : Container();
//                       },
//                     ),
//                   );
//                 } else if (snapshot.hasError) {
//                   return Center(child: Text('Something went wrong :('));
//                 }
//                 return CircularProgressIndicator();
//               },
//               future: shows,
//             ),
//           ),
//         ],
//       ),
//       backgroundColor: const Color.fromRGBO(10, 39, 59, 1),
//     );
//   }
// }
//
// class Show {
//   final int malId;
//   final String title;
//   final double score;
//
//   Show({
//     required this.malId,
//     required this.title,
//     required this.score,
//   });
//
//   factory Show.fromJson(Map<String, dynamic> json) {
//     return Show(
//       malId: json['mal_id'],
//       title: json['title'],
//       score: json['score'],
//     );
//   }
// }
//
// Future<List<Show>> fetchShows() async {
//   final response =
//   await http.get(Uri.parse('https://api.jikan.moe/v3/top/anime/1'));
//
//   if (response.statusCode == 200) {
//     var topShowsJson = jsonDecode(response.body)['top'] as List;
//     return topShowsJson.map((show) => Show.fromJson(show)).toList();
//   } else {
//     throw Exception('Failed to load shows');
//   }
// }

import 'package:flutter/material.dart';

import 'friendPage.dart';

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
                    MaterialPageRoute(builder: (context) => MyFriends()),
                  );
                },
                child: Container(
                  width: screenWidth,
                  padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
                  color: const Color.fromRGBO(10,39,59,1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
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
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(20,47,67,1),
                  border: Border.all(color: const Color.fromRGBO(39,69,92,1)),
                  borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
              alignment: Alignment.center,
              //padding: EdgeInsets.only(left:30.0,right: 30.0),
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
    User(name: "Hari Prasad Chaudhary", accNumber: 12345),
    User(name:"David Mars", accNumber: 23456),
    User(name:"Aurn Thapa", accNumber: 34567),
    User(name: "John Bal", accNumber: 45678)
  ];
  List<User> items = <User>[];

  void filterSearchResults(String query) {
    //List<String> dummySearchList = <String>[];
    //dummySearchList.addAll(users);
    if(query.isNotEmpty) {
      List<User> dummyListData = <User>[];
      for (var item in users) {
        if(item.name.contains(query)) {
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
        items.addAll(users);
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
            autofocus: false,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
            controller: uAccController,
            decoration: const InputDecoration(
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(5),
              //   borderSide: BorderSide(
              //     color: Colors.,
              //     width: 1.0,
              //   ),
              // ),
              labelText: "Search Username",
              labelStyle: TextStyle(
                color: Colors.white70,
              ),
              hintText: "Alan",
              hintStyle: TextStyle(color: Colors.white24),
              icon: Icon(
                Icons.search,
                color: Colors.white24,
              ),
            ),
            onChanged: (value) {
              filterSearchResults(value);
            },
          ),

          //
          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(items[index].name),
                    subtitle: Text('${items[index].accNumber}'),
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

