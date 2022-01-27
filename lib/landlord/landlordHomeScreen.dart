import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordContacts.dart';
import 'package:time_app/landlord/landlordEvaluateTasks.dart';
import 'package:time_app/landlord/profileLandlord.dart';
import 'landlordAddHouse.dart';
import 'landlordAlameda.dart';
import 'landlordEvaluate.dart';
import 'landlordSeeHouse.dart';
import 'landlordSuggestedTask.dart';
import 'landlordTasks.dart';

//RATES

class House{
  String name;
  String description;
  String id;
  List aux = [];
  List<Tenant> tenants= [];

  House({required this.name, required this.description, required this.id, required this.aux});
}

class Tenant{
  String name;
  String image;

  Tenant({required this.name, required this.image});
}


class HomeLandlord extends StatefulWidget {
  const HomeLandlord({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeLandlord> {

  List<House> houses= [];

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('house').get();

    if (houses.isNotEmpty){
      houses = [];
    }

    snapshot.docs.forEach((doc) {
      House house1 = House(description: doc['description'],
          name: doc['name'],
          aux: doc['tenants'],
          id: doc.id);
      houses.add(house1);
    });

    for(var i = 0; i < houses.length; i++){
      QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('profile').get();

      if (houses[i].tenants.isNotEmpty){
        houses[i].tenants = [];
      }

      snapshot.docs.forEach((doc) {
        houses[i].aux.forEach((element) {
          if (doc['name'] == element) {
            Tenant tenant = Tenant(name: doc['name'], image: doc['image']);
            houses[i].tenants.add(tenant);
          }});
      });
    }

    setState((){});
  }


  Widget tenants(p){
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child:Column(
      children: [
        Container(
          child: CircleAvatar(
          backgroundImage: AssetImage(p.image),
          radius: 20.0,
          ),
          ),
        SizedBox(height: 10.0),
        Text(
          p.name,
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 14,
            color: Colors.black,
            height: 1,
          ),
        ),
      ],
    ),
    );
  }

  @override
  Widget template(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 12.0),
      color: Color(0xFF48ACBE),
      child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LandlordSeeHouse(id:tt.id)),
        );
      },
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
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    tt.description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                  children: <Widget>[
                    SizedBox(width: 50.0),
                    Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           for(var i in tt.tenants)tenants(i)]
                          ,
                        )
                        ],
                    ),
                    SizedBox(width: 50.0),

                      ],
                    ),
                ),
                ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "4.7 ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    WidgetSpan(
                      child: Icon(Icons.star_border, size: 16),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    getData();

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TasksLandlord()),
                    );
                  }
              ),
              IconButton(
                  icon: Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 30.0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LandlordContacts()),
                    );
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
                  IconButton(
                    icon: const Icon(
                      Icons.person_outline,
                      color: Colors.black,
                      size: 40.0,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfileLandlord()),
                      );
                    },
                  ),
                  SizedBox(width: 10.0),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Welcome Home, Carlos!',
                  style: TextStyle(
                    color: Color(0xFF48ACBE),
                    letterSpacing: 2.0,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                child: Text(
                  'Your Houses',
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 2.0,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      for (var i in houses) template(i)
                    ]
                ),
              ),
            ],
          ),
        ),
      ),
     /*  */
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => _buildPopupAdd(context),
          );
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
          "  - João completed a task, rate him now.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "  - Carolina has sent you a message.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20, fontFamily: 'Arial', color: Colors.black),
          ),
          onPressed: () { /*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuggestedTask()),
            );*/

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

Widget _buildPopupAdd(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    title: const Text(
      'Add',
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
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 40,
            width: 150,
            child: TextButton(
              child: Text('House'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.cyan[100],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddHouse()),
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 40,
            width: 150,
            child: TextButton(
              child: Text('Tenant'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.cyan[100],
              ),
              onPressed: () {
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: SizedBox(
            height: 40,
            width: 150,
            child: TextButton(
              child: Text('Neighbor'),
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.cyan[100],
              ),
              onPressed: () {
              },
            ),
          ),
        ),
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
    ),
  );
}
