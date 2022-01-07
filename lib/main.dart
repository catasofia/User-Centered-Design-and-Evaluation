import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordEvaluate.dart';
import 'package:time_app/neighbor/suggestTasks.dart';
import 'package:time_app/tenant/tenantEvaluatePage.dart';
import 'loading.dart';
import 'tenant/tenantContacts.dart';
import 'tenant/tenantTasks.dart';
import 'tenant/tenantContacts.dart';
import 'homeScreen.dart';
import 'landlord/landlordEvaluatePage1.dart';
import 'landlord/landlordHomeScreen.dart';
import 'landlord/landlordAddTask.dart';
import 'landlord/landlordEditTask.dart';
import 'neighbor/suggestTasks.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
     // '/': (context) => Loading(),
      //'/': (context) => Contacts(),
      //'/home': (context) => Home(),
      //'/home': (context) => Task(),
      '/': (context) => HomeScreen(),
    }
));