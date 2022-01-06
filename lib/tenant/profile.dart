import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantTasks.dart';
import '../signInOrUp.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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
              SizedBox(height: 20.0),
              Center(
                child: CircleAvatar(
                  radius: 79.0,
                  backgroundColor: Colors.black54,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/carolina.jpeg'),
                    radius: 75.0,
                  ),
                ),
              ),
              SizedBox(height: 17.0),
              Container(
                width: 270,
                height: 165,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                  ),
                  color: Colors.grey[100],
                  elevation: 5,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 17,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text('Info:',
                            style: TextStyle(color: Color(0xFF48ACBE),
                                fontSize: 20),),
                          SizedBox(width: 60,),
                          Text('Carolina Oliveira\nFemale, 18',
                            style: TextStyle(color: Color(0xFF7AC8D7),
                                fontSize: 18),),
                        ],
                      ),
                      SizedBox(height: 17,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text('Role:',
                            style: TextStyle(color: Color(0xFF48ACBE),
                                fontSize: 20),),
                          SizedBox(width: 56,),
                          Text('Tenant',
                            style: TextStyle(color: Color(0xFF7AC8D7),
                                fontSize: 18),),
                        ],
                      ),
                      SizedBox(height: 17,),
                      Row(
                        children: [
                          SizedBox(width: 20,),
                          Text('Rating:',
                            style: TextStyle(color: Color(0xFF48ACBE),
                                fontSize: 20),),
                          SizedBox(width: 56,),
                          Text('4.87',
                            style: TextStyle(color: Color(0xFF7AC8D7),
                                fontSize: 18),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              RaisedButton(
                onPressed: (){},
                color: Color(0xFF48ACBE),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Text(
                    ' See  Landlord ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0
                    )
                ),
              ),
              RaisedButton(
                onPressed: (){},
                color: Color(0xFF48ACBE),
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3.0),
                ),
                child: Text(
                    'See Neighbors',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0
                    )
                ),
              ),
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