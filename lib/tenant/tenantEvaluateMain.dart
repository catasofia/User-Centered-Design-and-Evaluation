import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_app/tenant/tenantEvaluatePage.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';
import 'tenantTasks.dart';
import 'profile.dart';


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


class EvaluateMain extends StatefulWidget {
  const EvaluateMain({Key? key}) : super(key: key);

  @override
  _EvaluateMainState createState() => _EvaluateMainState();
}

class _EvaluateMainState extends State<EvaluateMain> {

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
                    radius: 59.0,
                    backgroundColor: Colors.black54,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(p.image),
                      radius: 55.0,
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


  Widget landlordTempla(p){
    return Padding(
      padding: EdgeInsets.fromLTRB(0.0, 6.0, 0.0, 8.0),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FlatButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Evaluate()),
                );
              },
              child: CircleAvatar(
                radius: 59.0,
                backgroundColor: Colors.black54,
                child: CircleAvatar(
                  backgroundImage: AssetImage(p.image),
                  radius: 55.0,
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
      ],),);
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
              IconButton(
                  color: Colors.white,
                  icon: Icon(
                    Icons.star_border,
                    size: 35.0,
                  ), onPressed: () {}),
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
        padding: EdgeInsets.fromLTRB(1.0, 40.0, 0.0, 0.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 0.0),
                child: Row(
                children: <Widget>[
                    IconButton(
                      onPressed:(){
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()),
                        );
                      },
                      icon: Icon(
                        Icons.person_outline,
                        color: Colors.black,
                        size: 40.0,
                      )
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
                        // POR CLASSE
                        /*showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupNotification(context),
                        );*/
                      },
                    ),
                ],
                ),
              ),
            Padding(
              padding: EdgeInsets.fromLTRB(125, 0.0, 0.0, 0.0),
              child: IconButton(
                  onPressed: (){},
                  color: Color(0xFF48ACBE),
                  icon: Icon(
                    Icons.house,
                    size: 140.0,
                  )),
            ),
              SizedBox(height: 80.0),
              Center(child: buildText('Your House')),
              SizedBox(height: 10.0),
            /*Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Evaluate()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 69.0,
                      backgroundColor: Colors.black54,
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/carlos.jfif'),
                        radius: 65.0,
                      ),
                    )
                ),
                buildFlatButton('assets/carolina.jpeg'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildText('   Carlos  '),
                buildText('           Carolina'),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildFlatButton('assets/joao.jpg'),
                buildFlatButton('assets/marco.jpg'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildText('   João  '),
                buildText('            Marco'),
              ],
            ),*/
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:[
                  landlordTempla(landlord)
                  ]
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
    );
  }

  FlatButton buildFlatButton(String image) {
    return FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: CircleAvatar(
          radius: 69.0,
          backgroundColor: Colors.black54,
          child: CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 65.0,
          ),
        )
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