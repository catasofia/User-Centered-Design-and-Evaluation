import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TenantProfile extends StatefulWidget {
  final String id;

  const TenantProfile({Key? key, required this.id}) : super(key: key);
  @override
  _TenantProfileState createState() => _TenantProfileState(id);
}

class Task{
  String name;
  String discount;

  Task({required this.name, required this.discount});
}

class _TenantProfileState extends State<TenantProfile> {
  final String id;

  _TenantProfileState(this.id);

  String name = "";
  int age = 0;
  String gender = "";
  String image = "";
  String role = "";
  List<Task> tasks = [];



  Future<void> getProfile() async{
    QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('profile').get();

    snapshot.docs.forEach((doc) {
      if (doc['name'] == id) {
        name = doc['name'];
        age = doc['age'];
        gender = doc['gender'];
        image = doc['image'];
        role = doc['role'];
      }});

    QuerySnapshot snapshot1 = await FirebaseFirestore.instance.collection('task').get();

    if (tasks.isNotEmpty){
      tasks = [];
    }

    snapshot1.docs.forEach((doc){
      if(doc['tenant'] == id) {
        Task task = Task(name: doc['name'], discount: doc['discount']);
        tasks.add(task);
      }
    });
    setState(() {});

  }

  Widget template(tt){
    return
    Row(
        children: <Widget> [
          SizedBox(width: 30.0, height:30),
          Text(
            tt.name + ":",
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              color: Color(0xFF48ACBE),
              height: 1,
            ),
          ),
          SizedBox(width: 20,),
          Text(
            tt.discount + '€',
            style: TextStyle(
              fontFamily: 'Arial',
              fontSize: 20,
              color: Color(0xFF48ACBE),
              height: 1,
            ),
          ),
        ]);
  }


  @override
  Widget build(BuildContext context) {
    getProfile();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                IconButton(onPressed: () {
                },
                    icon: Icon(Icons.person_outline,
                      color: Colors.black,
                      size: 38,)
                ),
                SizedBox(width: 8.0),
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
                      SizedBox(width: 8.0),
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
                SizedBox(width: 7.0),
                IconButton(onPressed: (){
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => _buildPopupNotification(context),
                  );
                },
                    icon: Icon(Icons.notifications_active_outlined,
                      color: Colors.black,
                      size: 38,)),
              ],
            ),
            SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    Container(
                      child: CircleAvatar(
                        backgroundImage: AssetImage(image),
                        radius: 55.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      name,
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
            SizedBox(height: 30.0),
            Center(
              child: Container(
                width: 350.0,
                height: 140.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.5,
                      blurRadius: 1.5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text(
                          'Info:',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Color(0xFF48ACBE),
                            height: 1,
                          ),
                        ),
                        SizedBox(width: 50.0),
                        Text(
                          name +"\n" + gender +", " + age.toString(),
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Color(0xFF48ACBE),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text(
                          'Role:',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Color(0xFF48ACBE),
                            height: 1,
                          ),
                        ),
                        SizedBox(width: 45.0),
                        Text(
                          role,
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Color(0xFF48ACBE),
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text(
                          'Rating:',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Color(0xFF48ACBE),
                            height: 1,
                          ),
                        ),
                        SizedBox(width: 30.0),
                        Text(
                          '4.87',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Color(0xFF48ACBE),
                            height: 1,
                          ),
                        ),
                        Icon(
                          Icons.star_border,
                          color: Color(0xFF48ACBE),
                          size: 25.0,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Center(
              child: Container(
                width: 350.0,
                height: 140.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1.5,
                      blurRadius: 1.5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  color: Colors.white70,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 10,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 30.0),
                          child: Text(
                          'Tasks',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Color(0xFF48ACBE),
                            height: 1,
                          ),
                        ),),
                        ]),
                        Column(
                          children: [
                            for(var i in tasks) template(i),
                          ],
                        )
                      ],
                    ),
                ),
              ),
            Row(
              children: [
                Align(
                    alignment: Alignment.bottomLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: (){
                        Navigator.pop(
                          context,
                        );
                      },
                    )
                ),
              ],
            )
          ],
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
          "- Maria completed a task, rate her now.",
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
