import 'package:flutter/material.dart';

class DatasImportantes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 900,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Datas Importantes:',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Oxygen',
                    color: Colors.deepPurpleAccent,)),
              SizedBox(height: 20,),
              new Container(
                  width: 900,
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.deepPurpleAccent,
                          width: 1.0,),)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12,),
                        Text(
                            """
                          Data: 
                              - ??/??\n
                          Data: 
                              - ??/??\n
                          """,
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Noto',
                              color: Colors.white,)
                        )
                      ])
              )
            ]
        )
    );
  }
}