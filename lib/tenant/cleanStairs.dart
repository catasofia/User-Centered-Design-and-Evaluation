import 'package:flutter/material.dart';
import 'tenantHomescreen.dart';
import 'tenantContacts.dart';

class Types{
  String type;
  String task;

  Types({required this.type, required this.task});
}

class CleanStairs extends StatefulWidget{
  const CleanStairs({Key? key}) : super(key: key);

  @override
  _CleanState createState() => _CleanState();
}

class _CleanState extends State<CleanStairs>{

  List<Types> tasks= [
    Types(type: 'Description', task: 'You will have to clean all the stairs.\nAfter the stairs have been cleaned, you will have to wash the mop and the mop bucket, and put it back on the place where you have grabbed them.\nThis task has to be done twice per month.'),
    Types(type: 'Products', task: '- Cif Lava-Tudo;\n- Sonasol;\n- Neo Blanc.\n\nNote: the mop and the mop bucket are on the layoff of the building.'),
    Types(type: 'Price', task: 'This task has a discount on the rent of 30€.')
  ];

  @override
  Widget template(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 18.0, 16.0, 0.0),
      color: Color(0xFF9ED3DD),
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
                  tt.type,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                    letterSpacing: 2.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Text(
                tt.task,
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                )
            ),
          ],
        ),
      ),
    );
  }

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
              ), onPressed: () {}),
              IconButton(
                  color: Colors.white,
                  icon: Icon(
                    Icons.cleaning_services_rounded,
                    size: 30.0,
                  ), onPressed: () {}),
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
      body: SafeArea(
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
                  SizedBox(width: 15.0),
                  Icon(
                    Icons.notifications_active_outlined,
                    color: Colors.black,
                    size: 40.0,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 4.0, 220.0, 0.0),
              child: Text(
                  'Clean Stairs',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
            ),
            for (var i in tasks) template(i),
          ]
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your onPressed code here!
        },
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(3.0),
            side: BorderSide(color: Colors.black),
        ),
        label: const Text(
            '        Add        ',
          style: TextStyle(
              color: Colors.black,
          )
        ),
        backgroundColor: Color(0xFF69BB67),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}