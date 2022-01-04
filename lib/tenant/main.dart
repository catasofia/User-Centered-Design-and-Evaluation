import 'package:flutter/material.dart';
import '../loading.dart';
import '../tenant/tenantHomescreen.dart';
import '../tenant/tenantTasks.dart';
import '../tenant/tenantContacts.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
     // '/': (context) => Loading(),
      '/': (context) => Contacts(),
      //'/home': (context) => Home(),
      //'/home': (context) => Task(),
    }
));