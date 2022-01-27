import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_app/landlord/landlordHomeScreen.dart';
import 'package:time_app/landlord/landlordSeeHouse.dart';
import 'package:time_app/neighbor/neighborHomeScreen.dart';
import 'package:time_app/tenant/tenantEvaluateMain.dart';
import 'package:time_app/tenant/tenantEvaluatePage.dart';
import 'homeScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_app/contract_linking.dart';

import 'landlord/landlordEditTask.dart';
import 'landlord/landlordEvaluate.dart';
import 'landlord/landlordEvaluateTasks.dart';
import 'landlord/landlordTasks.dart';
import 'neighbor/suggestTasks.dart';

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
  runApp(Testing());
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
    CollectionReference teste = FirebaseFirestore.instance.collection('teste2');

    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: TextField(
            controller: textController,
          ),
        ),
        body: Center(
          child: StreamBuilder(
            stream: teste.orderBy('name').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
              return ListView(
                children: snapshot.data!.docs.map((teste2){
                  return Center(
                    child: ListTile(
                      title: Text(teste2['name']),
                      onLongPress: (){
                        teste2.reference.delete();
                      },
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ContractLinking>(
      create: (_) => ContractLinking(),
      child: MaterialApp(
        //initialRoute: '/',
        //routes: {
        // '/': (context) => Loading(),
        //'/': (context) => Contacts(),
        //'/home': (context) => Home(),
        //'/home': (context) => Task(),
        //'/': (context) => HomeScreen(),
        //}
        home: TasksLandlord(),
      ),
    );
  }
}
