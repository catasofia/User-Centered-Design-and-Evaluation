import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantTasks.dart';
import 'tenantEvaluateMain.dart';
import 'tenantCarlosProfile.dart';

bool _T1 = false;
bool _T2 = false;
bool _T3 = false;
bool _T4 = false;
bool _T0 = false;
int flag = 0;
int flag1 = 0;
int flag2 = 0;
int flag3 = 0;
int flag4 = 0;
RangeValues _currentRangeValues = const RangeValues(300, 500);


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
                      Padding(
                        padding: EdgeInsets.fromLTRB(315.0, 20.0, 0.0, 0.0),
                        child: SizedBox(
                          height:30,
                          width:30,
                          child:FloatingActionButton(
                            backgroundColor: Colors.white,
                            foregroundColor: Color(0xFF006D77),
                            onPressed: () {},
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0)
                            ),
                            child: Icon(Icons.search),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(315.0, 55.0, 0.0, 0.0),
                        child: SizedBox(
                          height:30,
                          width:30,
                          child:FloatingActionButton(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                            onPressed: () {},
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0)
                            ),
                            child: Icon(Icons.add),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(315.0, 86.0, 0.0, 0.0),
                        child: SizedBox(
                          height:30,
                          width:30,
                          child:FloatingActionButton(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.grey,
                            onPressed: () {},
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0)
                            ),
                            child: Icon(Icons.remove),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(315.0, 120.0, 0.0, 0.0),
                        child: SizedBox(
                          height:30,
                          width:30,
                          child:FloatingActionButton(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.red,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildPopupFilters(context),
                              );
                            },
                            shape: BeveledRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0)
                            ),
                            child: Icon(Icons.filter_alt),
                          ),
                        ),
                      ),
                      buildPaddingRentValue(50.0, 50.0, 0.0, 0.0, '390€', 1),
                      buildPadding(40.0, 60.0, 0.0, 0.0, '390€.\nRating: 4.12☆', 1, 'T2 near Alvalade'),
                      buildPaddingRentValue(100.0, 150.0, 0.0, 0.0, '500€', 2),
                      buildPadding(90.0, 160.0, 0.0, 0.0, '500€.\nRating: 4.77☆', 2, 'T3 in Av. Estados Unidos da América'),
                      buildPaddingRentValue(150.0, 160.0, 0.0, 0.0, '440€', 3),
                      buildPadding(140.0, 170.0, 0.0, 15.0, '440€.\nRating: 4.81☆', 3, 'T5 near Av. Estados Unidos da América'),
                      buildPaddingRentValue(299.0, 160.0, 0.0, 0.0, '510€', 4),
                      buildPadding(289.0, 170.0, 0.0, 0.0, '510€.\nRating: 4.33☆', 4,  'T3 in Av. de Roma'),
                      buildPaddingRentValue(190.0, 281.0, 0.0, 0.0, '345€', 5),
                      buildPadding(180.0, 291.0, 0.0, 0.0, '345€.\nRating: 4.20☆', 5,  'T4 near Entre Campos'),

                    ]
                  ),
                ]
            )
        )
    );
  }

  Padding buildPaddingRentValue(double val1, double val2, double val3, double val4, String price, int numberButton) {
    return Padding(
      padding: EdgeInsets.fromLTRB(val1, val2, val3, val4),
      child: Container(
        width: 34.0,
        height: 15.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: (butNumber == numberButton) ? Color(0xFF48ACBE) : Color(0xFF9ED3DD),
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

  Padding buildPadding(double val1, double val2, double val3, double val4, String price, int numberButton, String location) {
    return Padding(
      padding: EdgeInsets.fromLTRB(val1, val2, val3, val4),
      child: IconButton(
          onPressed: (){
            setState(() {
              butNumber = numberButton;
            });
            showDialog(
              context: context,
              builder: (BuildContext context) =>
                  MyAlertDialog(price: price, apartName: location),
            );
          },
          icon: Icon(
            Icons.location_on,
            color: (butNumber == numberButton) ? Color(0xFF48ACBE) : Color(0xFF9ED3DD),
            size: (butNumber == numberButton) ? 43.0 : 40.0,
          )
      ),
    );
  }
}

class MyAlertDialog extends StatelessWidget {
  String price;
  String apartName;

  MyAlertDialog({
    required this.price,
    required this.apartName
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color(0xFF48ACBE),
      title: Text(
          this.apartName + ' for ' + this.price
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

Widget _buildPopupFilters(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    title: const Text(
      'Filters',
      style: TextStyle(
        fontFamily: 'Arial',
        fontSize: 30,
        color: Colors.white,
        height: 1,
      ),
      textAlign: TextAlign.center,
    ),
    backgroundColor: Color(0xFF48ACBE),
    content: StatefulBuilder(
      builder: (BuildContext context, StateSetter setState) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "Price range",
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 24,
                color: Colors.black,
                height: 1,
              ),
            ),
            RangeSlider(
              activeColor: Colors.black,
              inactiveColor: Colors.grey,
              values: _currentRangeValues,
              max: 750,
              min: 200,
              divisions: 10,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            Text(
              "Number of rooms",
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 24,
                color: Colors.black,
                height: 1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        if(flag == 0){
                          _T0 = true;
                          flag = 1;
                        }
                        else if(flag == 1){
                          _T0 = false;
                          flag = 0;
                        }
                      });
                    },
                        icon: Icon(Icons.crop_square,
                          color: _T0 ? Colors.white : Colors.black,
                          size: 32,)),
                    Text(
                      "T0",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        if(flag1 == 0){
                          _T1 = true;
                          flag1 = 1;
                        }
                        else if(flag1 == 1){
                          _T1 = false;
                          flag1 = 0;
                        }
                      });
                    },
                        icon: Icon(Icons.crop_square,
                          color: _T1 ? Colors.white: Colors.black,
                          size: 32,)),
                    Text(
                      "T1",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        if(flag2 == 0){
                          _T2 = true;
                          flag2 = 1;
                        }
                        else if(flag2 == 1){
                          _T2 = false;
                          flag2 = 0;
                        }
                      });
                    },
                        icon: Icon(Icons.crop_square,
                          color: _T2 ? Colors.white: Colors.black,
                          size: 32,)),
                    Text(
                      "T2",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        if(flag3 == 0){
                          _T3 = true;
                          flag3 = 1;
                        }
                        else if(flag3 == 1){
                          _T3 = false;
                          flag3 = 0;
                        }
                      });
                    },
                        icon: Icon(Icons.crop_square,
                          color: _T3 ? Colors.white: Colors.black,
                          size: 32,)),
                    Text(
                      "T3",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10.0),
                Column(
                  children: [
                    IconButton(onPressed: (){
                      setState(() {
                        if(flag4 == 0){
                          _T4 = true;
                          flag4 = 1;
                        }
                        else if(flag4 == 1){
                          _T4 = false;
                          flag4 = 0;
                        }
                      });
                    },
                        icon: Icon(Icons.crop_square,
                          color: _T4 ? Colors.white: Colors.black,
                          size: 32,)),
                    Text(
                      "T4",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 88.0,
                  height: 25.0,
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
                    color: Color(0xFF006D77),
                  ),
                  child: new Row(
                    children: <Widget>[
                      new FlatButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Map()),
                          );
                        },
                        textColor: Theme.of(context).primaryColor,
                        child: const Text(
                          'close',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18,
                            color: Colors.black,
                            height: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );
      }
    ),
  );
}

