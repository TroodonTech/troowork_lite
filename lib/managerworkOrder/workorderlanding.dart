import 'package:flutter/material.dart';
import '../managerdash/managerDrawer.dart';
  import '../managerdash/footerNavigation.dart';
import '../constantsInUse.dart';
import 'createWorkOrder.dart';
import 'manager_viewWorkOrder.dart';
import '../viewWorkOrder/viewWorkOrder.dart';

class WorkOrder extends StatefulWidget{
  @override
  _WorkOrder createState()=>_WorkOrder();
}

class _WorkOrder extends State<WorkOrder>{
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context){
    Widget WorkOrderItem(
        {IconData icon, String text, GestureTapCallback onTap}) {
      return ListTile(
        title: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Center(child:Text(text)),
            )
          ],
        ),
        onTap: onTap,
      );
    }

    final list= ListView(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.blue,
            child:InkWell(
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) =>new createWorkOrder()));
              },
              child: WorkOrderItem(icon: Icons.exit_to_app,text: ManagerWork.cwo),
            ),

          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.blue,
            child:InkWell(
              onTap: () {
                Navigator.push(context, new MaterialPageRoute(builder: (context) =>new manager_viewWorkOrder()));
              },
            child: WorkOrderItem(icon: Icons.exit_to_app,text: ManagerWork.cwo),
            )
          ),
          Container(
            margin: const EdgeInsets.all(10),
            color: Colors.blue,
              child:InkWell(
                onTap: () {
                  Navigator.push(context, new MaterialPageRoute(builder: (context) =>new viewWorkOrder()));
                },
                child: WorkOrderItem(icon: Icons.exit_to_app,text: ManagerWork.vwo),
              )
          ),
        ]
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
