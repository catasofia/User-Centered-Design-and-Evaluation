import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'tenantTasks.dart';
import 'tenantContacts.dart';
import 'profile.dart';
import 'tenantEvaluateMain.dart';
import 'cleanElevator.dart';
import 'tenantMap.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class TaskInfo{
  String name;
  String id;

  TaskInfo({required this.name, required this.id});
}

class _HomeState extends State<Home> {

  List<TaskInfo> tasks = [];

  Future<void> getData() async {
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('task').get();

    if (tasks.isNotEmpty) {
      tasks = [];
    }

    snapshot.docs.forEach((doc) {
      if(doc['tenant'] == "Carolina Oliveira"){
        if(doc['done'] == false){
          TaskInfo t = TaskInfo(name: doc['name'], id: doc.id);

          tasks.add(t);
        }
      }
    });

    setState(() {});

  }

  Widget template(tt){
    return Padding(
      padding: EdgeInsets.only(right: 15),
        child: Column(
        children: [
          Container(
            width: 140,
            height:120,
            child: Stack(
              children: <Widget>[
                RaisedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CleanElevator()), //AQUI
                    );
                  },
                  color: Color(0xFF48ACBE),
                  child: Text('                                 \n\n\n\n\n'),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(57.0, 13.0, 0.0, 0.0),
                  child: Icon(
                      Icons.clean_hands_sharp,
                      color: Colors.white,
                      size: 35.0),
                ),
                      Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                          child: Text(
                            tt.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18,
                            color: Colors.white,
                            height: 1.0)
                      ), //SCROLL
                  ),
                ),
                ],
            ),
        ),
        ]),
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
         padding: EdgeInsets.fromLTRB(30.0, 40.0, 20.0, 0.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Row(
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
             Divider(
               height: 40.0,
               color: Colors.white,
             ),
             Text(
               'Welcome Home, Carolina!',
               style: TextStyle(
                 color: Color(0xFF48ACBE),
                 letterSpacing: 2.0,
                 fontSize: 25.0,
                 fontWeight: FontWeight.bold,
               ),
             ),
             Divider(
               height: 25.0,
               color: Colors.white,
             ),
             Text(
               'Your Home',
               style: TextStyle(
                 color: Colors.black,
                 letterSpacing: 2.0,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
             ),
             Divider(
               height: 15.0,
               color: Colors.white,
             ),
             Center(
               child: FlatButton(
                   //padding: EdgeInsets.zero,
                   onPressed: () {
                     Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Map()),
                     );
                   },
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(7.0),
                     child: Image.asset('assets/map.png', width: 280, ),
                     ),
                   )
               ),
             Divider(
               height: 30.0,
               color: Colors.white,
             ),
             Text(
               'Your Tasks',
               style: TextStyle(
                 color: Colors.black,
                 letterSpacing: 2.0,
                 fontSize: 20.0,
                 fontWeight: FontWeight.bold,
               ),
             ),
             SizedBox(height: 15.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
               children: <Widget>[
                 for (var i in tasks) template(i)
               ],
             )
            ),],
         ),
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
