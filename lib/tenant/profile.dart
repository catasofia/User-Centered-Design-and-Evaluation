import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantTasks.dart';
import '../signInOrUp.dart';
import 'tenantEvaluateMain.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  CollectionReference tenantDB = FirebaseFirestore.instance.collection('profile');
  String image = "";
  String name = "";
  String gender = "";
  int age = 0;
  String role = "";
  double rating = 0;
  int totalDiscount = 0;

  Future<void> getProfile() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('profile').get();

    snapshot.docs.forEach((doc) {
      if (doc['name'] == "Carolina Oliveira") {
        name = doc['name'];
        age = doc['age'];
        gender = doc['gender'];
        image = doc['image'];
        role = doc['role'];
        rating = doc['rating'];
        totalDiscount = 0;
      }});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    getProfile();

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
              Container(
                width: 270,
                height: 180,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                  ),
                  color: Colors.grey[100],
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text('Info:',
                            style: TextStyle(color: Color(0xFF48ACBE),
                                fontSize: 20),),
                          SizedBox(width: 60,),
                          Text('$name\n$gender, $age',
                            style: TextStyle(color: Color(0xFF7AC8D7),
                                fontSize: 18),),
                        ],
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text('Role:',
                            style: TextStyle(color: Color(0xFF48ACBE),
                                fontSize: 20),),
                          SizedBox(width: 56,),
                          Text('$role',
                            style: TextStyle(color: Color(0xFF7AC8D7),
                                fontSize: 18),),
                        ],
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text('Rating:',
                            style: TextStyle(color: Color(0xFF48ACBE),
                                fontSize: 20),),
                          SizedBox(width: 40,),
                          Text('$rating',
                            style: TextStyle(color: Color(0xFF7AC8D7),
                                fontSize: 18),),
                        ],
                      ),
                      SizedBox(height: 12,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text('Total Discount:',
                            style: TextStyle(color: Color(0xFF48ACBE),
                                fontSize: 20),),
                          SizedBox(width: 40,),
                          Text('$totalDiscount €',
                            style: TextStyle(color: Color(0xFF7AC8D7),
                                fontSize: 18),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              RaisedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Signs()),
                  );
                },
                color: Color(0xFF58868E),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Text(
                    'Logout',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0
                    )
                ),
              )
            ]
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
