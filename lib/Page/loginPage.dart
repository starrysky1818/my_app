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
  String username = "a";
  String password = "1234";
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
      //设置globalKey，用于后面获取FormState
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
              // 校验用户名
              //validator: (v) {
                //return v!.trim().length > 3 ? null : "User name cannot less than 3";
              //},
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
                  child: RaisedButton(
                    padding: EdgeInsets.all(15.0),
                    child: Text("登录"),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () async {
                      if(_validateAndSaveForm()){
                        formKey.currentState!.save();
                        response = await dio.get('/test', queryParameters: {'password': username,
                          'userName': password});
                        print(response.data.toString());
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

