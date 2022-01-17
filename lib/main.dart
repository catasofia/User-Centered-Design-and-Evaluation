import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordEvaluate.dart';
import 'package:time_app/landlord/landlordEvaluateTasks.dart';
import 'package:time_app/landlord/landlordSeeHouse.dart';
import 'package:time_app/landlord/landlordSuggestedTask.dart';
import 'package:time_app/neighbor/suggestTasks.dart';
import 'package:time_app/signIn.dart';
import 'package:time_app/signUp.dart';
import 'package:time_app/tenant/tenantEvaluatePage.dart';
import 'package:time_app/tenant/tenantHomescreen.dart';
import 'landlord/landlordAddHouse.dart';
import 'landlord/landlordAlameda.dart';
import 'loading.dart';
import 'tenant/tenantContacts.dart';
import 'tenant/tenantTasks.dart';
import 'neighbor/neighborEvaluationCarolina.dart';
import 'tenant/tenantContacts.dart';
import 'homeScreen.dart';
import 'landlord/landlordEvaluatePage1.dart';
import 'landlord/landlordEvaluatePage3.dart';
import 'landlord/landlordHomeScreen.dart';
import 'landlord/landlordAddTask.dart';
import 'landlord/landlordEditTask.dart';
import 'neighbor/suggestTasks.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/*void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      // '/': (context) => Loading(),
      //'/': (context) => Contacts(),
      //'/home': (context) => Home(),
      //'/home': (context) => Task(),
      '/': (context) => HomeScreen(),
    }
));

*/
/*
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SignUp());
}
class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CollectionReference teste = FirebaseFirestore.instance.collection('teste');

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: Center(
          child: StreamBuilder(
            stream: teste.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              return ListView(
                children: snapshot.data!.docs.map((teste){
                  return Center(
                    child: ListTile(
                      title: Text(teste['name'])
                    )
                  );
                }).toList(),
              );
            }
          )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            teste.add({
              'name': textController.text,
            });
          },
        ),
      )
    );
  }
}
*/

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        // '/': (context) => Loading(),
        //'/': (context) => Contacts(),
        //'/home': (context) => Home(),
        //'/home': (context) => Task(),
        '/': (context) => HomeScreen(),
      }
  ));
}

