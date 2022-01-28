import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'tenantTasks.dart';
import 'tenantHomescreen.dart';
import 'tenantEvaluateMain.dart';


class House{
  String name;
  List tenants= [];
  String landlord= "";

  House({required this.name, required this.tenants, required this.landlord});
}

class Tenant{
  String name;
  String image;

  Tenant({required this.name, required this.image});
}

class Landlord{
  String name;
  String image;

  Landlord({required this.name, required this.image});
}

class Evaluate extends StatefulWidget {
  const Evaluate({Key? key}) : super(key: key);

  @override
  _EvaluateState createState() => _EvaluateState();
}

class _EvaluateState extends State<Evaluate> {

  final _description = TextEditingController();

  bool _star1 = false;
  bool _star2 = false;
  bool _star3 = false;
  bool _star4 = false;
  bool _star5 = false;


  House housea = House(
      name: "",
      tenants: [],
      landlord: "");

  String houseid = "ZoMPtra4WxTnMwVAihIz";
  List<Tenant> tenants = [];
  Landlord landlord = Landlord(name: "Carlos Silva", image: "assets/carlos.jfif");

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('house').get();

    snapshot.docs.forEach((doc) {
      if (doc.id == houseid) {
        House house1 = House(
            name: doc['name'],
            tenants: doc['tenants'],
            landlord: doc['landlord']);
        housea = house1;
      }});

    QuerySnapshot snapshot1 = await FirebaseFirestore.instance.collection('profile').get();

    if (tenants.isNotEmpty){
      tenants = [];
    }

    snapshot1.docs.forEach((doc) {
      housea.tenants.forEach((element) {
        if (doc['name'] == element) {
          Tenant tenant = Tenant(name: doc['name'], image: doc['image']);
          tenants.add(tenant);
        }});
      if(doc['name'] == housea.landlord){
        Landlord landlorda = Landlord(name: doc['name'], image: doc['image']);
        landlord = landlorda;
      }
    });
    setState((){});
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _description.dispose();
    super.dispose();
  }
  Widget profiles(p){
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 6.0, 8.0, 8.0),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  child: CircleAvatar(
                    radius: 49.0,
                    backgroundColor: Colors.black54,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(p.image),
                      radius: 45.0,
                    ),
                  )
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildText(p.name),
            ],
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF7FBECB),
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
                color: Colors.white,
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
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Task()),
                    );
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
      body: SingleChildScrollView(
        child: Padding(
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
            SizedBox(height: 15.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                        child: CircleAvatar(
                          radius: 49.0,
                          backgroundColor: Colors.black54,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(landlord.image),
                            radius: 45.0,
                          ),
                        )
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      landlord.name,
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
            Padding(
              padding: const EdgeInsets.fromLTRB(0,4,0,0),
              child: Center(
                child: ElevatedButton(
                  child: Text(
                    'See profile',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      height: 1,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary:  Color(0xFF48ACBE),
                    shape: RoundedRectangleBorder( //to set border radius to button
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                  onPressed: () {
                  },
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0,0,0,7),
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
                            ElevatedButton(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  height: 1,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                                shape: RoundedRectangleBorder( //to set border radius to button
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => EvaluateMain()),
                                );
                              },
                            ),
                            ElevatedButton(
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                  height: 1,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: !_star1 ? Colors.grey[400] : Colors.lightGreen
                                ,
                                shape: RoundedRectangleBorder( //to set border radius to button
                                    borderRadius: BorderRadius.circular(10)
                                ),
                              ),
                              onPressed: () {
                                if(_star1 && !_star2 && !_star3 && !_star4 && !_star5){
                                  FirebaseFirestore.instance.collection('profile').doc("NzP8xVGu1fOcqTWb4JNt").update({'rating': 1});
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _buildPopupEvaluation2(context),
                                  );
                                }
                                else if(_star1 && _star2 && !_star3 && !_star4 && !_star5){
                                  FirebaseFirestore.instance.collection('profile').doc("NzP8xVGu1fOcqTWb4JNt").update({'rating': 2});
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _buildPopupEvaluation2(context),
                                  );
                                }
                                else if(_star1 && _star2 && _star3 && !_star4 && !_star5){
                                  FirebaseFirestore.instance.collection('profile').doc("NzP8xVGu1fOcqTWb4JNt").update({'rating': 3});
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _buildPopupEvaluation2(context),
                                  );
                                }
                                else if(_star1 && _star2 && _star3 && _star4 && !_star5){
                                  FirebaseFirestore.instance.collection('profile').doc("NzP8xVGu1fOcqTWb4JNt").update({'rating': 4});
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _buildPopupEvaluation2(context),
                                  );
                                }
                                else if(_star1 && _star2 && _star3 && _star4 && _star5){
                                  FirebaseFirestore.instance.collection('profile').doc("NzP8xVGu1fOcqTWb4JNt").update({'rating': 5});
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) => _buildPopupEvaluation2(context),
                                  );
                                }
                                else{
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => _buildPopupEvaluation(context),
                                );}
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:[
                        for (var i in tenants) profiles(i)
                      ]
                  ),
                )
            ),
          ],
        ),
      ),
      ),
    );
  }
  Text buildText(String name) {
    return Text(name, style: TextStyle(
      fontSize: 18.0,
      color: Colors.black,
      letterSpacing: 2.0,
    ),);
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
          "- Carlos sent you a message.",
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


Widget _buildPopupEvaluation2(BuildContext context) {
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
                      MaterialPageRoute(builder: (context) => EvaluateMain()),
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

