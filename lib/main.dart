import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Home()
));


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Image.asset('assets/img.png'),
      ),
      floatingActionButton: Wrap( //will break to another line on overflow
        direction: Axis.vertical,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Image.asset('assets/profile.jpeg'),
          ),
          Container(
              margin: EdgeInsets.only(left: 182),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.lightBlue
                ),
                onPressed: (){},
                child: Text('Sign In'),
              )
          ),
          Container(
              margin:EdgeInsets.only(left: 180, bottom: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue
                ),
                onPressed: (){},
                child: Text('Sign Up'),
              )
          ),
        ],
      ),
    );
  }
}
