import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'carlosProfileLandlord.dart';
import 'landlordAlameda.dart';
import 'landlordHomeScreen.dart';
import 'landlordSuggestedTask.dart';

//FALTA REMOVER

class Task{
  String name;
  String date;
  String description;
  String discount;
  String landlord;
  String products;
  String tenant;

  Task({required this.name, required this.date, required this.description, required this.discount, required this.products,required this.landlord, required this.tenant });
}

class EditTask extends StatefulWidget {
  final String id;
  const EditTask({Key? key, required this.id}) : super(key: key);

  @override
  _EditTaskState createState() => _EditTaskState(id);
}


final task_name = TextEditingController();
final discount = TextEditingController();
final description = TextEditingController();
final products = TextEditingController();
final date = TextEditingController();

class _EditTaskState extends State<EditTask> {
  String taskid;

  _EditTaskState(this.taskid);

  Task taska = Task(description: "",
      name: "",
      tenant: '',
      products: '',
      discount: '',
      date: '',
      landlord: '');

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('task').get();

    snapshot.docs.forEach((doc) {
      if (doc.id == taskid) {
        Task task1 = Task(description: doc['description'],
            name: doc['name'],
            discount: doc['discount'],
            landlord: doc['landlord'],
            products: doc['products'],
            tenant: doc['tenant'],
            date: doc['date']);
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
                      MaterialPageRoute(builder: (context) => CarlosProfileLandlord()),
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
                        hintText: taska.discount
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
                        hintText: taska.products
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
                        hintText: taska.date
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
                        primary: Color(0xFF81C784),
                        elevation: 3,
                        padding: EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14)
                        ),
                      ),
                      onPressed: () {
                        if(checkTextFieldEmptyOrNot()){
                          updatedb(taskid);
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HomeLandlord()),
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
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuggestedTask()),
            );
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
              size: 20.0,
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
              "Task edited!",
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
                      MaterialPageRoute(builder: (context) => HomeLandlord()),
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
          "You need to edit some field in order to confirm.",
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

void updatedb (taskid) {
  if (task_name.text != '') {
    FirebaseFirestore.instance.collection('task')
        .doc(taskid)
        .update({'name': task_name.text});
  }
  if (description.text != '') {
    FirebaseFirestore.instance.collection('task')
        .doc(taskid)
        .update({'description': description.text});
  }
  if (date.text != '') {
    FirebaseFirestore.instance.collection('task')
        .doc(taskid)
        .update({'description': date.text});
  }
  if (products.text != '') {
    FirebaseFirestore.instance.collection('task')
        .doc(taskid)
        .update({'description': products.text});
  }
  if (discount.text != '') {
    FirebaseFirestore.instance.collection('task')
        .doc(taskid)
        .update({'description': discount.text});
  }
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