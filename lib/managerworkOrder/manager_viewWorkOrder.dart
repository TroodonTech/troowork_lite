import "package:flutter/material.dart";
import '../services/login_service.dart';
//import '../services/token_Service.dart';
import '../managerdash/footerNavigation.dart';
//import '../models/login.dart' as mylogin;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sharedPref.dart';

class manager_viewWorkOrder extends StatefulWidget {
  @override
  _viewWorkOrder createState() => _viewWorkOrder();
}

class _viewWorkOrder extends State<manager_viewWorkOrder> {
  String _mySelection;
  String data = "";
  List<dynamic> _states = [
    {"FacilityKey": 733, "FacilityText": "Select"}
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    //static getVal<mylogin> token_Service.call_token();
    // var empid=getVal['empkey'];
    super.initState();
    print("HELLO");
    print(SharedPrefUtils.readPrefStr());
    setData();
  }

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var empkey = preferences.getString('empkey');
    // print("hello inside"+empkey);
    return empkey;
  }

  setData() {
    loadData().then((value) {
      setState(() {
        data = value;
        print(data);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: Text('View Work Order'),
        leading: new IconButton(
          icon: new Icon(Icons.view_headline),
          onPressed: () {
            setData();
            print(setData());
          },
        ),
      ),
      body: Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[]),
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.topLeft,
      ),
      bottomNavigationBar: Footernav(),
    );
  }
}
