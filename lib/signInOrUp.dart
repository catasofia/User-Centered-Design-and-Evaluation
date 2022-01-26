import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_app/contract_linking.dart';

import 'signUp.dart';

class Signs extends StatefulWidget {
  const Signs({Key? key}) : super(key: key);

  @override
  _SignsState createState() => _SignsState();
}

class _SignsState extends State<Signs> {
  @override
  Widget build(BuildContext context) {
    final contractLink = Provider.of<ContractLinking>(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Center(
              child: contractLink.isLoading
                  ? CircularProgressIndicator()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/buildingsSmaller.jpg',
                            fit: BoxFit.fill,
                          ),
                          Image.asset(
                            'assets/logo.jpeg',
                            height: 150,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 75,
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
                                contractLink.evaluateRate("foenofn", new BigInt.from(2));
                              },
                              child: Text(
                                "${contractLink.rate}",
                                style: TextStyle(
                                  fontFamily: 'Arial',
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 75,
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()),
                                );
                              },
                              child: Text(
                                'Sign Up',
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
                    )),
        ));
  }
}
