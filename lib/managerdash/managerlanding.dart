import 'package:flutter/material.dart';
import 'managerDrawer.dart';
import '../constantsInUse.dart';
import '../services/login_service.dart';
import 'footerNavigation.dart';
import '../route.dart';
import '../managerworkOrder/workorderlanding.dart';


class Managerdash extends StatefulWidget{
  @override
  _Managerdash createState()=>_Managerdash();
}

class _Managerdash extends State<Managerdash> {
 // final List<String> entries = <String>;
  final List<int> colorCodes = <int>[600, 500, 100];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final list = ListView(
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.all(10),
          color: Colors.blueAccent,
          child:InkWell(
            onTap: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) =>new WorkOrder()));
            },
            child: const Center(child: Text(Manager.wo)),
          ),
          //trailing: Icon(Icons.keyboard_arrow_right),


        ),
        Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          color: Colors.blueAccent,
            child: const Center(child: Text(Manager.sfw)),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          color: Colors.blueAccent,
          child: const Center(child: Text(Manager.io)),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          color: Colors.blueAccent,
          child: const Center(child: Text(Manager.fe)),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          color: Colors.blueAccent,
          child: const Center(child: Text(Manager.lt)),
        ),
      ],
    );


    return Scaffold(
        key: _scaffoldKey,
      drawer: drawermenu(),
    appBar: new AppBar(
    leading: new IconButton(
    icon: new Icon(Icons.view_headline),
    onPressed: () => _scaffoldKey.currentState.openDrawer(),
    ),

    ),
      body: Center(
          child:list),
      bottomNavigationBar: Footernav(),
    );
  }
}

