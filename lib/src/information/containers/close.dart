import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Close extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 2.0, color: Colors.deepPurpleAccent),
      ),
      child: FlatButton(
          child: Text(
            'Close',
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'PeachSans',
              color: Colors.deepPurpleAccent,
            ),
          ),
          onPressed: () {Navigator.pop(context);}
      ),
    );
  }
}