import 'package:flutter/material.dart';

import 'landlordAddTask.dart';
import 'landlordEvaluate.dart';
import 'landlordHomeScreen.dart';

class Tenant{
  String name;
  String pic;
  Tenant({required this.name, required this.pic});
}

class Neighbor{
  String name;
  String pic;
  Neighbor({required this.name, required this.pic});
}

class Task{
  String name;
  Task({required this.name});
}

class LandlordAlameda extends StatefulWidget {
  const LandlordAlameda({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<LandlordAlameda> {

  List<Tenant> tenants = [Tenant(name:'Carolina Oliveira  460€', pic: 'assets/carolina.jpeg'), Tenant(name:'João Pires  450€', pic:'assets/joao.jpg'), Tenant(name:'Marco Ramos  450€', pic: 'assets/marco.jpg')];
  List<Neighbor> neighbors = [Neighbor(name:'Francisca Mota', pic: 'assets/francisca.jpg')];
  List<Task> tasks = [Task(name:'Clean halls 20€'), Task(name:'Replace lightbulb 5€'), Task(name:'Collect an order 5€')];

  @override
  Widget template(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          new Align(
            alignment: new Alignment(-1.1, 0.0),
            child: Container(
              width: 400.0,
              height: 50.0,
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: CircleAvatar(backgroundImage: AssetImage(tt.pic),
                      radius: 20,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0 ,0),
                    child: Text(
                      tt.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        letterSpacing: 1.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ),
          ),
        ],
      ),
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
                      child: Text(
                        tt.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 1.0,
                        ),
                        textAlign: TextAlign.center,
                      ),

                    ),
                    RaisedButton(onPressed: (){ },
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
                  ),
                  onPressed: () {
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
      body:
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 40.0,
                  ),
                  SizedBox(width: 15.0),
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
                    onPressed: () {showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupNotification(context),
                    );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  'Alameda T2',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
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
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Row(
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
                        child: OutlineButton(onPressed: (){},
                            shape: new CircleBorder(),
                            borderSide: BorderSide(color: Color(0xFF48ACBE)),
                            child:Icon(Icons.add,
                                color: Color(0xFF48ACBE))
                        ),
                      ),
                    ]
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    for (var i in neighbors) template(i),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Row(
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
                            MaterialPageRoute(builder: (context) => AddTask()),
                          );
                        },
                            shape: new CircleBorder(),
                            borderSide: BorderSide(color: Color(0xFF48ACBE)),
                            child:Icon(Icons.add,
                                color: Color(0xFF48ACBE))
                        ),
                      ),
                    ]
                ),
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
                        )
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
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
          "- Vasco is interested in your apartment in Chiado.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "- Carolina has sent you a message.",
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