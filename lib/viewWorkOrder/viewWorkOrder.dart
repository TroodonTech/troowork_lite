import "package:flutter/material.dart";
import 'package:shared_preferences/shared_preferences.dart';
import '../models/sharedPref.dart';
import "package:flutter/material.dart";
import '../services/viewWO__service.dart';
import '../managerdash/footerNavigation.dart';
import '../models/workOrder.dart';

String data = "";

class viewWorkOrder extends StatefulWidget {
  @override
  _viewWO createState() => _viewWO();

}

class _viewWO extends State<viewWorkOrder> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var list;

  @override
  void initState() {
    viewWO_service.wo_Service();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget workordertile() {
      return FutureBuilder<List<workOrder>>(
        future: viewWO_service.wo_Service(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<workOrder> data = snapshot.data;
            return _woListView(data);
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return CircularProgressIndicator();
        },
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: Text('View  work Order'),
             ),
      body: Container(
        child: workordertile(),
        //color: Colors.blueAccent,
        margin: EdgeInsets.all(8),
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.center,
      ),
      bottomNavigationBar: Footernav(),
    );

  }ListView _woListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].WorkorderTypeName, data[index].WorkorderKey,
              Icons.work);
        });
  }

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(

    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}

