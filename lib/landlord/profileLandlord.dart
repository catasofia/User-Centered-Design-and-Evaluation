import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileLandlord extends StatefulWidget {
  const ProfileLandlord({Key? key}) : super(key: key);

  @override
  _LandlordProfileState createState() => _LandlordProfileState();
}

class _LandlordProfileState extends State<ProfileLandlord> {
  String name = "";
  int age = 0;
  String gender = "";
  String image = "";
  String role = "";

  Future<void> getProfile() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('profile').get();

    snapshot.docs.forEach((doc) {
      if (doc['name'] == "Carlos Silva") {
        name = doc['name'];
        age = doc['age'];
        gender = doc['gender'];
        image = doc['image'];
        role = doc['role'];
      }});
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getProfile();

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  ), onPressed: () {}
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(onPressed: () {
                },
                    icon: Icon(Icons.person_outline,
                      color: Colors.black,
                      size: 38,)
                ),
                SizedBox(width: 8.0),
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
                      SizedBox(width: 8.0),
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
                SizedBox(width: 7.0),
                IconButton(onPressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildPopupNotification(context),
                  );
                },
                    icon: Icon(Icons.notifications_active_outlined,
                      color: Colors.black,
                      size: 38,)),
              ],
            ),
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/carlos.jfif'),
                        radius: 55.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      name,
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
                            '4.54',
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
            SizedBox(height: 30),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  RaisedButton(onPressed: (){},
                    padding: EdgeInsets.only(top:14.0, bottom:14.0, left:10.0, right: 10.0),
                    child: Text('Logout',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                    color: Color(0xFF48ACBE),),
            ]),
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
          "- Maria completed a task, rate her now.",
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
