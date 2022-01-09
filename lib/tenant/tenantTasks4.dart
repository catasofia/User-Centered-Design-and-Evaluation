import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantEvaluateMain.dart';
import 'tenantTasks.dart';
import 'profile.dart';
import 'cleanStairs.dart';
import 'ata.dart';
import 'cleanElevator.dart';
import 'exchangeLightbulb.dart';


class Task4 extends StatefulWidget {
  const Task4({Key? key}) : super(key: key);

  @override
  _Task4State createState() => _Task4State();
}

class _Task4State extends State<Task4> {

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
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Task()),
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
                      MaterialPageRoute(builder: (context) => Contacts()),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
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
                  width: 232.0,
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
            Row(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Stack(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ExchangeLightbulb()),
                            );
                          },
                          color: Color(0xFF48ACBE),
                          child: Text('                                 \n\n\n\n\n'),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
                          child: IconButton(
                              onPressed: (){},
                              icon: Icon(
                                Icons.info_outline,
                                color: Colors.yellow,
                                size: 15.0,
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(60.0, 13.0, 0.0, 0.0),
                          child: Icon(
                              Icons.lightbulb,
                              color: Colors.white,
                              size: 30.0),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(5.0, 55.0, 0.0, 0.0),
                          child: Text(
                            'Exchange Lightbulb',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(60.0, 75.0, 0.0, 0.0),
                          child: Text(
                            '17 Dec',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: Colors.black,
                              height: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 40.0),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Stack(
                      children: <Widget>[
                        RaisedButton(
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => CleanStairs()),
                            );
                          },
                          color: Color(0xFF48ACBE),
                          child: Text('                                 \n\n\n\n\n'),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(100.0, 0.0, 0.0, 0.0),
                          child: IconButton(
                              onPressed: (){},
                              icon: Icon(
                                Icons.info_outline,
                                color: Colors.yellow,
                                size: 15.0,
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(60.0, 13.0, 0.0, 0.0),
                          child: Icon(
                              Icons.stairs_outlined,
                              color: Colors.white,
                              size: 30.0),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30.0, 55.0, 0.0, 0.0),
                          child: Text(
                            'Clean Stairs',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 16,
                              color: Colors.black,
                              height: 1,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(55.0, 75.0, 0.0, 0.0),
                          child: Text(
                            '17 - 19 Dec',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 10,
                              color: Colors.black,
                              height: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
            Text(
              'Tasks Available',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 48.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'None at the moment',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontSize: 15.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 50.0),
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
            Container(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    SizedBox(width: 10.0),
                    Text(
                      'Clean Stairs',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 100.0),
                    Text(
                      '7 - 14 Nov [Closed]',
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
            SizedBox(height: 10.0),
            Container(
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 5.0),
                    SizedBox(width: 10.0),
                    Text(
                      'Exchange Lightbulb',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.white,
                        height: 1,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(width: 60.0),
                    Text(
                      '16 Nov [Closed]',
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
            SizedBox(height: 15.0),
            Center(
              child: Container(
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
                  color: Color(0xFF006D77),
                ),
                padding: new EdgeInsets.only(top: 6.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'See More',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
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

