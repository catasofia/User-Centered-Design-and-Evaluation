import 'package:flutter/material.dart';
import 'tenantTasks.dart';
import 'tenantContacts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

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
                color: Colors.white,
                icon: Icon(
                  Icons.house_outlined,
                  size: 35.0,
                ), onPressed: () {}
              ),
              IconButton(icon: Icon(
                Icons.star_border,
                size: 35.0,
              ), onPressed: () {}),
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
         padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             Row(
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
                child: Container(
                    child: Image.asset('assets/map.jfif'),
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
                      color: Color(0xFF48ACBE),
                    ),
                ),
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
             Row(
               children: <Widget>[
                 Container(
                   width: 150.0,
                   height: 90.0,
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
                     color: Color(0xFF48ACBE),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         SizedBox(width: 30.0),
                         Icon(
                           Icons.clean_hands_sharp,
                           color: Colors.white,
                           size: 35.0,
                         ),
                         SizedBox(height: 15.0),
                         Text(
                           'Clean Elevator',
                           style: TextStyle(
                             fontFamily: 'Arial',
                             fontSize: 18,
                             color: Colors.white,
                             height: 1,
                           ),
                           textAlign: TextAlign.center,
                         ),
                       ],
                     ),
                   ),
                 ),
                 SizedBox(width: 45.0),
                 Container(
                   width: 150.0,
                   height: 90.0,
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
                     color: Color(0xFF48ACBE),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: <Widget>[
                         SizedBox(width: 15.0),
                         Icon(
                           Icons.lightbulb,
                           color: Colors.white,
                           size: 30.0,
                         ),
                         SizedBox(height: 8.0),
                         Text(
                           'Exchange Lightbulb',
                           style: TextStyle(
                             fontFamily: 'Arial',
                             fontSize: 16,
                             color: Colors.white,
                             height: 1,
                           ),
                           textAlign: TextAlign.center,
                         ),
                       ],
                     ),
                   ),
                 ),
               ],
             )
           ],
         ),

       ),



















       /* body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),


                child: Row(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HELLLOOOOOO',
                          style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Leonorrrrr',
                      style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),


                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HELLLOOOOOO',
                          style: TextStyle(
                            fontSize: 28.0,
                            letterSpacing: 2.0,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Leonorrrrr',
                      style: TextStyle(
                        fontSize: 66.0,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
        )*/
    );
  }
}
