import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordHomeScreen.dart';
import 'package:time_app/landlord/profileLandlord.dart';
import 'landlordAddHouse.dart';
import 'landlordAlameda.dart';
import 'landlordEvaluate.dart';
import 'landlordSuggestedTask.dart';

class Task{
  String name;
  String date;
  Task({required this.name, required this.date});
}

class EvaluateTasks extends StatefulWidget {
  const EvaluateTasks({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<EvaluateTasks> {

  List<Task> tasksToEvaluate= [
    Task(name: 'Clean Stairs', date: '7 - 14 Nov'),
    Task(name: 'Clean Elevator', date: '7 - 20 Nov'),
    Task(name: 'Exchange Lightbulb', date: '15 - 16 Nov'),
    Task(name: 'ATA', date: '6 - 18 Nov'),
  ];

  List<Task> tasksEvaluated= [
  Task(name: 'Clean Stairs', date: '25 - 30 Oct'),
  ];

  @override
  Widget tasksCard(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      color: Color(0xFF48ACBE),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      tt.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  Text(
                      tt.date,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      )
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.star_border, size: 25),
                Icon(Icons.star_border, size: 25),
                Icon(Icons.star_border, size: 25),
                Icon(Icons.star_border, size: 25),
                Icon(Icons.star_border, size: 25),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                  child: Icon(Icons.check_outlined, size: 40),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF48ACBE),
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  color: Colors.black,
                  icon: Icon(
                    Icons.house_outlined,
                    size: 35.0,
                  ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeLandlord()),
                );
              }
              ),
              IconButton(
                  color: Colors.white,
                  icon: Icon(
                  Icons.star_border,
                  size: 35.0,
              ), onPressed: () {
              }),
              IconButton(
                  icon: Icon(
                    Icons.cleaning_services_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {

                  }
              ),
              IconButton(
                  icon: Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {

                  }
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileLandlord()),
                      );
                    },
                  ),
                  SizedBox(width: 10.0),
                  Container(
                    width: 235.0,
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
                        builder: (BuildContext context) => _buildPopupNotification(context),
                      );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Tasks to Evaluate',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    for (var i in tasksToEvaluate) tasksCard(i),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Tasks Evaluated',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    for (var i in tasksEvaluated) tasksCard(i),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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

Widget _buildPopupAdd(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    title: const Text(
      'Add',
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 40,
            width: 150,
            child: TextButton(
              child: Text('House'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.cyan[100],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddHouse()),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 40,
            width: 150,
            child: TextButton(
              child: Text('Tenant'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.cyan[100],
              ),
              onPressed: () {
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 40,
            width: 150,
            child: TextButton(
              child: Text('Neighbor'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.cyan[100],
              ),
              onPressed: () {
              },
            ),
          ),
        ),
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
    ),
  );
}
