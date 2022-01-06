import 'package:flutter/material.dart';

class LandlordEvaluate1 extends StatefulWidget {
  const LandlordEvaluate1({Key? key}) : super(key: key);

  @override
  _LandlordEvaluateState createState() => _LandlordEvaluateState();
}

class _LandlordEvaluateState extends State<LandlordEvaluate1> {

  final _description = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                icon: Icon(
                  Icons.house_outlined,
                  size: 35.0,
                ),
                onPressed: () {
                },
              ),
              IconButton(icon: Icon(
                Icons.star_border,
                color: Colors.white,
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
                  color: Colors.black,
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

                  },
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/carolina.jpeg'),
                        radius: 55.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
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
              ],
            ),
            Center(
              child: Container(
                width: 100.0,
                height: 30.0,
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
                  color: Color(0xFF48ACBE),
                ),
                padding: new EdgeInsets.only(top: 6.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'See profile',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Center(
              child: Container(
                width: 350.0,
                height: 190.0,
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
                  color: Color(0xFF48ACBE),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Evaluate:',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 20,
                          color: Colors.black,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Leave a comment:',
                        ),
                        controller: _description,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            padding: const EdgeInsets.all(0.0),
                            icon: Icon(
                              Icons.star_border,
                              color: Colors.black,
                              size: 32.0,
                            ),
                            onPressed: () {
                            },
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(0.0),
                            icon: Icon(
                              Icons.star_border,
                              color: Colors.black,
                              size: 32.0,
                            ),
                            onPressed: () {

                            },
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(0.0),
                            icon: Icon(
                              Icons.star_border,
                              color: Colors.black,
                              size: 32.0,
                            ),
                            onPressed: () {

                            },
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(0.0),
                            icon: Icon(
                              Icons.star_border,
                              color: Colors.black,
                              size: 32.0,
                            ),
                            onPressed: () {

                            },
                          ),
                          IconButton(
                            padding: const EdgeInsets.all(0.0),
                            icon: Icon(
                              Icons.star_border,
                              color: Colors.black,
                              size: 32.0,
                            ),
                            onPressed: () {

                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RaisedButton(
                            child: Text(
                              'Cancel:',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                color: Colors.black,
                                height: 1,
                              ),
                            ),
                            color: Colors.redAccent,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildPopupEvaluation(context),
                              );
                            },
                          ),
                          RaisedButton(
                            child: Text(
                              'Submit:',
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 18,
                                color: Colors.black,
                                height: 1,
                              ),
                            ),
                            color: Colors.lightGreen,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => _buildPopupEvaluation(context),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/joao.jpg'),
                        radius: 45.0,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Joao',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 18,
                        color: Colors.black,
                        height: 1,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/marco.jpg'),
                        radius: 45.0,
                      ),
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

Widget _buildPopupEvaluation(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    backgroundColor: Color(0xFF48ACBE),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.warning_amber_outlined,
              size: 35.0,
              color: Colors.redAccent,
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You need to complete the\nevaluation first!",
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                color: Colors.black,
                height: 1,
              ),
            ),
          ],
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 90.0,
            height: 30.0,
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
              color: Colors.grey[300],
            ),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  textColor: Theme.of(context).primaryColor,
                  child: const Text(
                    'OK',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 15,
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
