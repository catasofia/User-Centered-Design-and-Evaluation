import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordContacts.dart';
import 'package:time_app/landlord/landlordEvaluateTasks.dart';
import 'package:time_app/landlord/landlordHomeScreen.dart';
import 'package:time_app/landlord/landlordTasks.dart';
import 'package:time_app/landlord/profileLandlord.dart';
import 'landlordSuggestedTask.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class House{
  String name;
  bool? value = false;
  String id;
  House({required this.name, required this.id});
}

class Neighbor{
  String name;
  String imagePath;
  bool? value = false;

  Neighbor({required this.name, required this.imagePath});
}

class addNeighbor extends StatefulWidget {
  const addNeighbor({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<addNeighbor> {

  List<Neighbor> neighbors = [];
  List<House> houses = [];
  CollectionReference house = FirebaseFirestore.instance.collection('house');

  Future<void> getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection(
        'house').get();

    snapshot.docs.forEach((doc) {
      House house1 = House(name: doc['name'], id: doc.id);
      bool aux = true;

      houses.forEach((element) {
        if (element.name == doc['name']) {
          aux = false;
        }
      });
      if (aux) {
        houses.add(house1);
      }
    });

    QuerySnapshot snapshot1 = await FirebaseFirestore.instance.collection(
        'profile').get();

    snapshot1.docs.forEach((doc) {
      if (doc['role'] == 'neighbor') {
        Neighbor neighbor = Neighbor(name: doc['name'], imagePath: doc['image']);
        bool aux = true;

        neighbors.forEach((element) {
          if (element.name == doc['name']) {
            aux = false;
          }
        });
        if (aux) {
          neighbors.add(neighbor);
        }
      }
    });

    setState(() {});
  }

  bool check() {
    bool t = false;

    neighbors.forEach((element) {
      if (element.value == true) {
        t = true;
      }
    });

    bool h = false;

    houses.forEach((element) {
      if (element.value == true) {
        h = true;
      }
    });

    if (t == true && h == true) {
      return false;
    } else {
      return true;
    }
  }

  Future<void> add () async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('house').get();

    List<dynamic> nei = [];

    houses.forEach((element){
      nei = [];
      if (element.value == true){
        neighbors.forEach((neighbor) {
          if(neighbor.value == true){
            snapshot.docs.forEach((doc) {
              if (doc.id == element.id) {
                nei = doc['neighbors'];
                if (!nei.contains(neighbor.name)){
                  nei.add(neighbor.name);
                }
                FirebaseFirestore.instance.collection('house')
                    .doc(element.id)
                    .update({'neighbors': nei});
              }
            });
          }
        });
      }
    });
  }

  Widget templateT(tt) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      child: Column(
          children: <Widget>[
            Row(
              children: [
                Align(
                  alignment: const Alignment(-1.1, 0.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Checkbox(
                      value: tt.value,
                      activeColor: const Color(0xFF48ACBE),
                      onChanged: (bool? value) {
                        setState(() {
                          tt.value = value;
                        });
                      },
                    ),),),
                Padding(
                  padding: const EdgeInsets.only(left: 0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage(tt.imagePath),
                    radius: 20.0,
                  ),),
                const SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    tt.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      letterSpacing: 2.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ]),
    );
  }

  Widget templateH(tt) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: const Alignment(-1.1, 0.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Checkbox(
                      value: tt.value,
                      activeColor: const Color(0xFF48ACBE),
                      onChanged: (bool? value) {
                        setState(() {
                          tt.value = value;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    width: 287,
                    height: 50.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text(
                        tt.name,
                        style: const TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    getData();

    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF7FBECB),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  color: Colors.white,
                  icon: const Icon(
                    Icons.house_outlined,
                    size: 35.0,
                  ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomeLandlord()),
                );
              }
              ),
              IconButton(icon: const Icon(
                Icons.star_border,
                size: 35.0,
              ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EvaluateTasks()),
                );
              }),
              IconButton(
                  icon: const Icon(
                    Icons.cleaning_services_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TasksLandlord()),
                    );
                  }
              ),
              IconButton(
                  icon: const Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandlordContacts()),
                    );
                  }
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (
                            context) => const ProfileLandlord()),
                      );
                    },
                  ),
                  const SizedBox(width: 10.0),
                  Container(
                    width: 235.0,
                    height: 42.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const <Widget>[
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
                  const SizedBox(width: 8.0),
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
              const SizedBox(height: 20),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    for (var i in neighbors) templateT(i),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 235.0,
                    height: 42.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: const <Widget>[
                        SizedBox(width: 15.0),
                        Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        SizedBox(width: 10.0),
                        Text(
                          'Search house',
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
                ],
              ),

              Row(
                  children: <Widget>[
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        for (var i in houses) templateH(i),
                      ],
                    )
                  ]),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: !check() ? (BuildContext context) =>
                              _buildPopupConfirmation(context) : (
                              BuildContext context) => _buildPopupError(context)
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        primary: check() ? Colors.grey[400] : Colors.lightGreen),
                    child: const Icon(Icons.person_add_alt_1),
                  ),

                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:50.0),
                child: Row(
                  children: [
                    SizedBox(width: 20,),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: (){
                          Navigator.pop(
                            context,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),);
  }

  Widget _buildPopupConfirmation(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const Text(
        'Add Neighbor(s)',
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 30,
          color: Colors.black,
          height: 1,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: const Color(0xFF48ACBE),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            "Are you sure you want to add this neighbor(s) to the house(s)?",
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 100.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.5,
                    blurRadius: 1.5,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.redAccent,
              ),
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    textColor: Theme
                        .of(context)
                        .primaryColor,
                    child: const Text(
                      'Cancel',
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
            Container(
              width: 100.0,
              height: 30.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1.5,
                    blurRadius: 1.5,
                    offset: const Offset(0, 3),
                  ),
                ],
                color: Colors.lightGreen,
              ),
              padding: const EdgeInsets.only(top: 6.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    onPressed: () {
                      add();
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const HomeLandlord()));
                    },
                    textColor: Theme
                        .of(context)
                        .primaryColor,
                    child: const Text(
                      'Add',
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

  Widget _buildPopupError(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const Text(
        'Add Neighbor(s)',
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 30,
          color: Colors.black,
          height: 1,
        ),
        textAlign: TextAlign.center,
      ),
      backgroundColor: const Color(0xFF48ACBE),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text(
            "You have to select at least one neighbor and one house",
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              color: Colors.black,
              height: 1,
            ),
          ),

        ],
      ),
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
            "  - You have a new suggested task.",
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              color: Colors.black,
              height: 1,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            "  - Task completed, you can evaluate it now.",
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
}
