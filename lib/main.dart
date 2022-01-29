import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_app/landlord/landlordHomeScreen.dart';
import 'package:time_app/landlord/landlordSeeHouse.dart';
import 'package:time_app/neighbor/neighborHomeScreen.dart';
import 'package:time_app/neighbor/neighborProfile.dart';
import 'package:time_app/tenant/profile.dart';
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
        home: HomeScreen(),
      ),
    );
  }
}
