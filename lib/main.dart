import 'package:flutter/material.dart';
import 'loading.dart';
import 'tenantHomescreen.dart';
import 'tenantTasks.dart';
import 'tenantContacts.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
     // '/': (context) => Loading(),
      '/': (context) => Contacts(),
      //'/home': (context) => Home(),
      //'/home': (context) => Task(),
    }
));