import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordEvaluatePage1.dart';
import 'package:time_app/landlord/landlordEvaluatePage2.dart';
import 'package:time_app/landlord/landlordEvaluatePage3.dart';
import 'landlordHomeScreen.dart';

class LandlordEvaluate extends StatefulWidget {
  const LandlordEvaluate({Key? key}) : super(key: key);

  @override
  _EvaluateState createState() => _EvaluateState();
}

class _EvaluateState extends State<LandlordEvaluate> {

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
                    MaterialPageRoute(builder: (context) => HomeLandlord()),
                  );
                },
              ),
              IconButton(
                color: Colors.white,
                  icon: Icon(
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
            SizedBox(height: 15.0),
            Row(
              children: <Widget>[
                SizedBox(width: 20.0),
                Column(
                  children: [
                    Container(
                        child: Material(
                            color: Colors.blue,
                            elevation: 8,
                            shape: CircleBorder(),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                                splashColor: Colors.white70,
                                onTap: () {
                                  Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LandlordEvaluatePage1()),
                                );},
                                child: Ink.image(
                                    image: AssetImage('assets/carolina.jpeg'), height: 130.0, width: 130.0, fit: BoxFit.cover)
                            )
                        )
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Carolina',
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
                        child: Material(
                            color: Colors.blue,
                            elevation: 8,
                            shape: CircleBorder(),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: InkWell(
                                splashColor: Colors.white70,
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LandlordEvaluatePage2()),
                                  );
                                },
                                child: Ink.image(
                                    image: AssetImage('assets/joao.jpg'), height: 130.0, width: 130.0, fit: BoxFit.cover)
                            )
                        )
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'João',
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
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 200.0, 0.0, 0.0),
                  child: SizedBox(width: 20.0),
                ),
                Column(
                  children: [
                    Container(
                      child: Material(
                        color: Colors.blue,
                        elevation: 8,
                        shape: CircleBorder(),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.white70,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LandlordEvaluatePage3()),
                            );
                          },
                          child: Ink.image(
                            image: AssetImage('assets/marco.jpg'), height: 130.0, width: 130.0, fit: BoxFit.cover)
                        )
                      )
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
          "- Vasco is interested in your apartment in Chiado.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "- Carolina has sent you a message.",
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
