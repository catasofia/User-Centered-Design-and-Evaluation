import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantTasks.dart';
import 'tenantTasks4.dart';
import 'profile.dart';
import 'tenantEvaluateMain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Types{
  String type;
  String task;

  Types({required this.type, required this.task});
}

class ExchangeLightbulb extends StatefulWidget{
  const ExchangeLightbulb({Key? key}) : super(key: key);

  @override
  _LightbulbState createState() => _LightbulbState();
}

class _LightbulbState extends State<ExchangeLightbulb>{
  CollectionReference tasksDB = FirebaseFirestore.instance.collection('task');
  List<Types> tasks = [];
  int discount = 0;

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('task').get();

    snapshot.docs.forEach((doc) {
      if (doc.id == 'jXmLSylXNl6l1EoZsx5S') {
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


  @override
  Widget template(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(12.0, 18.0, 16.0, 10.0),
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

  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    getData();
    Map<String, dynamic>  data = {};
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
                      Icon(
                        Icons.notifications_active_outlined,
                        color: Colors.black,
                        size: 40.0,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(11.0, 10.0, 0.0, 0.0),
                  child: Text('Exchange Lightbulb',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,)
                  ),
                ),
                Container(
                  height: 420,
                  child: Scrollbar(
                    isAlwaysShown: true,
                    controller: _scrollController,
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      child: SizedBox(
                        width: 400,
                        child:Column(
                          children: [
                            for(var i in tasks) template(i),
                          ],
                        ),
                      ),
                    ),
                  ) ,
                ),
                SizedBox(height: 10,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {

                        },
                        color: Color(0xFFF86E6E),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text(
                            '      Remove      ',
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                      RaisedButton(
                        onPressed: () {

                        },
                        color: Color(0xFF69BB67),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          side: BorderSide(color: Colors.black),
                        ),
                        child: Text(
                            '  Mark as Done  ',
                            style: TextStyle(
                              color: Colors.black,
                            )
                        ),
                      ),
                    ]
                ),
              ]
          ),
        ),
    );
  }
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
          "Are you sure you want to add this task?",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Task4()),
                    );
                  },
                  textColor: Theme.of(context).primaryColor,
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

