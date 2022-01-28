//NEIGHBOR PROFILE?

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'neighborProfile.dart';
import 'neighborHomeScreen.dart';

class House{
  String name = "";

  House({ required this.name});
}

class SuggestTask extends StatefulWidget {
  const SuggestTask({Key? key}) : super(key: key);

  @override
  _SuggestTaskState createState() => _SuggestTaskState();
}

final task_name = TextEditingController();
final description = TextEditingController();
String neighborid = "NFiyyguWHANyT011vdbh";

class _SuggestTaskState extends State<SuggestTask> {

  House housea = House(
      name: "");

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('house').get();
    QuerySnapshot profiles = await FirebaseFirestore.instance.collection('profile').get();
    snapshot.docs.forEach((doc) {
      profiles.docs.forEach((element) {
        if(element['name'] == "Francisca Mota"){
          if (doc['name'] == element['house']) {
            House house1 = House(
                name: doc['name']);
            housea = house1;
          }}});
    });
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference task = FirebaseFirestore.instance.collection('suggestedTask');
    getData();
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NeighborProfile()),
                    );
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupNotification(context),
                    );
                    },
                      icon: Icon(Icons.notifications_active_outlined,
                        color: Colors.black,
                        size: 38,)),
                ],
              ),
            ),
            Divider(
              height: 70.0,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 40, 30, 0),
              child: Row(
                children: [
                  Text('Task Name',
                    style: TextStyle(
                        fontSize: 20
                    ),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30.0, 0, 30, 0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: task_name,
                    decoration: InputDecoration(
                      hintText: "Insert name"
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Text('Description',
                        style: TextStyle(
                            fontSize: 20
                        ),),
                    ],
                  ),
                  new TextField(
                    controller: description,
                    decoration: InputDecoration(
                      hintText: "Insert description"
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 125,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 75,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF48ACBE),
                      elevation: 3,
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14)
                      ),
                    ),
                    onPressed: () {
                      if(checkTextFieldEmptyOrNot()){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _errorPopup(context),
                        );
                      } else{
                        task.add({
                          'name': task_name.text,
                          'description': description.text,
                          'house': housea.name,
                        });
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _confirmationPopup(context),
                        );
                      }
                    },
                    child: Text('Submit',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: Colors.black, //font color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 20,),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NeighborHome()),
                        );
                      },
                    )
                ),
              ],
            ),
          ]
      ),
    );
  }
}

clearText(){
  task_name.clear();
  description.clear();
}

checkTextFieldEmptyOrNot(){
  String text1,text2;

  text1 = task_name.text;
  text2 = description.text;

  if(text1 == '' || text2 == '') {
    return true;
  } else {
    return false;
  }
}

Widget _errorPopup(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    backgroundColor: Color(0xFF48ACBE),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(child: Icon(Icons.error, color: Colors.red[700], size: 100,)),
        SizedBox(height: 15,),
        Text(
          "You need to fill the information in order to submit.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.highlight_remove,
              color: Colors.black,
              size: 25.0,
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _confirmationPopup(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    backgroundColor: Color(0xFF48ACBE),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(child: Icon(Icons.check, color: Colors.lightGreen, size: 100,)),
        SizedBox(height: 15,),
        Text(
          "Task successfully suggested.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey[400]
              ),
              onPressed: (){
                clearText();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NeighborHome()),
                );
              },
              child: Text('Ok', style: TextStyle(color: Colors.black),),
            )
          ),
        ],
      ),
    ],
  );
}

Widget _buildPopupNotification(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    title: const Text(
      'Notifications',
      style: TextStyle(
        fontFamily: 'Arial',
        fontSize: 30,
        color: Colors.white,
        height: 1,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Color(0xFF48ACBE),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "- There's a new task to evaluate, rate it now.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Icon(
              Icons.remove_circle_outline,
              color: Colors.black,
              size: 25.0,
            ),
          ),
        ],
      ),
    ],
  );
}
