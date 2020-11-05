import 'package:flutter/material.dart';

class Footernav extends StatefulWidget{
  @override
  _Footer createState()=>_Footer();
}

class _Footer extends State <Footernav>{
  @override
Widget build(BuildContext context){
    return BottomNavigationBar(
      //currentIndex: _cIndex,
      backgroundColor: Colors.green,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
            icon:Icon(Icons.map, color: Color.fromARGB(255, 255, 255, 255)),
            title: new Text(''),
            backgroundColor: Colors.cyan),
        BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit,color: Color.fromARGB(255, 255, 255, 255)),
            title: new Text(''),
            backgroundColor: Colors.blue),
        BottomNavigationBarItem(
            icon:Icon(Icons.home, color: Color.fromARGB(255, 255, 255, 255)),
            title: new Text(''),
            backgroundColor: Colors.amber),
      ],
    );
  }

}