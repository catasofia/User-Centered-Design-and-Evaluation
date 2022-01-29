import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantTasks.dart';
import 'profile.dart';
import 'tenantEvaluateMain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Types{
  String type;
  String task;

  Types({required this.type, required this.task});
}

class taskViewAssigned extends StatefulWidget{
  final String taskId;

  const taskViewAssigned({Key? key, required this.taskId}) : super(key: key);

  @override
  _taskViewAssignedState createState() => _taskViewAssignedState(taskId);
}

class _taskViewAssignedState extends State<taskViewAssigned>{
  String taskId;
  List<Types> tasks = [];
  String discount = "";
  String name = "";

  _taskViewAssignedState(this.taskId);

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('task').get();

    snapshot.docs.forEach((doc) {
      if (doc.id == taskId) {
        name = doc['name'];
        discount = doc['discount'];
        tasks= [
          Types(type: 'Description', task: doc['description']),
          Types(type: 'Products', task: doc['products']),
          Types(type: 'Price', task: 'This task has a discount on the rent of $discount€.'),
          Types(type: 'Date', task: doc['date'])
        ];
      };
    });

    setState((){});
  }

  Future<void> markDone() async{
      FirebaseFirestore.instance.collection('task')
        .doc(taskId)
        .update({'done': true});

      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('profile').get();

      double aux = 0;
      String id = "";

      snapshot.docs.forEach((doc) {
        if (doc['name'] == "Carolina Oliveira") {
          aux += double.parse(doc['discount']);
          id = doc.id;
        };
      });

      aux += double.parse(discount);

      FirebaseFirestore.instance.collection('profile')
          .doc(id)
          .update({'discount': aux.toString()});
  }

  Future<void> removeTask() async{
    FirebaseFirestore.instance.collection('task')
        .doc(taskId)
        .update({'tenant': ""});
  }

  @override
  Widget template(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(12.0, 13.0, 16.0, 8.0),
      color: Color(0xFF9ED3DD),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            new Align(
              alignment: new Alignment(-1.1, 0.0),
              child: Container(
                width: 400.0,
                height: 28.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xFF006D77),
                    width: 2,
                  ),
                ),
                child: Text(
                  tt.type,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
                tt.task,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                )
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    Map<String, dynamic>  data = {};
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF7FBECB),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.house_outlined,
                  size: 35.0,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
              ),
              IconButton(icon: Icon(
                Icons.star_border,
                size: 35.0,
              ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EvaluateMain()),
                );
              }),
              IconButton(
                  color: Colors.white,
                  icon: Icon(
                    Icons.cleaning_services_rounded,
                    size: 30.0,
                  ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Task()),
                );
              }),
              IconButton(
                  icon: Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contacts()),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 12.0, 0.0, 0.0),
                child: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed:(){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Profile()),
                          );
                        },
                        icon: Icon(
                          Icons.person_outline,
                          color: Colors.black,
                          size: 40.0,
                        )
                    ),
                    SizedBox(width: 15.0),
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
                          SizedBox(width: 10.0),
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
                    SizedBox(width: 15.0),
                    IconButton(
                        onPressed:(){
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => _buildPopupNotification(context),
                          );
                        },
                      icon: Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.black,
                        size: 40.0,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(11.0, 10.0, 0.0, 0.0),
                child: Text( name,
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,)
                ),
              ),
              Container(
                height: 390,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: 400,
                      child:Column(
                        children: [
                          for(var i in tasks) template(i),
                        ],
                    ),
                  ),
                ) ,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupConfirmation(context),
                      );
                    },
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                      side: BorderSide(color: Colors.black),
                    ),
                    label: const Text(
                        '      Remove       ',
                        style: TextStyle(
                          color: Colors.black,
                        )
                    ),
                    backgroundColor: Colors.redAccent,
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildPopupConfirmation1(context),
                      );
                    },
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(3.0),
                      side: BorderSide(color: Colors.black),
                    ),
                    label: const Text(
                        '   Mark as Done   ',
                        style: TextStyle(
                          color: Colors.black,
                        )
                    ),
                    backgroundColor: Colors.lightGreen
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
                          Navigator.pop(
                            context,
                          );
                        },
                      )
                  ),
                ],
              )
            ]
        ),
      ),
    );
  }


  Widget _buildPopupConfirmation1(BuildContext context) {
    return new AlertDialog(
      alignment: Alignment.center,
      title: const Text(
        'Confirmation',
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 30,
          color: Colors.black,
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
            "Are you you want to mark this task as done?",
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
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.redAccent,
              ),
              padding: new EdgeInsets.only(top: 6.0),
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
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.lightGreen,
              ),
              padding: new EdgeInsets.only(top: 6.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      markDone();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Home()),
                      );
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: const Text(
                      'Yes',
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



  Widget _buildPopupConfirmation(BuildContext context) {
    return new AlertDialog(
      alignment: Alignment.center,
      title: const Text(
        'Confirmation',
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 30,
          color: Colors.black,
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
            "Are you sure you want to remove this task?",
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
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.redAccent,
              ),
              padding: new EdgeInsets.only(top: 6.0),
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
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                color: Colors.lightGreen,
              ),
              padding: new EdgeInsets.only(top: 6.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new FlatButton(
                    onPressed: () {
                      removeTask();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>Home()),
                      );
                    },
                    textColor: Theme.of(context).primaryColor,
                    child: const Text(
                      'Remove',
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
            "- Carlos sent you a message.",
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              color: Colors.black,
              height: 1,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            "- You have two days to complete your task.",
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              color: Colors.black,
              height: 1,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            "- Carlos added a new task.",
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

}

