import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordHomeScreen.dart';
import 'package:time_app/landlord/landlordTasks.dart';
import 'package:time_app/landlord/profileLandlord.dart';

import 'landlordEvaluate.dart';
import 'landlordSuggestedTask.dart';

class LandlordContacts extends StatefulWidget {
  const LandlordContacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class Contact{
  String name;
  String image;

  Contact({required this.name, required this.image});
}

class _ContactsState extends State<LandlordContacts> {

  List<Contact> contacts = [];

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('house').get();

    List tenants = [];

    snapshot.docs.forEach((doc) {
      if (doc['landlord'] == "Carlos Silva") {
        doc['tenants'].forEach((ten){
          tenants.add(ten);
        });
      }});

    QuerySnapshot snapshot1 = await FirebaseFirestore.instance.collection('profile').get();

    if (contacts.isNotEmpty){
      contacts = [];
    }

    snapshot1.docs.forEach((doc) {
      tenants.forEach((element) {
        if (doc['name'] == element) {
          Contact contact = Contact(name: doc['name'], image: doc['image']);
          contacts.add(contact);
        }});
    });

    setState((){});
  }

  Widget template(tt){

    return  Padding(
      padding: EdgeInsets.only(right: 20.0),
      child:Column(
        children: [
        Container(
          child: CircleAvatar(
          backgroundImage: AssetImage(tt.image),
          radius: 65.0,
          ),
          ),
        SizedBox(height: 10.0),
        Text(
          tt.name,
          style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 18,
          color: Colors.black,
          height: 1,
          ),
        ),
        ],),
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
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeLandlord()),
                    );
                  },
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
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (var i in contacts) template(i)
                  ],
                ),),
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
                    backgroundImage: AssetImage('assets/carolina.jpeg'),
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
                              'Carolina Oliveira',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                color: Colors.black,
                                height: 1,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            SizedBox(width: 110.0),
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
                          'Yes!',
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

