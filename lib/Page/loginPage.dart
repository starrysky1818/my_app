import 'package:flutter/material.dart';
import 'package:my_app/Bottom.dart';
import 'package:dio/dio.dart';

class LoginHomePage extends StatefulWidget {
  @override
  _LoginHomePageState createState() => new _LoginHomePageState();
}

class _LoginHomePageState extends State<LoginHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column (
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 120.0,
                alignment:Alignment.centerLeft,
                padding: EdgeInsets.only(left:30.0),
                color: Colors.white,
                child: Icon(Icons.access_alarm),
              ),
              Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: EdgeInsets.only(left:30.0,right: 30.0),
                child: new Container(
                  child: buildForm(),
                ),
              ),
            ],
          ),
        ],
      )

    );
  }

  TextEditingController unameController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  GlobalKey < FormState > formKey = GlobalKey();
  String username = "";
  String password = "";
  late Response response;
  Dio dio = Dio();

  bool _validateAndSaveForm() {
    final form = formKey.currentState!;
    if (form.validate()) {
      return true;
    }
    return false;
  }

  Widget buildForm() {
    return Form(

      key: formKey,

      child: Column(
        children: <Widget>[
          TextFormField(
              autofocus: false,
              controller: unameController,
              decoration: InputDecoration(
                  labelText: "User Name",
                  hintText: "e-mail address",
                  icon: Icon(Icons.person)),

            validator: (val)=> (val == null || val.trim().length < 3) ? "User name cannot less than 3": null,
            onSaved: (val)=> this.username = val!,
          ),
          TextFormField(
              autofocus: false,
              controller: pwdController,
              decoration: InputDecoration(
                  labelText: "Password", hintText: "Your Password", icon: Icon(Icons.lock)),
              obscureText: true,
              //校验密码
            validator: (val)=> (val == null || val.trim().length < 5) ? "password cannot less than 5": null,
            onSaved: (val)=> this.password = val!,
          ),


          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    child: Text("Log in"),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
                      padding: MaterialStateProperty.all(const EdgeInsets.all(15.0))
                    ),
                    onPressed: () async {
                      if(_validateAndSaveForm()){
                        formKey.currentState!.save();
                        response = await dio.get('http://172.20.10.2:8080/user/logInCheck', queryParameters: {'password': password,
                          'userName': username});
                        if(response.data){
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Welcome to sleep planet'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => {
                                    Navigator.pop(context, 'OK'),
                                    Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
                                    ),
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Failed to login'),
                                  content: const Text('Please check your account and password'),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () => Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                            ],
                          ),
                      );
                        }
                      }
                      },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }



}

