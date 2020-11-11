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
                          Alprazolam: Acaba: 
                              - 13/11\n
                          Isotretinoína: Acaba: 
                              - 16/11\n
                          Sertralina: Acaba: 
                              - 02/12\n
                          Quetiapina: Acaba: 
                              - 28/12\n
                          Fuvest 1º Fase:
                              - 10/1/2021 \n
                          Fuvest 2º Fase:
                              -  21/2/2021 \n
                          Fuvest 2º Fase:
                              -  22/2/2021 \n
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