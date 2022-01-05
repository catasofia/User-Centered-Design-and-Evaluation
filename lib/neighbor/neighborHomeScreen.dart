import 'package:flutter/material.dart';
import 'neighborProfile.dart';
import 'suggestTasks.dart';

class NeighborHome extends StatefulWidget {
  const NeighborHome({Key? key}) : super(key: key);

  @override
  _NeighborHomeState createState() => _NeighborHomeState();
}

class _NeighborHomeState extends State<NeighborHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
              children: <Widget>[
                IconButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NeighborProfile()),
                  );
                },
                    icon: Icon(Icons.person_outline,
                      color: Colors.black,
                      size: 38,)),
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
            Divider(
              height: 40.0,
              color: Colors.white,
            ),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   width: 100,
                   height: 100,
                   child: FloatingActionButton(
                     heroTag: null,
                     onPressed: () {},
                     elevation: 0,
                    child: new ConstrainedBox(constraints: new BoxConstraints.expand(),
                      child: new CircleAvatar(backgroundImage: AssetImage('assets/carlos.jfif'),
                          ),),),
                 ),
                 SizedBox(width: 55,),
                 Container(
                   width: 100,
                   height: 100,
                   child: FloatingActionButton(
                     heroTag: null,
                     onPressed: () {},
                     elevation: 0,
                     child: new ConstrainedBox(constraints: new BoxConstraints.expand(),
                       child: new CircleAvatar(backgroundImage: AssetImage('assets/carolina.jpeg'),
                       ),),),
                 ),
               ],
             ),
              SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.white,
                        elevation: 0
                      ),
                      onPressed: () {},
                      child: Text('Carlos', style: TextStyle(color: Colors.black),)
                  ),
                  SizedBox(width: 80,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          elevation: 0
                      ),
                      onPressed: () {},
                      child: Text('Carolina', style: TextStyle(color: Colors.black),)
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () {},
                      elevation: 0,
                      child: new ConstrainedBox(constraints: new BoxConstraints.expand(),
                        child: new CircleAvatar(backgroundImage: AssetImage('assets/joao.jpg'),
                        ),),),
                  ),
                  SizedBox(width: 55,),
                  Container(
                    width: 100,
                    height: 100,
                    child: FloatingActionButton(
                      heroTag: null,
                      onPressed: () {},
                      elevation: 0,
                      child: new ConstrainedBox(constraints: new BoxConstraints.expand(),
                        child: new CircleAvatar(backgroundImage: AssetImage('assets/marco.jpg'),
                        ),),),
                  ),
                ],
              ),
              SizedBox(height: 7,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          elevation: 0
                      ),
                      onPressed: () {},
                      child: Text('João', style: TextStyle(color: Colors.black),)
                  ),
                  SizedBox(width: 80,),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Colors.white,
                          elevation: 0
                      ),
                      onPressed: () {},
                      child: Text('Marco', style: TextStyle(color: Colors.black),)
                  ),
                ],
              ),
              SizedBox(height: 90,),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 0, 100, 0),
                child: Container(
                  width: 175,
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
                      style: TextStyle(color: Colors.black),)),
                ),
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
          "- Maria completed a task, rate him now.",
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
