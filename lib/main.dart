import 'package:flutter/material.dart';
import 'loading.dart';
import 'tenant/tenantContacts.dart';
import 'tenant/tenantTasks.dart';
import 'tenant/tenantContacts.dart';
import 'homeScreen.dart';
import 'landlord/landlordEvaluate.dart';
import 'landlord/landlordHomeScreen.dart';

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