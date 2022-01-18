import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_app/landlord/landlordAlameda.dart';

import 'carlosProfileLandlord.dart';
import 'landlordHomeScreen.dart';
import 'landlordSuggestedTask.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  _AddTaskState createState() => _AddTaskState();
}

//FALTA ADD CAMPO PARA DATA !!!
final task_name = TextEditingController();
final discount = TextEditingController();
final description = TextEditingController();
final products = TextEditingController();

class _AddTaskState extends State<AddTask> {

  @override
  Widget build(BuildContext context) {
    CollectionReference task = FirebaseFirestore.instance.collection('task');

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
                        hintText: "Insert name"
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
                        hintText: "Insert value"
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
                        hintText: "Insert description"
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
                        hintText: "Insert products"
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 90.0, 0.0, 0.0),
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
                          task.add({
                            'name': task_name.text,
                            'discount': discount.text,
                            'products': products.text,
                            'description': description.text,
                          });
                          clearText();
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => _buildPopupAddTask(context),
                          );
                        } else {
                          showDialog(
                            context: context,
                            //FAZER FUNCAO P SO MOSTRAR POP UP QD N ESTIVER TUDO PREENCHIDO
                            builder: (BuildContext context) => _buildPopupEvaluation(context),
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
                          MaterialPageRoute(builder: (context) => LandlordAlameda()),
                        );
                      },
                    )
                ),
              ],
            )
          ]
      ),
    );
  }
}

Widget _buildPopupEvaluation(BuildContext context) {
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
              size: 35.0,
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

clearText(){
  task_name.clear();
  description.clear();
  products.clear();
  discount.clear();
}

checkTextFieldEmptyOrNot(){
  String name;
  String dis;
  String prod;
  String desc;
  name = task_name.text;
  dis = discount.text;
  prod = products.text;
  desc = description.text;
  return name != '' && dis !='' && prod !='' && desc !='';
}

Widget _buildPopupAddTask(BuildContext context) {
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
              "Task added!",
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
                      //MUDAR !!
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