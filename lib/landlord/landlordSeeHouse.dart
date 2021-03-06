import 'package:time_app/landlord/landlordAddNeighbor.dart';
import 'package:time_app/landlord/landlordEvaluate.dart';
import 'package:time_app/landlord/landlordTasks.dart';
import 'package:time_app/landlord/profileLandlord.dart';
import 'package:time_app/landlord/tenantProfile.dart';
import 'landlordAddTask.dart';
import 'landlordAddTenant.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'landlordContacts.dart';
import 'landlordEditTask.dart';
import 'landlordHomeScreen.dart';
import 'landlordSuggestedTask.dart';


class Tenant{
  String name;
  String image;

  Tenant({required this.name, required this.image});
}

class Neighbor{
  String name;
  String image;

  Neighbor({required this.name, required this.image});
}

class Task{
  String name;
  String id;

  Task({required this.name, required this.id});
}

class House{
  String description = "";
  String name = "";
  String price = "";
  String location = "";
  List tenants = [];
  List neighbors = [];
  List tasks = [];

  House({required this.description, required this.name, required this.price, required this.location, required this.tenants, required this.neighbors, required this.tasks});
}

class LandlordSeeHouse extends StatefulWidget {
  final String id;

  const LandlordSeeHouse({Key? key, required this.id}) : super(key: key);

  @override
  _HomeState createState() => _HomeState(id);
}

class _HomeState extends State<LandlordSeeHouse> {
  String houseid;

  _HomeState(this.houseid);

  House housea = House(description: "",
  name: "",
  price: "",
  location: "",
  neighbors: [],
  tenants: [],
  tasks: []);

  List<Tenant> tenants = [];
  List<Neighbor> neighbors = [];
  List<Task> tasks = [];

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('house').get();

    snapshot.docs.forEach((doc) {
      if (doc.id == houseid) {
        House house1 = House(description: doc['description'],
            name: doc['name'],
            price: doc['price'],
            location: doc['location'],
            neighbors: doc['neighbors'],
            tenants: doc['tenants'],
            tasks: doc['tasks']);
        housea = house1;
      }});

    QuerySnapshot snapshot1 = await FirebaseFirestore.instance.collection('profile').get();

    if (tenants.isNotEmpty){
      tenants = [];
    }

    if (neighbors.isNotEmpty){
      neighbors = [];
    }

    snapshot1.docs.forEach((doc) {
      housea.tenants.forEach((element) {
        if (doc['name'] == element) {
          Tenant tenant = Tenant(name: doc['name'], image: doc['image']);
          tenants.add(tenant);
        }});
      housea.neighbors.forEach((element) {
        if (doc['name'] == element){
          Neighbor neighbor = Neighbor(name: doc['name'], image: doc['image']);
          neighbors.add(neighbor);
        }
      });
      });

    QuerySnapshot snapshot2 = await FirebaseFirestore.instance.collection('task').get();

    if (tasks.isNotEmpty){
      tasks = [];
    }

    snapshot2.docs.forEach((doc) {
      if(doc['done'] == false){
        if (doc['house'] == housea.name) {
          Task task = Task(name: doc['name'], id: doc.id);
          tasks.add(task);
          }
      //});
    }});

    setState((){});
  }

  @override
  Widget template(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      child: InkWell(onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TenantProfile(id:tt.name)),
        );
      },
      child: Column(
          children: <Widget>[
            Row(
              children: [
                new Align(
                  alignment: new Alignment(-1.1, 0.0),
                  child:Padding(
                    padding: const EdgeInsets.all(10.0),
                    child:  Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(tt.image),
                        radius: 20.0,
                      ),),),),
                SizedBox(height: 50.0),
                Text(
                  tt.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            )
          ] ),
      ),);
  }

  @override
  Widget templaten(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
        child: Column(
            children: <Widget>[
              Row(
                children: [
                  new Align(
                    alignment: new Alignment(-1.1, 0.0),
                    child:Padding(
                      padding: const EdgeInsets.all(10.0),
                      child:  Container(
                        child: CircleAvatar(
                          backgroundImage: AssetImage(tt.image),
                          radius: 20.0,
                        ),),),),
                  SizedBox(height: 50.0),
                  Text(
                    tt.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ] ),
      );
  }


  @override
  Widget template1(tt) {

    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      child: Column(
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
                    tt.name,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                RaisedButton(onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EditTask(id:tt.id)),
                  );
                },
                    padding: EdgeInsets.only(top:14.0, bottom:14.0, left:10.0, right: 10.0),
                    child: Text('Edit',
                    style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    color: Colors.black,
                    height: 1,
                  ),
                ),
            color: Color(0xFF48ACBE),),
              ]
            )
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    getData();

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
                  color: Colors.white,
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
                  icon: Icon(
                    Icons.cleaning_services_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasksLandlord()),
                    );
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
              Divider(
                height: 40.0,
                color: Colors.white,

              ),
            Text(housea.name,
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,)
            ),

              Divider(
                height: 25.0,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Tenants',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 ButtonTheme(
                    height: 30,
                    child: OutlineButton(onPressed: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addTenant()),);
                    },
                    shape: new CircleBorder(),
                    borderSide: BorderSide(color: Color(0xFF48ACBE)),
                    child:Icon(Icons.add,
                    color: Color(0xFF48ACBE))
                    ),
                  ),
                ]
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    for (var i in tenants) template(i),
                  ],
                ),
              ),
              Divider(
                height: 50.0,
                color: Colors.white,
              ),

              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Neighbors',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ButtonTheme(
                      height: 30,
                      child: OutlineButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => addNeighbor()),);
                      },
                          shape: new CircleBorder(),
                          borderSide: BorderSide(color: Color(0xFF48ACBE)),
                          child:Icon(Icons.add,
                              color: Color(0xFF48ACBE))
                      ),
                    ),
                  ]
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    for (var i in neighbors) templaten(i),
                  ],
                ),
              ),
              Divider(
                height: 50.0,
                color: Colors.white,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tasks',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ButtonTheme(
                      height: 30,
                      child: OutlineButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AddTask(id: houseid)),);
                      },
                          shape: new CircleBorder(),
                          borderSide: BorderSide(color: Color(0xFF48ACBE)),
                          child:Icon(Icons.add,
                              color: Color(0xFF48ACBE))
                      ),
                    ),
                  ]
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   for (var i in tasks) template1(i),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Row(
                children: [Align(
                  //alignment: Alignment.bottomLeft,
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
          "  - Jo??o completed a task, rate him now.",
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