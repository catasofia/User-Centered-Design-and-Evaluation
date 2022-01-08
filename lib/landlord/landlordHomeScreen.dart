import 'package:flutter/material.dart';
import 'landlordEvaluate.dart';

class House{
  String name;
  String description;

  House({required this.name, required this.description});
}

class HomeLandlord extends StatefulWidget {
  const HomeLandlord({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeLandlord> {

  List<House> houses= [
    House(name: 'Alameda T2', description: 'T2 apartment with great location in apartment with individual rooms.'),
    House(name: 'Saldanha T3', description: 'T3 apartment with a lot of space and shared rooms.'),
  ];

  @override
  Widget template(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      color: Color(0xFF9ED3DD),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            new Align(
              alignment: new Alignment(-1.1, 0.0),
              child: Container(
                width: 400.0,
                height: 28.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  border: Border.all(
                    color: Color(0xFF006D77),
                    width: 2,
                  ),
                ),
                child: Text(
                  tt.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
                tt.description,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                )
            ),
          ],
        ),
      ),
    );
  }

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
                  color: Colors.white,
                  icon: Icon(
                    Icons.house_outlined,
                    size: 35.0,
                  ), onPressed: () {}
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
                Icon(
                  Icons.person_outline,
                  color: Colors.black,
                  size: 40.0,
                ),
                SizedBox(width: 15.0),
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
              'Welcome Home, Carlos!',
              style: TextStyle(
                color: Color(0xFF48ACBE),
                letterSpacing: 2.0,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 25.0,
              color: Colors.white,
            ),
            Text(
              'Your Houses',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Divider(
              height: 15.0,
              color: Colors.white,
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                for (var i in houses) template(i),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: Icon(Icons.add, color: Colors.black),
        backgroundColor: Color(0xFF48ACBE),
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
