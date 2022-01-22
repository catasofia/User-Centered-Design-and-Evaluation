import 'package:flutter/material.dart';
import 'signInOrUp.dart';
import 'tenant/tenantHomescreen.dart';
import 'neighbor/neighborHomeScreen.dart';
import 'landlord/landlordHomeScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _landHasBeenPressed = false;
  bool _neigHasBeenPressed = false;
  bool _tenHasBeenPressed = false;
  String _role = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
      body: Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          children:[
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset('assets/buildingsSmaller.jpg', fit: BoxFit.fill,),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,233,0,0),
                  child: Image.asset('assets/logoS.jpg', height: 110,),
                ),
              ],
            ),
            SizedBox(height: 25,),
            Text(
              'Sign up as',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25,),
            Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 145,),
                  Container(
                    width: 25,
                    height: 25,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: _landHasBeenPressed ? Color(0xFF48ACBE) : Colors.grey[400],
                        elevation: 3,
                        padding: EdgeInsets.all(20),
                        shape: CircleBorder(),
                      ),
                      onPressed: () => {
                        setState(() {
                          _landHasBeenPressed = !_landHasBeenPressed;
                          _neigHasBeenPressed = false;
                          _tenHasBeenPressed = false;
                          if (_role == 'landlord'){
                            _role = '';
                          } else {
                            _role = 'landlord';
                          }
                        })
                      },
                      child: Text('',
                      style: TextStyle(
                        fontSize: 0
                      ),),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text('Landlord  ',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 20,
                      color: Colors.black, //font color
                    ),
                  )
                ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                SizedBox(width: 145,),
                Container(
                  width: 25,
                  height: 25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: _neigHasBeenPressed ? Color(0xFF48ACBE) : Colors.grey[400],
                      elevation: 3,
                      padding: EdgeInsets.all(20),
                      shape: CircleBorder(),
                    ),
                    onPressed: () => {
                      setState(() {
                        _neigHasBeenPressed = !_neigHasBeenPressed;
                        _landHasBeenPressed = false;
                        _tenHasBeenPressed = false;
                        if (_role == 'neighbor'){
                          _role = '';
                        } else {
                          _role = 'neighbor';
                        }
                      })
                    },
                    child: Text('',
                      style: TextStyle(
                          fontSize: 0
                      ),),
                  ),
                ),
                SizedBox(width: 10,),
                Text('Neighbor ',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 20,
                    color: Colors.black, //font color
                  ),)
              ],
            ),
            SizedBox(height: 12,),
            Row(
              children: [
                SizedBox(width: 145,),
                Container(
                  width: 25,
                  height: 25,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: _tenHasBeenPressed ? Color(0xFF48ACBE) : Colors.grey[400],
                      elevation: 3,
                      padding: EdgeInsets.all(20),
                      shape: CircleBorder(),
                    ),
                    onPressed: () => {
                      setState(() {
                        _tenHasBeenPressed = !_tenHasBeenPressed;
                        _landHasBeenPressed = false;
                        _neigHasBeenPressed = false;
                        if (_role == 'tenant'){
                          _role = '';
                        } else {
                          _role = 'tenant';
                        }
                      })
                    },
                    child: Text('',
                      style: TextStyle(
                          fontSize: 0
                      ),),
                  ),
                ),
                SizedBox(width: 10,),
                Text('Tenant      ',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 20,
                    color: Colors.black, //font color
                  ),)
              ],
            ),
            SizedBox(height: 55,),
            Row(
              children: [
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
                SizedBox(width: 62.5,),
                SizedBox(
                  height: 63,
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
                      if(_role == 'tenant'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
                        );
                      }
                      if(_role == 'neighbor'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => NeighborHome()),
                        );
                      }
                      if(_role == 'landlord'){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeLandlord()),
                        );
                      }
                    },
                    child: Text('Sign Up',
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 20,
                        color: Colors.black, //font color
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ]
        )
        ]
      )
    )
    );
  }
}
