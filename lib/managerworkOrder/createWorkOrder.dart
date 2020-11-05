import "package:flutter/material.dart";
import '../services/login_service.dart';
import '../managerdash/footerNavigation.dart';

class createWorkOrder extends StatefulWidget {
  @override
  _createWorkOrder createState() => _createWorkOrder();
}

class _createWorkOrder extends State<createWorkOrder> {
  String _mySelection;
  List<dynamic> _states = [
    {"FacilityKey": 733, "FacilityText": "Select"}
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Service.firstname().then((response) {
      _states = response;
      print("_statesvalue$_states");
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    Widget createDrop() {
      child:
      return Container(
        margin: EdgeInsets.fromLTRB(15, 10, 0, 10),
        child: DropdownButton<String>(
          items: _states.map((item) {
            return new DropdownMenuItem<String>(
              child: new Text(item['FacilityText']),
              value: item['FacilityKey'].toString(),
            );
          }).toList(),
          onChanged: (newVal) {
            setState(() {
              _mySelection = newVal;
            });
          },
          hint: Text('Select Facilitys', textAlign: TextAlign.center),
          isExpanded: true,
          value: _mySelection,
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: Text('Create work Order'),
        leading: new IconButton(
          icon: new Icon(Icons.view_headline),
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
      ),
      body: Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const Expanded(child: Text("Select a company")),
              Expanded(child: createDrop()),
            ]),
        padding: const EdgeInsets.all(15.0),
        alignment: Alignment.topLeft,
      ),
      bottomNavigationBar: Footernav(),
    );
  }
}
