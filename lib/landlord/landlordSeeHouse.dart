import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LandlordSeeHouse extends StatefulWidget {
  const LandlordSeeHouse({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<LandlordSeeHouse> {
  CollectionReference houses = FirebaseFirestore.instance.collection('house');
  CollectionReference profiles = FirebaseFirestore.instance.collection('profile');

  @override
  Widget template(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          new Align(
            alignment: new Alignment(-1.1, 0.0),
            child: Container(
              width: 400.0,
              height: 28.0,
              child: Text(
                tt[0],
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Future<DocumentSnapshot<Object?>>? house = houses.doc('ZoMPtra4WxTnMwVAihIz').get();
    Map<String, dynamic>  data = {};
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
                    },
                  ),
                ],
              ),
              Divider(
                height: 40.0,
                color: Colors.white,
              ),
              FutureBuilder<DocumentSnapshot>(
                future: house,
                builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                  if (snapshot.hasError) {
                    data = {};
                    return Text("Something went wrong");
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    data = {};
                    return Text("Document does not exist");
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    data = snapshot.data!.data() as Map<String, dynamic>;
                    return Text(data['name'],
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 2.0,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,));
                  }
                  data = {};
                  return Text("loading");
                },
              ),
              /*return ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: snapshot.data!.docs.map((house){
                      return Center(
                          child: Text(house['name']),
                          );
                    }).toList(),
                  );
                }
            ),*/
              Divider(
                height: 25.0,
                color: Colors.white,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tenants',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ButtonTheme(
                      height: 30,
                      child: OutlineButton(onPressed: (){},
                          shape: new CircleBorder(),
                          borderSide: BorderSide(color: Color(0xFF48ACBE)),
                          child:Icon(Icons.add,
                              color: Color(0xFF48ACBE))
                      ),
                    ),
                  ]
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FutureBuilder<DocumentSnapshot>(
                      future: house,
                      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                        if (snapshot.hasError) {
                          data = {};
                          return Text("Something went wrong");
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          data = {};
                          return Text("Document does not exist");
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          data = snapshot.data!.data() as Map<String, dynamic>;
                          List<dynamic> nameTenants = data['tenants'];
                          Function eq = const ListEquality().equals;
                          if (!eq(nameTenants, [""])) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                itemCount: nameTenants.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black26, width: 2),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Colors.blueGrey[100],
                                      ),
                                      child: Center(child: Text('${nameTenants[index]}', style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        letterSpacing: 2.0,
                                      ),)),
                                    ),
                                  );
                                }
                            );
                          }
                        }
                        data = {};
                        return Text("No tenants yet.", style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          letterSpacing: 2.0,
                        ),);
                      },
                    ),
                    //for (var i in tenants) template(i),
                  ],
                ),
              ),
              Divider(
                height: 20.0,
                color: Colors.white,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Neighbors',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ButtonTheme(
                      height: 30,
                      child: OutlineButton(onPressed: (){},
                          shape: new CircleBorder(),
                          borderSide: BorderSide(color: Color(0xFF48ACBE)),
                          child:Icon(Icons.add,
                              color: Color(0xFF48ACBE))
                      ),
                    ),
                  ]
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FutureBuilder<DocumentSnapshot>(
                      future: house,
                      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                        if (snapshot.hasError) {
                          data = {};
                          return Text("Something went wrong");
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          data = {};
                          return Text("Document does not exist");
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          data = snapshot.data!.data() as Map<String, dynamic>;
                          List<dynamic> nameNeighbors = data['neighbors'];
                          Function eq = const ListEquality().equals;
                          if (!eq(nameNeighbors, [""])) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                itemCount: nameNeighbors.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black26, width: 2),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Colors.blueGrey[100],
                                      ),
                                      child: Center(child: Text('${nameNeighbors[index]}', style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        letterSpacing: 2.0,
                                      ),)),
                                    ),
                                  );
                                }
                            );
                          }
                        }
                        data = {};
                        return Text("No neighbors yet.", style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          letterSpacing: 2.0,
                        ),);
                      },
                    ),
                    //for (var i in neighbors) template(i),
                  ],
                ),
              ),
              Divider(
                height: 20.0,
                color: Colors.white,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tasks',
                      style: TextStyle(
                        color: Colors.black,
                        letterSpacing: 2.0,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ButtonTheme(
                      height: 30,
                      child: OutlineButton(onPressed: (){},
                          shape: new CircleBorder(),
                          borderSide: BorderSide(color: Color(0xFF48ACBE)),
                          child:Icon(Icons.add,
                              color: Color(0xFF48ACBE))
                      ),
                    ),
                  ]
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FutureBuilder<DocumentSnapshot>(
                      future: house,
                      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

                        if (snapshot.hasError) {
                          data = {};
                          return Text("Something went wrong");
                        }

                        if (snapshot.hasData && !snapshot.data!.exists) {
                          data = {};
                          return Text("Document does not exist");
                        }

                        if (snapshot.connectionState == ConnectionState.done) {
                          data = snapshot.data!.data() as Map<String, dynamic>;
                          List<dynamic> nameTasks = data['tasks'];
                          Function eq = const ListEquality().equals;
                          if (!eq(nameTasks, [""])) {
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(8),
                                itemCount: nameTasks.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      height: 50,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black26, width: 2),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: Colors.blueGrey[100],
                                      ),
                                      child: Center(child: Text('${nameTasks[index]}', style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black,
                                        letterSpacing: 2.0,
                                      ),)),
                                    ),
                                  );
                                }
                            );
                          }
                        }
                        data = {};
                        return Text("No tasks yet.", style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          letterSpacing: 2.0,
                        ),);
                      },
                    ),
                    //for (var i in neighbors) template(i),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
