import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_app/contract_linking.dart';
import 'package:time_app/landlord/landlordEvaluateTasks.dart';
import 'neighborProfile.dart';
import 'suggestTasks.dart';

class Task {
  String name;
  String date;
  int stars;

  Task({required this.name, required this.date, required this.stars});
}

class NeighborHome extends StatefulWidget {
  const NeighborHome({Key? key}) : super(key: key);

  @override
  _NeighborHomeState createState() => _NeighborHomeState();
}

class _NeighborHomeState extends State<NeighborHome> {
  @override
  List<Task> tasksToEvaluate= [
    Task(name: 'Clean Stairs', date: '7 - 14 Nov', stars: 0),
    Task(name: 'Clean Elevator', date: '7 - 20 Nov', stars: 0),
    Task(name: 'Exchange Lightbulb', date: '15 - 16 Nov', stars: 0),
    Task(name: 'ATA', date: '6 - 18 Nov', stars: 0),
  ];

  List<Task> tasksEvaluated= [
    Task(name: 'Clean Stairs', date: '25 - 30 Oct', stars: 3),
  ];

  @override
  Widget tasksCard(tt) {
    return Card(
      margin: EdgeInsets.fromLTRB(0.0, 18.0, 0.0, 0.0),
      color: Color(0xFF48ACBE),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      tt.name,
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  Text(
                      tt.date,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      )
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Icon(Icons.star_border, size: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.stars = 1;
                  });
                },
                    icon: Icon(Icons.star), color: tt.stars >= 1 ? Colors.yellow : Colors.white, iconSize: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.stars = 2;
                  });
                },
                  icon: Icon(Icons.star), color: tt.stars >= 2 ? Colors.yellow : Colors.white, iconSize: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.stars = 3;
                  });
                },
                  icon: Icon(Icons.star), color: tt.stars >= 3 ? Colors.yellow : Colors.white, iconSize: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.stars = 4;
                  });
                },
                  icon: Icon(Icons.star), color: tt.stars >= 4 ? Colors.yellow : Colors.white, iconSize: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.stars = 5;
                  });
                },
                  icon: Icon(Icons.star), color: tt.stars >= 5 ? Colors.yellow : Colors.white, iconSize: 25,),
                tasksEvaluated.contains(tt) ? SizedBox() :
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text("Submit", style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      primary: tt.stars == 0 ? Colors.grey[400] : Colors.green,
                      shape: RoundedRectangleBorder( //to set border radius to button
                          borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final contractLink = Provider.of<ContractLinking>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
          child: Center(
            child: contractLink.isLoading
            ? CircularProgressIndicator()
            : SingleChildScrollView(
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
                          MaterialPageRoute(builder: (context) => NeighborProfile()),
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
                SizedBox(height: 20,),
                Center(
                  child: Container(
                    width: 220,
                    height: 60,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color(0xFF48ACBE)
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SuggestTask()),
                          );
                        },
                        child: Text('Suggest new task',
                          style: TextStyle(color: Colors.black,
                          letterSpacing: 1.0,
                          fontSize: 20,),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Tasks to Evaluate',
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      for (var i in tasksToEvaluate) tasksCard(i),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 0.0),
                  child: Text(
                    'Tasks Evaluated',
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      for (var i in tasksEvaluated) tasksCard(i),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
          "- There's a new task to evaluate, rate it now.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
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
