import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantTasks.dart';
import 'tenantEvaluateMain.dart';
import 'tenantCarlosProfile.dart';


class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {

  int butNumber = 0;

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
                              builder: (BuildContext context) =>
                                  _buildPopupNotification(context),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Divider(
                    height: 30.0,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 310.0, 15.0),
                    child: Text(
                      'Map',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        height: 420.0,
                        width: 350.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/mapHouses.png'),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(9.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1.5,
                              blurRadius: 1.5,
                              offset: Offset(0, 3),
                            )
                          ]
                        ),
                      ),
                      buildPaddingRentValue(50.0, 50.0, 0.0, 0.0, '390€'),
                      buildPadding(40.0, 60.0, 0.0, 0.0, 1),
                      buildPaddingRentValue(100.0, 150.0, 0.0, 0.0, '500€'),
                      buildPadding(90.0, 160.0, 0.0, 0.0, 2),
                      buildPaddingRentValue(150.0, 160.0, 0.0, 0.0, '440€'),
                      buildPadding(140.0, 170.0, 0.0, 15.0, 3),
                      buildPaddingRentValue(299.0, 160.0, 0.0, 0.0, '510€'),
                      buildPadding(289.0, 170.0, 0.0, 0.0, 4),
                      buildPaddingRentValue(190.0, 281.0, 0.0, 0.0, '345€'),
                      buildPadding(180.0, 291.0, 0.0, 0.0, 5),

                    ]
                  ),
                ]
            )
        )
    );
  }

  Padding buildPaddingRentValue(double val1, double val2, double val3, double val4, String price) {
    return Padding(
      padding: EdgeInsets.fromLTRB(val1, val2, val3, val4),
      child: Container(
        width: 34.0,
        height: 15.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: Color(0xFF9ED3DD),
        ),
        child: Center(
          child: Text(
            price,
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Padding buildPadding(double val1, double val2, double val3, double val4, int numberButton) {
    return Padding(
      padding: EdgeInsets.fromLTRB(val1, val2, val3, val4),
      child: IconButton(
          onPressed: (){
            setState(() {
              butNumber = numberButton;
            });
          },
          icon: Icon(
            Icons.location_on,
            color: (butNumber == numberButton) ? Color(0xFF48ACBE) :  Color(0xFF9ED3DD),
            size: 40.0,
          )
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
