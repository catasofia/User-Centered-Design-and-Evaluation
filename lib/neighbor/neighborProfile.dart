import 'package:flutter/material.dart';
import 'neighborHomeScreen.dart';
import '../signInOrUp.dart';

class NeighborProfile extends StatefulWidget {
  const NeighborProfile({Key? key}) : super(key: key);

  @override
  _NeighborProfileState createState() => _NeighborProfileState();
}

class _NeighborProfileState extends State<NeighborProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
            child: Row(
            children: <Widget>[
                IconButton(onPressed: () {},
                  icon: Icon(Icons.person_outline,
                    color: Colors.black,
                    size: 38,)),
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
          ),
            Divider(
              height: 40.0,
              color: Colors.white,
            ),
            Column(
              children: [
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 135,),
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/francisca.jpg'),
                        radius: 65.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0),
                Container(
                  width: 270,
                  height: 140,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                    ),
                    color: Colors.grey[100],
                    elevation: 5,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 25,),
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Text('Info:',
                              style: TextStyle(color: Color(0xFF48ACBE),
                              fontSize: 20),),
                            SizedBox(width: 60,),
                            Text('Francisca Mota\nFemale, 27',
                              style: TextStyle(color: Color(0xFF7AC8D7),
                              fontSize: 18),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Row(
                          children: [
                            SizedBox(width: 20,),
                            Text('Role:',
                              style: TextStyle(color: Color(0xFF48ACBE),
                              fontSize: 20),),
                            SizedBox(width: 56,),
                            Text('Neighbor',
                              style: TextStyle(color: Color(0xFF7AC8D7),
                              fontSize: 18),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 90,),
                Container(
                  width: 175,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFF58868E)
                      ),
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Signs()),
                        );
                      },
                      child: Text('Logout',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black
                      ),
                      )
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NeighborHome()),
                          );
                        },
                      )
                    ),
                  ],
                )
              ],
            ),
          ]
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
          "- Maria completed a task, rate him now.",
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
