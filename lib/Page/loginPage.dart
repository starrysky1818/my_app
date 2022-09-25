import 'package:flutter/material.dart';
import 'package:my_app/Bottom.dart';

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
  GlobalKey formKey = new GlobalKey<FormState>();
  late String username;
  late String password;


  Widget buildForm() {
    return Form(
      //设置globalKey，用于后面获取FormState
      key: formKey,

      child: Column(
        children: <Widget>[
          TextFormField(
              autofocus: false,
              keyboardType: TextInputType.number,
              //键盘回车键的样式
              textInputAction: TextInputAction.next,
              controller: unameController,
              decoration: InputDecoration(
                  labelText: "User Name",
                  hintText: "e-mail address",
                  icon: Icon(Icons.person)),
              // 校验用户名
              validator: (v) {
                return v!.trim().length > 3 ? null : "User name cannot less than 3";
              },
              onSaved: (v) {
                username = v!;
              }),
          TextFormField(
              autofocus: false,
              controller: pwdController,
              decoration: InputDecoration(
                  labelText: "Password", hintText: "Your Password", icon: Icon(Icons.lock)),
              obscureText: true,
              //校验密码
              validator: (v) {
                return v!.trim().length > 5 ? null : "Password cannot less than 5";
              },
              onSaved: (v) {
                password = v!;
              }),


          Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text("登录"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () {
                      if ((formKey.currentState as FormState).validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BottomNavigationWidget()),
                        );
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

