import 'package:flutter/material.dart';
import 'landlordEvaluate.dart';
import 'landlordHomeScreen.dart';

//Joao
class LandlordEvaluatePage2 extends StatefulWidget {
  LandlordEvaluatePage2({Key? key}) : super(key: key);

  @override
  _LandlordEvaluatePage2State createState() => _LandlordEvaluatePage2State();
}

final textController_1 = TextEditingController();

class _LandlordEvaluatePage2State extends State<LandlordEvaluatePage2> {
  bool _star1 = false;
  bool _star2 = false;
  bool _star3 = false;
  bool _star4 = false;
  bool _star5 = false;

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
                  ), onPressed: () {
                clearText();
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
                  ), onPressed: () {}),
            ],
          ),
        ),
      ),
      body:
      SingleChildScrollView(
        child: Padding(
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
              Divider(
                height: 20.0,
                color: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/joao.jpg'),
                          radius: 55.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'João',
                        style: TextStyle(
                          fontFamily: 'Arial',
                          fontSize: 18,
                          color: Colors.black,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 8,)
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
              SizedBox(height: 8.0),
              Center(
                child: Container(
                  width: 350.0,
                  height: 180.0,
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
                        SizedBox(height: 5.0),
                        Center(
                          child: Container(
                            width: 300.0,
                            height: 43.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              color: Colors.grey[400],
                            ),
                            padding: new EdgeInsets.all(6.0),
                            child: new Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(child: TextField(
                                  controller: textController_1,
                                  decoration: InputDecoration(
                                      hintText: "Insert description"
                                  ),
                                )),
                              ],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: (){
                              setState(() {
                                if(_star2 == true){
                                  _star1 = true;
                                } else if(_star2 == false && _star1 == true){
                                  _star1 = false;
                                } else if(_star2 == false && _star1 == false){
                                  _star1 = true;
                                }
                                _star2 = false;
                                _star3 = false;
                                _star4 = false;
                                _star5 = false;
                              });
                            },
                                icon: Icon(Icons.star,
                                  color: _star1 ? Colors.yellow : Colors.white,
                                  size: 32,)),
                            SizedBox(width: 10.0),
                            IconButton(onPressed: (){
                              setState(() {
                                if(_star3 == true){
                                  _star1 = true;
                                  _star2 = true;
                                } else if(_star3 == false && _star2 == true){
                                  _star1 = false;
                                  _star2 = false;
                                } else if(_star3 == false && _star2 == false){
                                  _star1 = true;
                                  _star2 = true;
                                }
                                _star3 = false;
                                _star4 = false;
                                _star5 = false;
                              });
                            },
                                icon: Icon(Icons.star,
                                  color: _star2 ? Colors.yellow: Colors.white,
                                  size: 32,)),
                            SizedBox(width: 10.0),
                            IconButton(onPressed: (){
                              setState(() {
                                if(_star4 == true){
                                  _star1 = true;
                                  _star2 = true;
                                  _star3 = true;
                                } else if(_star4 == false && _star3 == true){
                                  _star1 = false;
                                  _star2 = false;
                                  _star3 = false;
                                } else if(_star4 == false && _star3 == false){
                                  _star1 = true;
                                  _star2 = true;
                                  _star3 = true;
                                }
                                _star4 = false;
                                _star5 = false;
                              });
                            },
                                icon: Icon(Icons.star,
                                  color: _star3 ? Colors.yellow: Colors.white,
                                  size: 32,)),
                            SizedBox(width: 10.0),
                            IconButton(onPressed: (){
                              setState(() {
                                if(_star5 == true){
                                  _star1 = true;
                                  _star2 = true;
                                  _star3 = true;
                                  _star4 = true;
                                } else if(_star5 == false && _star4 == true){
                                  _star1 = false;
                                  _star2 = false;
                                  _star3 = false;
                                  _star4 = false;
                                } else if(_star5 == false && _star4 == false){
                                  _star1 = true;
                                  _star2 = true;
                                  _star3 = true;
                                  _star4 = true;
                                }
                                _star5 = false;
                              });
                            },
                                icon: Icon(Icons.star,
                                  color: _star4 ? Colors.yellow: Colors.white,
                                  size: 32,)),
                            SizedBox(width: 10.0),
                            IconButton(onPressed: (){
                              setState(() {
                                if(_star5 == false){
                                  _star1 = true;
                                  _star2 = true;
                                  _star3 = true;
                                  _star4 = true;
                                  _star5 = true;
                                } else{
                                  _star1 = false;
                                  _star2 = false;
                                  _star3 = false;
                                  _star4 = false;
                                  _star5 = false;
                                }
                              });
                            },
                                icon: Icon(Icons.star,
                                  color: _star5 ? Colors.yellow: Colors.white,
                                  size: 32,)),
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
                                clearText();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LandlordEvaluate()),
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
                                if(checkTextFieldEmptyOrNot()){
                                  clearText();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _buildPopupEvaluation(context),
                                  );
                                } else{
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _errorPopup(context),
                                  );
                                }
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
                        width: 110,
                        height: 110,
                        child: FloatingActionButton(
                          heroTag: null,
                          onPressed: () {

                          },
                          elevation: 0,
                          child: new ConstrainedBox(constraints: new BoxConstraints.expand(),
                            child: new CircleAvatar(backgroundImage: AssetImage('assets/carolina.jpeg'),
                            ),),),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.white,
                              elevation: 0
                          ),
                          onPressed: () {

                          },
                          child: Text('Carolina',
                            style: TextStyle(color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Arial',
                                height: 1),)
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        child: FloatingActionButton(
                          heroTag: null,
                          onPressed: () {

                          },
                          elevation: 0,
                          child: new ConstrainedBox(constraints: new BoxConstraints.expand(),
                            child: new CircleAvatar(backgroundImage: AssetImage('assets/marco.jpg'),
                            ),),),
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              onPrimary: Colors.white,
                              elevation: 0
                          ),
                          onPressed: () {

                          },
                          child: Text('Marco',
                            style: TextStyle(color: Colors.black,
                                fontSize: 18,
                                fontFamily: 'Arial',
                                height: 1),)
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

clearText(){
  textController_1.clear();
}

checkTextFieldEmptyOrNot(){
  String text1;
  text1 = textController_1.text;
  return text1 != '';
}

Widget _errorPopup(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    backgroundColor: Color(0xFF48ACBE),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(child: Icon(Icons.error, color: Colors.red[700], size: 100,)),
        SizedBox(height: 15,),
        Text(
          "You need to fill the information in order to submit.",
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
              Icons.highlight_remove,
              color: Colors.black,
              size: 25.0,
            ),
          ),
        ],
      ),
    ],
  );
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
              Icons.star,
              size: 20.0,
              color: Colors.yellow,
            ),
            SizedBox(width: 3.0),
            Icon(
              Icons.star,
              size: 30.0,
              color: Colors.yellow,
            ),
            SizedBox(width: 3.0),
            Icon(
              Icons.star,
              size: 20.0,
              color: Colors.yellow,
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Evaluation submited!",
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandlordEvaluate()),
                    );
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
