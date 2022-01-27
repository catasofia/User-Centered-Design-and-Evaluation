import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_app/landlord/profileLandlord.dart';
// import 'package:image_picker/image_picker.dart';
import 'landlordHomeScreen.dart';
import 'landlordSuggestedTask.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddHouse extends StatefulWidget {
  const AddHouse({Key? key}) : super(key: key);

  @override
  _AddHouseState createState() => _AddHouseState();
}

final house_name = TextEditingController();
final price = TextEditingController();
final description = TextEditingController();
final location = TextEditingController();

class _AddHouseState extends State<AddHouse> {
  File? image;
  Future getImage() async{
    /*try{
      final image = await ImagePicker().getImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e){
      print('Failed to load image: $e');
    }*/
  }

  Future deleteImage() async{
    try{
      setState(() => this.image = null);
    } on PlatformException catch (e){
      print('Failed to load image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    CollectionReference house = FirebaseFirestore.instance.collection('house');

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body:
      SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
                  child: Row(
                    children: <Widget>[
                      IconButton(onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileLandlord()),
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
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0),
                  child: new Column(
                    children: <Widget>[
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text('House Name',
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      ),
                      new TextField(
                        controller: house_name,
                        decoration: InputDecoration(
                            hintText: "Insert name"
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text('Price',
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      ),
                      new TextField(
                        controller: price,
                        decoration: InputDecoration(
                            hintText: "Insert price"
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text('Description',
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      ),
                      new TextField(
                        controller: description,
                        decoration: InputDecoration(
                            hintText: "Insert description"
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text('Location',
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      ),
                      new TextField(
                        controller: location,
                        decoration: InputDecoration(
                            hintText: "Insert location"
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text('Image',
                            style: TextStyle(
                                fontSize: 18
                            ),),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child:
                    image != null? Image.file(image!, width: 100, height:100, fit: BoxFit.cover) : SizedBox(width: 100, height:100 ),
                  ),
                ),
                // onPressed: () => getImage(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
                      child: Container(
                        width: 170,
                        height: 30,
                        alignment: Alignment.center,
                        child: ElevatedButton.icon(
                          label: Text('Pick from gallery'),
                          style: ElevatedButton.styleFrom(primary: Colors.grey[350], onPrimary: Colors.black),
                          icon: Icon(Icons.image, size: 20),
                          onPressed: () => getImage(),
                        )
                      ),
                    ),

                    MaterialButton(
                      onPressed: () => deleteImage(),
                      color: Colors.grey[350],
                      textColor: Colors.black,
                      child: Icon(
                        Icons.delete,
                        size: 20,
                      ),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF81C784),
                          elevation: 3,
                          padding: EdgeInsets.all(10),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)
                          ),
                        ),
                        onPressed: () {
                          if(checkTextFieldEmptyOrNot()){
                            house.add({
                              'name': house_name.text,
                              'price': price.text,
                              'location': location.text,
                              'description': description.text,
                              'neighbors': [],
                              'tenants': [],
                              'landlord': 'Carlos Silva',
                              'tasks': []
                            });
                            clearText();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _buildPopupAddHouse(context),
                            );
                          } else{
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => _errorPopup(context),
                            );
                          }
                        },
                        child: Text('Confirm',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 15,
                            color: Colors.black, //font color
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeLandlord()),
                            );
                          },
                        )
                    ),
                  ],
                ),
              ]
          )
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
          "  - João completed a task, rate him now.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
        Text(
          "  - Carolina has sent you a message.",
          style: TextStyle(
            fontFamily: 'Arial',
            fontSize: 20,
            color: Colors.black,
            height: 1,
          ),
        ),
        SizedBox(height: 20.0),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20, fontFamily: 'Arial', color: Colors.black),
          ),
          onPressed: () {/*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SuggestedTask()),
            );*/

          },
          child: const Text('- Francisca suggested a task for Alameda T2.',
              style: TextStyle(fontFamily: 'Arial',
                fontSize: 20,
                color: Colors.black,
                height: 1,)),
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

Widget _buildPopupAddHouse(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    backgroundColor: Color(0xFF48ACBE),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(child: Icon(Icons.check, color: Colors.green[800], size: 100,)),
        SizedBox(height: 15,),
        Text(
          "House successfully added.",
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.grey[400]
                ),
                onPressed: (){
                  clearText();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeLandlord()),
                  );
                },
                child: Text('Ok', style: TextStyle(color: Colors.black),),
              )
          ),
        ],
      ),
    ],
  );
}

Widget _errorPopup(BuildContext context) {
  return new AlertDialog(
    alignment: Alignment.center,
    backgroundColor: Color(0xFF48ACBE),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Center(child: Icon(Icons.error, color: Colors.red[700], size: 100,)),
        SizedBox(height: 15,),
        Text(
          "You need to fill the details in order to confirm.",
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
              Icons.highlight_remove,
              color: Colors.black,
              size: 25.0,
            ),
          ),
        ],
      ),
    ],
  );
}

clearText(){
  house_name.clear();
  description.clear();
  price.clear();
  location.clear();
}

checkTextFieldEmptyOrNot(){
  String name;
  String loc;
  String desc;
  String pri;
  name = house_name.text;
  loc = location.text;
  desc = description.text;
  pri = price.text;
  return name != '' && loc !='' && desc !='' && pri !='';
}