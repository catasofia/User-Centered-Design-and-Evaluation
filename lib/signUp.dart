import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_app/contract_linking.dart';

import 'landlord/landlordHomeScreen.dart';
import 'neighbor/neighborHomeScreen.dart';
import 'tenant/tenantHomescreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Widget _buildPopupWarning(BuildContext context) {
    return AlertDialog(
      alignment: Alignment.center,
      title: const Text(
        'Important Warning',
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
        children: <Widget>[
          Center(
            child: Text(
              "This app uses blockchain to make sure that the information presented is trustworthy. "
              "By continuing, it is implied that you agree and have this information in mind.",
              style: TextStyle(
                fontFamily: 'Arial',
                fontSize: 20,
                letterSpacing: 0.5,
                color: Colors.black,
                //height: 1,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: 80,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0x006D77),
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    if (_role == 'tenant') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    }
                    if (_role == 'neighbor') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NeighborHome()),
                      );
                    }
                    if (_role == 'landlord') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeLandlord()),
                      );
                    }
                  },
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 18,
                      letterSpacing: 0.5,
                    ),
                  )),
              SizedBox(
                width: 6,
              ),
              new FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                textColor: Theme.of(context).primaryColor,
                child: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.black,
                  size: 33.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  bool _landHasBeenPressed = false;
  bool _neigHasBeenPressed = false;
  bool _tenHasBeenPressed = false;
  String _role = '';

  @override
  Widget build(BuildContext context) {
    final contractLink = Provider.of<ContractLinking>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Center(
            child: contractLink.isLoading
                ? CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Image.asset(
                          'assets/buildingsSmaller.jpg',
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 190, 0, 0),
                          child: Image.asset(
                            'assets/logoS.jpg',
                            height: 110,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      "Sign up as",
                      style: TextStyle(
                        fontFamily: "Arial",
                        color: Colors.black,
                        fontSize: 25.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 145,
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: _landHasBeenPressed
                                  ? Color(0xFF48ACBE)
                                  : Colors.grey[400],
                              elevation: 3,
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                            ),
                            onPressed: () => {
                              setState(() {
                                _landHasBeenPressed = !_landHasBeenPressed;
                                _neigHasBeenPressed = false;
                                _tenHasBeenPressed = false;
                                if (_role == 'landlord') {
                                  _role = '';
                                } else {
                                  _role = 'landlord';
                                }
                              })
                            },
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Landlord  ',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Colors.black, //font color
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 145,
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: _neigHasBeenPressed
                                  ? Color(0xFF48ACBE)
                                  : Colors.grey[400],
                              elevation: 3,
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                            ),
                            onPressed: () => {
                              setState(() {
                                _neigHasBeenPressed = !_neigHasBeenPressed;
                                _landHasBeenPressed = false;
                                _tenHasBeenPressed = false;
                                if (_role == 'neighbor') {
                                  _role = '';
                                } else {
                                  _role = 'neighbor';
                                }
                              })
                            },
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Neighbor ',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Colors.black, //font color
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 145,
                        ),
                        Container(
                          width: 25,
                          height: 25,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: _tenHasBeenPressed
                                  ? Color(0xFF48ACBE)
                                  : Colors.grey[400],
                              elevation: 3,
                              padding: EdgeInsets.all(20),
                              shape: CircleBorder(),
                            ),
                            onPressed: () => {
                              setState(() {
                                _tenHasBeenPressed = !_tenHasBeenPressed;
                                _landHasBeenPressed = false;
                                _neigHasBeenPressed = false;
                                if (_role == 'tenant') {
                                  _role = '';
                                } else {
                                  _role = 'tenant';
                                }
                              })
                            },
                            child: Text(
                              '',
                              style: TextStyle(fontSize: 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Tenant      ',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 20,
                            color: Colors.black, //font color
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Row(
                        children: [
                          Center(
                            child: SizedBox(
                              height: 63,
                              width: 150,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFF48ACBE),
                                  elevation: 3,
                                  padding: EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                ),
                                onPressed: () {
                                  if (_role == 'tenant') {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildPopupWarning(context),
                                    );
                                  }
                                  if (_role == 'neighbor') {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildPopupWarning(context),
                                    );
                                  }
                                  if (_role == 'landlord') {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          _buildPopupWarning(context),
                                    );
                                  }
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    fontFamily: 'Arial',
                                    fontSize: 20,
                                    color: Colors.black, //font color
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ])
                  ]))),
      ),
    );
  }
}
