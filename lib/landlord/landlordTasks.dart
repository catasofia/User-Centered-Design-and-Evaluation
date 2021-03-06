import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordContacts.dart';
import 'package:time_app/landlord/landlordEvaluateTasks.dart';
import 'package:time_app/landlord/profileLandlord.dart';
import 'landlordAddHouse.dart';
import 'landlordAlameda.dart';
import 'landlordEvaluate.dart';
import 'landlordHomeScreen.dart';
import 'landlordSeeHouse.dart';
import 'landlordSuggestedTask.dart';

//RATES

class House{
  String name;
  String description;
  String id;
  List aux = [];
  List<Tenant> tenants= [];
  List<Task> tasks=[];
  List<Suggested_Task> suggestedTasks= [];

  House({required this.name, required this.description, required this.id, required this.aux});
}

class Task{
  String name;
  String tenant;
  String house;
  bool done;

  Task({required this.name, required this.tenant, required this.house, required this.done });
}

class Suggested_Task{
  String name;
  String description;
  String house;
  String id;

  Suggested_Task({required this.name, required this.description, required this.house, required this.id});
}

class Tenant{
  String name;
  String image;

  Tenant({required this.name, required this.image});
}


class TasksLandlord extends StatefulWidget {
  const TasksLandlord({Key? key}) : super(key: key);

  @override
  _TasksState createState() => _TasksState();
}

class _TasksState extends State<TasksLandlord> {

  List<House> houses= [];

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('house').get();

    QuerySnapshot tasksSnapshot = await FirebaseFirestore.instance.collection('task').get();

    QuerySnapshot suggestedSnapshot = await FirebaseFirestore.instance.collection('suggestedTask').get();

    if (houses.isNotEmpty){
      houses = [];
    }

    snapshot.docs.forEach((doc) {
      House house1 = House(description: doc['description'],
          name: doc['name'],
          aux: doc['tenants'],
          id: doc.id);
      houses.add(house1);
    });

    for(var i = 0; i < houses.length; i++){

      if (houses[i].tasks.isNotEmpty){
        houses[i].tasks = [];
      }
      if (houses[i].suggestedTasks.isNotEmpty){
        houses[i].suggestedTasks = [];
      }

      tasksSnapshot.docs.forEach((element) {
        if (houses[i].name == element['house']){
          Task task1 = Task(name: element['name'],
              tenant: element['tenant'],
              house: element['house'],
              done: element['done']
          );
          houses[i].tasks.add(task1);
        }
      });

      suggestedSnapshot.docs.forEach((element) {
        if (houses[i].name == element['house']){
          Suggested_Task task1 = Suggested_Task(name: element['name'],
              description: element['description'],
              house: element['house'],
              id: element.id
          );
          houses[i].suggestedTasks.add(task1);
        }
      });
    }

    for(var i = 0; i < houses.length; i++){
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('profile').get();

      if (houses[i].tenants.isNotEmpty){
        houses[i].tenants = [];
      }

      snapshot.docs.forEach((doc) {
        houses[i].aux.forEach((element) {
          if (doc['name'] == element) {
            Tenant tenant = Tenant(name: doc['name'], image: doc['image']);
            houses[i].tenants.add(tenant);
          }});
      });
    }
    setState((){});
  }

  Widget tasks(p){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 8.0),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  p.name,
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 15,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                child: SizedBox(
                  width: 130.0,
                  height: 20.0,
                  child: Container(
                  //margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(color: !p.done ? Colors.grey[400] : Colors.lightGreen
                  ,borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: !p.done ? Text("To be completed", style: TextStyle(color: Colors.black), textAlign: TextAlign.center,) : Text("Completed", style: TextStyle(color: Colors.black), textAlign: TextAlign.center),
                  ),
                ),
              ),
        ],
      ),
    );
  }


  Widget suggestedTasks(p){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 8.0),
      child:Column(
        children: <Widget>[
          new Align(
              alignment: new Alignment(-1.1, 0.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child:

                      Text(
                        p.name,
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 15,
                          color: Colors.black,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox( height: 30, width: 100,
                      child: RaisedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SuggestedTask(id:p.id)),
                        );
                      },
                        child: Text('See Task',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15,
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                        color: Color(0xFFFFFFFF),),
                    ),
                  ]
              )
          ),
        ],
      ),
    );
  }


  Widget tenants(p, tt){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 8.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
            Container(
              child: CircleAvatar(
                backgroundImage: AssetImage(p.image),
                radius: 20.0,
              ),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                p.name,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                  //letterSpacing: 2.0,
                ),
              ),
            ),
            ],
          ),
          SizedBox(width: 50.0),
          Column(
            children: [
              for(var i in tt.tasks)
                if(p.name == i.tenant)tasks(i)]
            ,
          ),
        ],
      ),
    );
  }

  @override
  Widget template(tt) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
        color: Color(0xFF48ACBE),
        child: InkWell(
          onTap: () {

          },
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
                      tt.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                /*Padding(
                  padding: const EdgeInsets.fromLTRB(0,15,0,0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Tenants Tasks',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 2.0,
                            fontSize: 17.0,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]
                  ),
                ),*/
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        SizedBox(width: 50.0),
                        Column(
                          children: <Widget>[
                            Column(
                              children: [
                                for(var i in tt.tenants)tenants(i, tt)]
                              ,
                            ),
                            Divider(
                              height: 40.0,
                              color: Colors.white,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      'Suggested Tasks',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        letterSpacing: 2.0,
                                        fontSize: 17.0,
                                        //fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            Column(
                              children: [
                                for(var i in tt.suggestedTasks)suggestedTasks(i)]
                              ,
                            ),
                          ],
                        ),
                       /* SizedBox(width: 50.0),
                        Column(
                          children: <Widget>[
                            Column(
                              children: [
                                for(var i in tt.tasks)tasks(i)]
                              ,
                            ),
                          ],
                        ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    getData();

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
                  ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeLandlord()),
                );
              }
              ),
              IconButton(icon: Icon(
                Icons.star_border,
                size: 35.0,
              ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LandlordEvaluate()),
                );
              }),
              IconButton(
                  color: Colors.white,
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandlordContacts()),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
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
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      for (var i in houses) template(i)
                    ]
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
          "  - You have a new suggested task.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "  - Task completed, you can evaluate it now.",
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