import 'package:flutter/material.dart';
import 'package:time_app/landlord/landlordEvaluate.dart';
import 'package:time_app/landlord/landlordSeeHouse.dart';
import 'package:time_app/landlord/landlordSuggestedTask.dart';
import 'package:time_app/neighbor/suggestTasks.dart';
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