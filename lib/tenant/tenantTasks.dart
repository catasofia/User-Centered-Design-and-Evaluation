import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_app/tenant/taskView.dart';
import 'package:time_app/tenant/taskViewAssigned.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantEvaluateMain.dart';
import 'profile.dart';

class TaskDet{
  String name;
  String date;
  String id;

  TaskDet({required this.name, required this.date, required this.id});
}

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  _TaskState createState() => _TaskState();
}

class _TaskState extends State<Task> {

  List<TaskDet> selectedTasks = [];
  List<TaskDet> tasksAv = [];
  List<TaskDet> history = [];

  Future<void> getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(
        'task').get();

    if (selectedTasks.isNotEmpty) {
      selectedTasks = [];
    }

    snapshot.docs.forEach((doc) {
      if (doc['tenant'] == "Carolina Oliveira") {
        if (doc['done'] == false) {
          TaskDet t = TaskDet(name: doc['name'], date: doc['date'], id: doc.id);
          selectedTasks.add(t);
        }
      }
    });

    if (tasksAv.isNotEmpty) {
      tasksAv = [];
    }

    snapshot.docs.forEach((doc) {
      if (doc['house'] == "Alameda T2") {
        if (doc['tenant'] == "") {
          if (doc['done'] == false) {
            TaskDet t = TaskDet(
                name: doc['name'], date: doc['date'], id: doc.id);
            tasksAv.add(t);
          }
        }
      }
    });

    if (history.isNotEmpty) {
      history = [];
    }

    snapshot.docs.forEach((doc) {
      if (doc['house'] == "Alameda T2") {
        if (doc['done'] == true) {
          TaskDet t = TaskDet(name: doc['name'], date: doc['date'], id: doc.id);
          history.add(t);
        }
      }
    });

    setState(() {});
  }

  Future<void> addTask(id) async{
    FirebaseFirestore.instance.collection('task')
        .doc(id)
        .update({'tenant': "Carolina Oliveira"});
  }

  Widget sTemplate(tt) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Column(
          children: [
            Container(
              width: 140,
              height: 140,
              child: Stack(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>
                            taskViewAssigned(taskId: tt.id)),
                      );
                    },
                    color: Color(0xFF48ACBE),
                    child: Text('                                 \n\n\n\n\n'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(57.0, 13.0, 0.0, 0.0),
                    child: Icon(
                        Icons.clean_hands_sharp,
                        color: Colors.white,
                        size: 35.0),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          tt.name + "\n" + tt.date,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 18,
                              color: Colors.white,
                              height: 1.0)
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget aTemplate(tt) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Column(
          children: [
            Container(
              width: 140,
              height: 140,
              child: Stack(
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => taskView(taskId: tt.id)),
                      );
                    },
                    color: Color(0xFF48ACBE),
                    child: Text('                                 \n\n\n\n\n'),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(57.0, 13.0, 0.0, 0.0),
                    child: Icon(
                        Icons.cleaning_services ,
                        color: Colors.white,
                        size: 35.0),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                          tt.name + "\n" + tt.date,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 18,
                              color: Colors.white,
                              height: 1.0)
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: const Icon(
                          Icons.add_circle_outline_sharp,
                          color: Colors.black,
                          size: 18.0,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupTask(context, tt.name, tt.id),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ]),
    );
  }

  Widget hTemplate(tt){
    return Column(
        children:[Container(
      width: 350.0,
      height: 40.0,
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
        color: Color(0xFF48ACBE),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "  " + tt.name,
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 18,
                color: Colors.white,
                height: 1,
              ),
              textAlign: TextAlign.left,
            ),
            Text(
              tt.date +' [Closed]',
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 15,
                color: Colors.black,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    ),
    SizedBox(height: 10.0),]);
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF48ACBE),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10),
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
                  ), onPressed: () {}),
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
      body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(28.0, 40.0, 0.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                    onPressed: () {
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
                SizedBox(width: 8.0),
                IconButton(
                  icon: const Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.black,
                    size: 38.0,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) =>
                          _buildPopupNotification(context),
                    );
                  },
                ),
              ],
            ),
            Divider(
              height: 25.0,
              color: Colors.white,
            ),
            Text(
              'Your Selected Tasks',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for(var i in selectedTasks) sTemplate(i)
                ],
              ),
            ),
            Text(
              'Tasks Available',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  for(var i in tasksAv) aTemplate(i)
                ],
              ),
            ),
            Text(
              'Task History',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
               Column(
                children:[
                  for (var i in history) hTemplate(i)
                ]
              )
            ]),
        ),
      ),
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
            "- João completed a task, rate him now.",
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
              textColor: Theme
                  .of(context)
                  .primaryColor,
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


  Widget _buildPopupTask(BuildContext context, String name, String id) {
    return new AlertDialog(
      alignment: Alignment.center,
      title:  Text(
        name,
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
            "By addind, you guarantee that you read the information of this task.",
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              color: Colors.black,
              height: 1,
            ),
          ),
          Text(
            "Are you sure you want to add?",
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
                      addTask(id);
                      Navigator.of(context).pop();
                    },
                    textColor: Theme
                        .of(context)
                        .primaryColor,
                    child: const Text(
                      'Add',
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

}
