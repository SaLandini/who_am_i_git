import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:local_auth/error_codes.dart' as auth_error;
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';

import 'information/information.dart';


class FingerprintApp extends StatefulWidget {
  @override
  _FingerprintAppState createState() => _FingerprintAppState();
}
class _FingerprintAppState extends State<FingerprintApp> {
  LocalAuthentication auth = LocalAuthentication();
  bool _canCheckBiometric;
  List<BiometricType> _avaliableBiometrics;
  String autherized = "Not autherized";

  Future<void> _checkBiometric() async{
    bool canCheckBiometric;
    try {
      canCheckBiometric = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      print(e);
    }
    if(!mounted) return;
    setState(() {
      _canCheckBiometric = canCheckBiometric;
    });
  }

  Future<void> _getAvaliableBiometric() async{
    List<BiometricType> availableBiometric;
    try {
      availableBiometric = await auth.getAvailableBiometrics();
    } on PlatformException catch(e){
      print(e);
    }
    setState(() {
      _avaliableBiometrics = availableBiometric;
    });
  }

  Future<void> _authenticate() async{
    bool authenticated = false;
    try{
      authenticated = await auth.authenticateWithBiometrics(localizedReason: "Deixa o pai ler essa digital",
      useErrorDialogs: true,
      stickyAuth: false);
    } on PlatformException catch(e){
      print(e);
    }
    if (!mounted) return;
    setState(() {
      autherized = authenticated ? "Deu bom":"Num rola";
      if (authenticated){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Information()));
      }
      print(autherized);
    });
  }

  @override
  void initState(){
    _checkBiometric();
    _getAvaliableBiometric();
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
          child: Column(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    child: new MediaQuery(
                      data: new MediaQueryData.fromWindow(ui.window),
                      child: RaisedButton(
                      onPressed: _authenticate,
                        elevation: 0,
                        color: Colors.black87,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 420, horizontal: 24.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 2.0, color: Colors.deepPurpleAccent),
                            ),
                            height: 50,
                            width: 160,
                            child: Text(
                              'Who am I?',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: 'PeachSans',
                                color: Colors.deepPurpleAccent,
                                fontSize: 32,
                              ),
                            ),
                          ),
                          ),
                        ),
                    ),
          )
    ],
    )
    );
  }
}