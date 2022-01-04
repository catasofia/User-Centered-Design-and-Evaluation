import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';

class Task5 extends StatefulWidget {
  const Task5({Key? key}) : super(key: key);

  @override
  _Task5State createState() => _Task5State();
}

class _Task5State extends State<Task5> {

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
      body: Padding(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 90.0,
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
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.info_outline,
                              color: Colors.yellow,
                              size: 15.0,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.stairs_outlined,
                          color: Colors.white,
                          size: 32.0,
                        ),
                        SizedBox(height: 6.0),
                        Text(
                          'Clean Stairs',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 16,
                            color: Colors.black,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 3.0),
                        Text(
                          '17 - 19 Dec',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 10,
                            color: Colors.black,
                            height: 1,
                          ),
                          textAlign: TextAlign.center,
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
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 150.0,
                  height: 90.0,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Icon(
                        Icons.lightbulb,
                        color: Colors.white,
                        size: 30.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Exchange Lightbulb',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 16,
                          color: Colors.black,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 7.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '+',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF006D77),
                              height: 1,
                            ),
                          ),
                          SizedBox(width: 3.0),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 45.0),
                Container(
                  width: 150.0,
                  height: 90.0,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 10),
                      Icon(
                        Icons.my_library_books_sharp,
                        color: Colors.white,
                        size: 35.0,
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'ATA',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 18,
                          color: Colors.black,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            '+',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF006D77),
                              height: 1,
                            ),
                          ),
                          SizedBox(width: 3.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 25.0),
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

