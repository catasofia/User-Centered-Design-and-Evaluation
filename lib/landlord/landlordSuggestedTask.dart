import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_app/landlord/landlordTasks.dart';
import 'package:time_app/landlord/profileLandlord.dart';
import 'landlordAlameda.dart';
import 'landlordHomeScreen.dart';

class Sug_Task{
  String name;
  String description;
  String house;

  Sug_Task({required this.name, required this.description, required this.house });
}

class SuggestedTask extends StatefulWidget {
  final String id;
  const SuggestedTask({Key? key, required this.id}) : super(key: key);

  @override
  _SuggestedTaskState createState() => _SuggestedTaskState(id);
}

final task_name = TextEditingController();
final discount = TextEditingController();
final description = TextEditingController();
final products = TextEditingController();
final date = TextEditingController();

class _SuggestedTaskState extends State<SuggestedTask> {
  String taskid;
  _SuggestedTaskState(this.taskid);


  Sug_Task taska = Sug_Task(description: "",
      name: "",
      house:"",
     );

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('suggestedTask').get();

    snapshot.docs.forEach((doc) {
      if (doc.id == taskid) {
        Sug_Task task1 = Sug_Task(description: doc['description'],
            name: doc['name'],
        house: doc['house']);
        taska = task1;
      }});
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                child: Row(
                  children: <Widget>[
                    IconButton(onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>ProfileLandlord()),
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
                      controller: task_name,
                      decoration: InputDecoration(
                          hintText: taska.name
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
                      controller: discount,
                      decoration: InputDecoration(
                         // hintText: taska.discount
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
                      controller: description,
                      decoration: InputDecoration(
                          hintText: taska.description
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
                      controller: products,
                      decoration: InputDecoration(
                         // hintText: taska.products
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text('Date',
                          style: TextStyle(
                              fontSize: 20
                          ),),
                      ],
                    ),
                    new TextField(
                      controller: date,
                      decoration: InputDecoration(
                        //  hintText: taska.date
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 60.0, 0.0, 0.0),
                    child: Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.redAccent,
                          elevation: 3,
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => _buildPopupDeleteTask(context, taskid),
                          );
                          //  FirebaseFirestore.instance.collection("tasks").doc(taskid).delete();
                        },
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 60.0, 0.0, 0.0),
                    child: Container(
                      width: 150,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreen,
                          elevation: 3,
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        onPressed: () {
                          if(checkTextFieldEmptyOrNot()){
                           addTaskDB(taska, taskid);
                            clearText();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _buildPopupEditTask(context),
                            );
                          } else{
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _errorPopup(context),
                            );
                          }
                        },
                        child: Text('Add',
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
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: (){
                          Navigator.pop(
                            context,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ]
        ),),
    );
  }
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
          "  - João completed a task, rate him now.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "  - Carolina has sent you a message.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20, fontFamily: 'Arial', color: Colors.black),
          ),
          onPressed: () {/*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuggestedTask()),
            );*/
          },
          child: const Text('- Francisca suggested a task for Alameda T2.',
              style: TextStyle(fontFamily: 'Arial',
                fontSize: 20,
                color: Colors.black,
                height: 1,)),
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


Widget _buildPopupEditTask(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    backgroundColor: Color(0xFF48ACBE),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check,
              size: 30.0,
              color: Colors.lightGreen,
            ),
            SizedBox(width: 3.0),
          ],
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Task Added!",
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                color: Colors.black,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 90.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.grey[300],
            ),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasksLandlord()),
                    );
                  },
                  textColor: Theme.of(context).primaryColor,
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}

Widget _buildPopupDeleteTask(BuildContext context, String taskid) {
  return AlertDialog(
    alignment: Alignment.center,
    title: const Text(
      'Delete Task',
      style: TextStyle(
        fontFamily: 'Arial',
        fontSize: 30,
        color: Colors.black,
        height: 1,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: const Color(0xFF48ACBE),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text(
          "Are you sure you want to remove this suggested task?",
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.redAccent,
            ),
            padding: const EdgeInsets.only(top: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  textColor: Theme
                      .of(context)
                      .primaryColor,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                  offset: const Offset(0, 3),
                ),
              ],
              color: Colors.lightGreen,
            ),
            padding: const EdgeInsets.only(top: 6.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    FirebaseFirestore.instance.collection("suggestedTask").doc(taskid).delete();
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const TasksLandlord()));
                  },
                  textColor: Theme
                      .of(context)
                      .primaryColor,
                  child: const Text(
                    'Confirm',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
Widget _errorPopup(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    backgroundColor: Color(0xFF48ACBE),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_amber_outlined,
              size: 55.0,
              color: Colors.redAccent,
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You must fill in all the\n fields to add the task.",
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                color: Colors.black,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 90.0,
            height: 30.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1.5,
                  blurRadius: 1.5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
              color: Colors.grey[300],
            ),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  textColor: Theme.of(context).primaryColor,
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
/*
Widget _errorPopup(BuildContext context) {
  return AlertDialog(
    alignment: Alignment.center,
    title: const Text(
      'Atention!',
      style: TextStyle(
        fontFamily: 'Arial',
        fontSize: 30,
        color: Colors.black,
        height: 1,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: const Color(0xFF48ACBE),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Center(child: Icon(Icons.error, color: Colors.redAccent, size: 70,)),
        //SizedBox(height: 2, width: 2),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Text(
            "You need to fill in all the fields to in order to confirm.",
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              color: Colors.black,
              height: 1,
            ),
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
}*/

void addTaskDB (taska, taskid) {
  CollectionReference task = FirebaseFirestore.instance.collection('task');
  task.add({
    'name': task_name.text,
    'discount': discount.text,
    'products': products.text,
    'description': description.text,
    'date': date.text,
    'tenant': "",
    'landlord': "Carlos Silva",
    'house': taska.house,
    'landStars': 0,
    'neigStars': 0,
    'done': false
  });
  FirebaseFirestore.instance
      .collection("suggestedTask")
      .doc(taskid)
      .delete();
}

checkTextFieldEmptyOrNot(){
  String name = task_name.text;
  String desc = description.text;
  String disc = discount.text;
  String da = date.text;
  String pro = products.text;
  return name != '' || desc != '' || disc != '' || da != '' || pro != '';
}

clearText(){
  task_name.clear();
  description.clear();
  discount.clear();
  products.clear();
  date.clear();
}