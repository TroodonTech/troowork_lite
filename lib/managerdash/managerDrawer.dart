import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constantsInUse.dart';
import '../managerworkOrder/workorderlanding.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
final storage = FlutterSecureStorage();


  class drawermenu extends StatelessWidget  {

  @override
Widget build(BuildContext context) {
    Widget _createHeader() {
      return DrawerHeader(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image:  AssetImage('../../assets/images/logo.png'))),

          child: Stack(children: <Widget>[
            Positioned(
                bottom: 12.0,
                left: 16.0,
                child: Text("Welcome",
                    style: TextStyle(
                        color: Colors.cyan,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500))),

          ]));
    }
    Widget _createDrawerItem(
        {IconData icon, String text, GestureTapCallback onTap}) {
      return ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(text),
            )
          ],
        ),
        onTap: onTap,
      );
    }
       return Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              _createHeader(),
              _createDrawerItem(icon: FontAwesomeIcons.sprayCan,text: Manager.wo,onTap:()=> Navigator.push(context, new MaterialPageRoute(builder: (context) =>new WorkOrder()))),
              Divider(),
              _createDrawerItem(icon: Icons.fingerprint,text: Manager.sfw),
              Divider(),
              _createDrawerItem(icon: Icons.contacts,text: Manager.io),
              Divider(),
              _createDrawerItem(icon: Icons.find_in_page,text: Manager.fe),
              Divider(),
              _createDrawerItem(icon: Icons.contacts,text: Manager.lt),
              Divider(),
              _createDrawerItem(icon: Icons.exit_to_app,text: "Logout"),
            ],
          ),
        );



  }


//  @override
//  Size get preferredSize => new Size.fromHeight(appBar.preferredSize.height);
}
