import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_app/contract_linking.dart';
import 'package:time_app/landlord/landlordEvaluateTasks.dart';
import 'neighborProfile.dart';
import 'suggestTasks.dart';

class Task {
  String name;
  String date;
  int landStars;
  int neigStars;
  String id;
  String house;

  Task({required this.name, required this.date, required this.landStars, required this.neigStars, required this.id, required this.house,});
}

class NeighborHome extends StatefulWidget {
  const NeighborHome({Key? key}) : super(key: key);

  @override
  _NeighborHomeState createState() => _NeighborHomeState();
}

class _NeighborHomeState extends State<NeighborHome> {
  @override
  List<Task> allTasks= [];

  List<Task> tasksToEvaluate= [];

  List<Task> tasksEvaluated= [];

  List<Task> tasksCarolina =[];

  Future<void> getData() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('task').get();
    QuerySnapshot profiles = await FirebaseFirestore.instance.collection('profile').get();

    if (tasksToEvaluate.isNotEmpty){
      tasksToEvaluate = [];
    }

    if (tasksEvaluated.isNotEmpty){
      tasksEvaluated = [];
    }

    if (tasksCarolina.isNotEmpty){
      tasksCarolina = [];
    }

    snapshot.docs.forEach((doc) {

      if(doc['tenant'] == "Carolina Oliveira"){
        Task task1 = Task(name: doc['name'],
            date: doc['date'],
            landStars: doc['landStars'],
            neigStars: doc['neigStars'],
            id: doc.id,
            house: doc['house']);
        tasksCarolina.add(task1);
      }

      profiles.docs.forEach((element) {
        if(element['name'] == "Francisca Mota"){
          if(doc['house'] == element['house']){
            if(doc['done'] == true){
              Task task1 = Task(name: doc['name'],
                  date: doc['date'],
                  house: doc['house'],
                  landStars: doc['landStars'],
                  neigStars: doc['neigStars'],
                  id: doc.id);
              bool aux = true;
              allTasks.forEach((element) {
                if (element.id == doc.id) {
                  aux = false;
                }
              });
              if (aux) {
                allTasks.add(task1);
              }
            }
          }
        }
    });});

    snapshot.docs.forEach((element) {
      for(var i = 0; i < allTasks.length; i++){
        if(allTasks[i].id == element.id){
          if(element['neigStars'] == 0 ){
            tasksToEvaluate.add(allTasks[i]);
          }
          else if(element['neigStars'] != 0) {
            tasksEvaluated.add(allTasks[i]);
          }
        }
      }
    });
    setState((){});
  }


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
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(6, 0,0,0),
                    child: Text(
                      tt.house,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Icon(Icons.star_border, size: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.neigStars = 1;
                  });
                },
                  icon: Icon(Icons.star), color: tt.neigStars >= 1 ? Colors.yellow : Colors.white, iconSize: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.neigStars = 2;
                  });
                },
                  icon: Icon(Icons.star), color:  tt.neigStars >= 2 ? Colors.yellow : Colors.white, iconSize: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.neigStars = 3;
                  });
                },
                  icon: Icon(Icons.star), color:  tt.neigStars >= 3 ? Colors.yellow : Colors.white, iconSize: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.neigStars = 4;
                  });
                },
                  icon: Icon(Icons.star), color:  tt.neigStars >= 4 ? Colors.yellow : Colors.white, iconSize: 25,),
                IconButton(onPressed: (){
                  setState(() {
                    tt.neigStars = 5;
                  });
                },
                  icon: Icon(Icons.star), color:  tt.neigStars >= 5 ? Colors.yellow : Colors.white, iconSize: 25,),
                tasksEvaluated.contains(tt) ? SizedBox() :
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: (){
                      if(tt.neigStars == 1){
                        FirebaseFirestore.instance.collection('task').doc(tt.id).update({'neigStars': 1});
                        updateRate(tasksCarolina);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupEvaluate(context),
                        );
                      }
                      if(tt.neigStars == 2){
                        FirebaseFirestore.instance.collection('task').doc(tt.id).update({'neigStars': 2});
                        updateRate(tasksCarolina);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupEvaluate(context),
                        );
                      }
                      if(tt.neigStars == 3){
                        FirebaseFirestore.instance.collection('task').doc(tt.id).update({'neigStars': 3});
                        updateRate(tasksCarolina);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupEvaluate(context),
                        );
                      }
                      if(tt.neigStars == 4){
                        FirebaseFirestore.instance.collection('task').doc(tt.id).update({'neigStars': 4});
                        updateRate(tasksCarolina);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupEvaluate(context),
                        );
                      }
                      if(tt.neigStars == 5){
                        FirebaseFirestore.instance.collection('task').doc(tt.id).update({'neigStars': 5});
                        updateRate(tasksCarolina);
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => _buildPopupEvaluate(context),
                        );
                      }
                    },
                    child: Text("Submit", style: TextStyle(color: Colors.black),),
                    style: ElevatedButton.styleFrom(
                      primary: tt.neigStars == 0 ? Colors.grey[400] : Colors.lightGreen,
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
    //final contractLink = Provider.of<ContractLinking>(context);
    getData();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 30.0),
          child: Center(
            //child: contractLink.isLoading
           // ? CircularProgressIndicator()
           // :
            child: SingleChildScrollView(
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

Widget _buildPopupEvaluate(BuildContext context) {
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
              Icons.check,
              size: 20.0,
              color: Colors.lightGreen,
            ),
            SizedBox(width: 3.0),
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


void updateRate(List<Task> tasksCarolina){
  int aux = 0;
  double sum = 0;
  int div = 0;
  tasksCarolina.forEach((element) {
    if(element.landStars != 0 ){
      div = div + 1;
    }
    if(element.neigStars != 0) {
      div = div + 1;
    }
    aux = aux + element.landStars + element.neigStars;
  });
  sum = aux/(div);
  int rat = sum.round();
  FirebaseFirestore.instance.collection('profile').doc("aQXN0IZC6JE9rgW8eMYc").update({'rating': rat});
}