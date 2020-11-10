
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Remedio extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Remedios:',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: TextStyle(
                fontSize: 16,
                fontFamily: 'Oxygen',
                color: Colors.deepPurpleAccent,)
              ),
              SizedBox(height: 20,),
              new Container(
                width: 900,
                decoration: BoxDecoration(
                border: Border(
                top: BorderSide(
                color: Colors.deepPurpleAccent,
                width: 1.0,),)),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20,),
                    Text("""Periodo 1:
                         - Genérico;
                         - Genérico""",
                         style: TextStyle(
                             color: Colors.white,
                             fontFamily: "Noto"),
                         textDirection: TextDirection.ltr,
                         textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20,),
                    Text("""Periodo 2:
                            - Genérico;
                            - Genérico""",
                      style: TextStyle(
                          color: Colors.purple,
                          fontFamily: "Noto"),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(height: 20,),
                    Text("""Periodo 3:
                            - Genérico;
                            - Genérico""",
                      style: TextStyle(
                          color: Colors.pinkAccent,
                          fontFamily: "Noto"),
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.left,
                    )
                  ],
                )
              )
            ]
          )
    );
  }
}