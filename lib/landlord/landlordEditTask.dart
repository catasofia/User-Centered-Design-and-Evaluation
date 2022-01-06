import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditTask extends StatefulWidget {
  const EditTask({Key? key}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState();
}

class _EditTaskState extends State<EditTask> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
              child: Row(
                children: <Widget>[
                  IconButton(onPressed: () {
                  },
                      icon: Icon(Icons.person_outline,
                        color: Colors.black,
                        size: 38,)),
                  SizedBox(width: 8.0),
                  Container(
                    width: 240.0,
                    height: 42.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          'Search',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Colors.black,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 7.0),
                  IconButton(onPressed: (){
                  },
                      icon: Icon(Icons.notifications_active_outlined,
                        color: Colors.black,
                        size: 38,)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0),
              child: new Column(
                children: <Widget>[
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Task Name',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                    ],
                  ),
                  new TextField(
                    decoration: InputDecoration(
                        hintText: "Clean Halls"
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Discount Value',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                    ],
                  ),
                  new TextField(
                    decoration: InputDecoration(
                        hintText: "20€"
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Description',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                    ],
                  ),
                  new TextField(
                    decoration: InputDecoration(
                        hintText: "Clean the halls everyday for a month"
                    ),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      Text('Products',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                    ],
                  ),
                  new TextField(
                    decoration: InputDecoration(
                        hintText: "Cif"
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                  child: Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF81C784),
                        elevation: 3,
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)
                        ),
                      ),
                      onPressed: () { },
                      child: Text('Confirm',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20,
                          color: Colors.black, //font color
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
                  child: Container(
                    width: 150,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFEF5350),
                        elevation: 3,
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)
                        ),
                      ),
                      onPressed: () { },
                      child: Text('Remove',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20,
                          color: Colors.black, //font color
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]
      ),
    );
  }
}
