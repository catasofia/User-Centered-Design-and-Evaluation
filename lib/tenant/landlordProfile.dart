import 'package:flutter/material.dart';
import 'package:time_app/homeScreen.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantTasks.dart';
import '../signInOrUp.dart';
import 'tenantEvaluateMain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProfileL extends StatefulWidget {
  const ProfileL({Key? key}) : super(key: key);

  @override
  _ProfileLState createState() => _ProfileLState();
}

class _ProfileLState extends State<ProfileL> {
  CollectionReference tenantDB = FirebaseFirestore.instance.collection('profile');
  String image = "";
  String name = "";
  String gender = "";
  int age = 0;
  String role = "";
  int rating = 0;

  Future<void> getProfile() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('profile').get();

    snapshot.docs.forEach((doc) {
      if (doc['name'] == "Carlos Silva") {
        name = doc['name'];
        age = doc['age'];
        gender = doc['gender'];
        image = doc['image'];
        role = doc['role'];
        rating = doc['rating'];
      }});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    getProfile();

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
      body: Padding(
        padding: EdgeInsets.fromLTRB(1.0, 42.0, 0.0, 0.0),
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
                    SizedBox(width: 15.0),
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
              ),
              SizedBox(height: 20.0),
              Center(
                      child: CircleAvatar(
                        radius: 79.0,
                        backgroundColor: Colors.black54,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(image),
                          radius: 75.0,
                        ),
                      ),
                    ),
              SizedBox(height: 10.0),
              Center(
                child: Container(
                  width: 350.0,
                  height: 140.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1.5,
                        blurRadius: 1.5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: Colors.white70,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text(
                            'Info:',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: Color(0xFF48ACBE),
                              height: 1,
                            ),
                          ),
                          SizedBox(width: 50.0),
                          Text(
                            name + "\n" + gender + ", " + age.toString(),
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: Color(0xFF48ACBE),
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text(
                            'Role:',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: Color(0xFF48ACBE),
                              height: 1,
                            ),
                          ),
                          SizedBox(width: 45.0),
                          Text(
                            role,
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: Color(0xFF48ACBE),
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text(
                            'Rating:',
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: Color(0xFF48ACBE),
                              height: 1,
                            ),
                          ),
                          SizedBox(width: 30.0),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              fontFamily: 'Arial',
                              fontSize: 20,
                              color: Color(0xFF48ACBE),
                              height: 1,
                            ),
                          ),
                          Icon(
                            Icons.star_border,
                            color: Color(0xFF48ACBE),
                            size: 25.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100),
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
          "- Carlos sent you a message.",
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
