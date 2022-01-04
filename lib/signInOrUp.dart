import 'package:flutter/material.dart';
import 'signIn.dart';

class Signs extends StatefulWidget {
  const Signs({Key? key}) : super(key: key);

  @override
  _SignsState createState() => _SignsState();
}

class _SignsState extends State<Signs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children:[
            Image.asset('assets/buildingsSmaller.jpg', fit: BoxFit.fill,),
            Image.asset('assets/logo.jpeg', height: 150,),
            SizedBox(height: 20,),
            SizedBox(
              height: 75,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF48ACBE),
                    elevation: 3,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignIn()),
                  );
                },
                child: Text('Sign In',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            SizedBox(
              height: 75,
              width: 150,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color(0xFF48ACBE),
                    elevation: 3,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)
                  ),
                ),
                onPressed: () {},
                child: Text('Sign Up',
                  style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 18,
                      color: Colors.black, //font color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
