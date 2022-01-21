import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordEvaluateTasks.dart';
import 'carlosProfileLandlord.dart';
import 'landlordSuggestedTask.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//FALTA DAR GUARDAR NA BD

class House{
  String name;
  bool? value = false;

  House({required this.name});
}

class Tenant{
  String name;
  String imagePath;
  bool? value = false;

  Tenant({required this.name, required this.imagePath});
}

class addTenant extends StatefulWidget {
  const addTenant({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<addTenant> {

  CollectionReference profiles = FirebaseFirestore.instance.collection('profile');
  CollectionReference houses = FirebaseFirestore.instance.collection('house');

  List<Tenant> tenants = [];
  List<House> nameHouses = [];
  List<String> imageTenants = [];

  Widget templateT(tt) {
    return Card(
      margin: const EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Align(
                alignment: const Alignment(-1.1, 0.0),
                child:Padding(
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
              const SizedBox(height: 50.0),
              Text(
                tt.name,
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center,
              ),
              Padding(
               padding: const EdgeInsets.only(left: 40),
                  child:  CircleAvatar(
                    backgroundImage: AssetImage(tt.imagePath),
                    radius: 20.0,
                  ),),
            ],
          )
           ] ),
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
                        child:Text(
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
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFF48ACBE),
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
                  ), onPressed: () {}
              ),
              IconButton(icon: const Icon(
                Icons.star_border,
                size: 35.0,
              ), onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EvaluateTasks()),
                );
              }),
              IconButton(
                  icon: const Icon(
                    Icons.cleaning_services_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {

                  }
              ),
              IconButton(
                  icon: const Icon(
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
                      MaterialPageRoute(builder: (context) => const CarlosProfileLandlord()),
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
                      builder: (BuildContext context) => _buildPopupNotification(context),
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
                    FutureBuilder<QuerySnapshot>(
                      future: profiles.get(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Something went wrong");
                        }
                        if (snapshot.hasData) {
                          for (var e in snapshot.data!.docs) {
                              if (e['role'] == "tenant") {
                                Tenant t = Tenant(name:e['name'], imagePath: e['image']);
                                if(!(tenants.any((item) => item.name == t.name))){
                                    tenants.add(t);
                            }
                          }}
                        }
                        return const Text("");
                      }), for (var i in tenants) templateT(i),],
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
                  FutureBuilder<QuerySnapshot>(
                      future: houses.get(),
                      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Something went wrong");
                        }
                        if (snapshot.hasData) {
                          for (var e in snapshot.data!.docs) {
                            House h = House(name:e['name']);
                            if(!(nameHouses.any((item) => item.name == h.name))){
                              nameHouses.add(h);
                            }

                          }}

                        return const Text("");
                        }
                      ), for (var i in nameHouses) templateH(i),
              ],
            )]),
            const SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) => _buildPopupConfirmation(context),
                    );
                  },
                  child:const Icon(Icons.person_add_alt_1 ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _buildPopupConfirmation(BuildContext context) {
  return AlertDialog(
    alignment: Alignment.center,
    title: const Text(
      'Add Tenant(s)',
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
          "Are you sure you want to add this tenant(s) to the house(s)?",
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
                  textColor: Theme.of(context).primaryColor,
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
                  onPressed: () {},
                  textColor: Theme.of(context).primaryColor,
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



Widget _buildPopupNotification(BuildContext context) {
  return AlertDialog(
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
    backgroundColor: const Color(0xFF48ACBE),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          "  - João completed a task, rate him now.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        const SizedBox(height: 20.0),
        const Text(
          "  - Carolina has sent you a message.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        const SizedBox(height: 20.0),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20, fontFamily: 'Arial', color: Colors.black),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SuggestedTask()),
            );

          },
          child: const Text('- Francisca suggested a task for Alameda T2.',
              style: TextStyle(fontFamily: 'Arial',
                fontSize: 20,
                color: Colors.black,
                height: 1,)),
        ),
      ],
    ),
    actions: <Widget>[
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FlatButton(
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

