
import 'dart:developer';

import 'package:flutter/material.dart';
import '../services/login_service.dart';
import '../models/login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert' show json, base64, ascii;
final storage = FlutterSecureStorage();

void displayDialog(BuildContext context, String title, String text) =>
    showDialog(
      context: context,
      builder: (context) =>
          AlertDialog(
              title: Text(title),
              content: Text(text)
          ),
    );

class Login extends StatefulWidget{
  @override
  LoginScreen createState()=>LoginScreen();
}



class LoginScreen extends State<Login> {
//  static const routeName = '/auth';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  TextEditingController username= TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController tenantId= TextEditingController();
  bool passwordVisible=true;

  @override
  Widget build(BuildContext context) {
    final userName = TextField(
      obscureText: false,
      controller: username,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Username",
          prefixIcon: Icon(Icons.supervised_user_circle),
          border:
          OutlineInputBorder()),
    );
    final passwordField = TextField(
      obscureText: passwordVisible,
      controller: password,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          prefixIcon: Icon(Icons.lock),
          suffixIcon: IconButton(
            icon: Icon(
// Based on passwordVisible state choose the icon
              passwordVisible
                  ? Icons.visibility_off
                : Icons.visibility  ,
              color: Theme.of(context).primaryColorDark,
            ),
            onPressed: () {
// Update the state i.e. toogle the state of passwordVisible variable
              setState(() {
                passwordVisible = !passwordVisible;
              });
            },
          ),
          border:
          OutlineInputBorder()),
    );
    final TenantField = TextField(
      obscureText: true,
      controller: tenantId,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Tenant ID",
          border:
          OutlineInputBorder()),
    );
    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(child: CircularProgressIndicator(),);
              });
        var jwt= await Service.login(username.text, password.text,tenantId.text);
        if(jwt != null){
          print("we are in login dart============================jwt$jwt");
          storage.write(key: "jwt", value: jwt);
          var encodedProfile=jwt.split('.')[1];
          var profile=json.decode(
              ascii.decode(
                  base64.decode(base64.normalize(jwt.split(".")[1]))
              ));
          print("encoded$encodedProfile");
          print("profile$profile");
          var role=profile["role"];

          if(role=="Manager" ){
            print("profile.role$role");
            Navigator.pop(context);
            Navigator.pushNamed(context, '/mdash');
          }
        }
        else {
          displayDialog(context, "An Error Occurred", "No account was found matching that username and password");
        }



        },//  Navigator.pushNamed(context, '/mdash');
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 15.0),
                userName,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 25.0,
                ),
                TenantField,
                SizedBox(
                  height: 25.0,
                ),
                loginButton,
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//class LoginScreen extends StatelessWidget {
//  static const routeName = '/auth';
//
//  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
//
//  Future<String> _loginUser(data) {
//    Service.login(data.username, data.password).then((value) => mockUsers);
//    debugger();
//      return Future.delayed(loginTime).then((_) {
//      if (!mockUsers.containsKey(data.name)) {
//        return 'Username not exists';
//      }
//      if (mockUsers[data.name] != data.password) {
//        return 'Password does not match';
//      }
//      return null;
//    });
//  }
//
//  Future<String> _recoverPassword(String name) {
//    return Future.delayed(loginTime).then((_) {
//      if (!mockUsers.containsKey(name)) {
//        return 'Username not exists';
//      }
//      return null;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final inputBorder = BorderRadius.vertical(
//      bottom: Radius.circular(10.0),
//      top: Radius.circular(20.0),
//    );
//
//    return FlutterLogin(
//      title: Constants.appName,
//      logo: 'assets/images/troowork_logo.png',
//      logoTag: Constants.logoTag,
//      titleTag: Constants.titleTag,
//
//      emailValidator: (value) {
//        if (value.isEmpty) {
//          return "UserName is empty";
//        }
//        return null;
//      },
//      passwordValidator: (value) {
//        if (value.isEmpty) {
//          return 'Password is empty';
//        }
//        return null;
//      },
//      onLogin: (loginData) {
//        print('Login info');
//        print('Name: ${loginData.name}');
//        print('Password: ${loginData.password}');
//
//        return  Service.login(loginData.name,loginData.password);
//      },
//      onSignup: (loginData) {
//        print('Signup info');
//        print('Name: ${loginData.name}');
//        print('Password: ${loginData.password}');
//        return _loginUser(loginData);
//      },
//      onSubmitAnimationCompleted: () {
//        Navigator.of(context).pushReplacement(FadePageRoute(
//          //builder: (context) => DashboardScreen(),
//        ));
//      },
//      onRecoverPassword: (name) {
//        print('Recover password info');
//        print('Name: $name');
//        return _recoverPassword(name);
//        // Show new password dialog
//      },
//     // showDebugButtons: true,
//    );
//  }
//}

