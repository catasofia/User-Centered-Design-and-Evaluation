import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantTasks.dart';
import 'tenantTasks4.dart';

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

  List<Types> tasks= [
    Types(type: 'Description', task: 'You will have to change the lightbulb in the hall of the building.\nAfter this task is performed, make sure to write the lightbulb used on the notepad so we can replace it in time for next time.'),
    Types(type: 'Products', task: '- Lightbulb: LED E27 A60 12W.\n\nNote: the ladder and the lightbulb are on the layoff of the building.'),
    Types(type: 'Price', task: 'This task has a discount on the rent of 5€.')
  ];

  @override
  Widget template(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(12.0, 18.0, 16.0, 12.0),
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
              ), onPressed: () {}),
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.person_outline,
                      color: Colors.black,
                      size: 40.0,
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
                padding: const EdgeInsets.fromLTRB(0.0, 4.0, 130.0, 0.0),
                child: Text(
                  'Exchange Lightbulb',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              for (var i in tasks) template(i),
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
              )
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

