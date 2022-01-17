import 'package:flutter/material.dart';
import 'signInOrUp.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

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
              Container(
                width: 240.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14.0),
                  color: Colors.grey[400],
                ),
                child:
                    Text(
                      'Insert Email or Phone',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: Colors.black,
                        height: 1.7,
                      ),
                      textAlign: TextAlign.center,
                    ),
                ),
              SizedBox(height: 10,),
              Container(
                width: 240.0,
                height: 45.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.grey[400],
                ),
                child:
                Text(
                  'Insert Password',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 20,
                    color: Colors.black,
                    height: 1.7,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
                height: 65,
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
                  child: Text('Sign In',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: Colors.black, //font color
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
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
                          MaterialPageRoute(builder: (context) => Signs()),
                        );
                      },
                    )
                ),
              ],
            ),
          ]
        ),
      ),
    );
  }
}
