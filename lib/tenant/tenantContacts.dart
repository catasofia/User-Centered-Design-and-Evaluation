import 'package:flutter/material.dart';
import 'tenantTasks.dart';
import 'tenantHomescreen.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

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
                  color: Colors.white,
                  icon: Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 30.0,
                  ), onPressed: () {}),
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
                SizedBox(width: 15.0),
                Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.black,
                  size: 40.0,
                ),
              ],
            ),
            Divider(
              height: 40.0,
              color: Colors.white,
            ),
            Text(
              'Your Contacts',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                SizedBox(width: 20.0),
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/carlos.jfif'),
                        radius: 65.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Carlos',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 50.0),
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/map.jfif'),
                        radius: 65.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Marco',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Text(
              'Contacts',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/carlos.jfif'),
                    radius: 25.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  width: 290.0,
                  height: 50.0,
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
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 10.0),
                        Row(
                          children: [
                            Text(
                              'Carlos',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                color: Colors.black,
                                height: 1,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 190.0),
                            Icon(
                              Icons.plus_one_outlined,
                              color: Color(0xFF48ACBE),
                              size: 20,
                            ),
                            SizedBox(width: 5.0),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size: 12,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Good morning, have you switched the...',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14,
                            color: Colors.black,
                            height: 1,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/map.jfif'),
                    radius: 25.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  width: 290.0,
                  height: 50.0,
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
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 10.0),
                        Row(
                          children: [
                            Text(
                              'Marco',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                color: Colors.black,
                                height: 1,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 215.0),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size: 12,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'Today I cant it :(',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14,
                            color: Colors.black,
                            height: 1,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/map.jfif'),
                    radius: 25.0,
                  ),
                ),
                SizedBox(width: 10.0),
                Container(
                  width: 290.0,
                  height: 50.0,
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
                    color: Colors.grey[100],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 10.0),
                        Row(
                          children: [
                            Text(
                              'João',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                color: Colors.black,
                                height: 1,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 225.0),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.black,
                              size: 12,
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Text(
                          'It is fine!',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 14,
                            color: Colors.black,
                            height: 1,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
