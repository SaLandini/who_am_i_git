import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_am_i/Jorge/provider/docs.dart';
import 'package:who_am_i/src/routes.dart';

class MiDocs extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final Docs docs = Provider.of(context);
    return SingleChildScrollView(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Docs:',
          textDirection: TextDirection.ltr,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Oxygen',
            color: Colors.deepPurpleAccent,
          )),
          SizedBox(height: 20,),
          new Container(
            width: 900,
            decoration: BoxDecoration(
            border: Border(
            top: BorderSide(
            color: Colors.deepPurpleAccent,
            width: 1.0,),)),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   Container(
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: docs.count,
                      itemBuilder: (context, i) => ListTile(
                          title: Text( docs.byIndex(i).doc,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Noto',
                            color: Colors.white,)),
                          subtitle: Text( docs.byIndex(i).num,
                           style: TextStyle(
                           fontSize: 14,
                           fontFamily: 'Noto',
                            color: Colors.blueGrey,)),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              GestureDetector(
                                onTap: (){
                                  Provider.of<Docs>(context, listen: false).remove(docs.byIndex(i));
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Icon(Icons.delete, color: Colors.deepPurpleAccent,),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Navigator.of(context).pushNamed(AppRoutes.CREATEDOCS,
                                      arguments: docs);

                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 16),
                                  child: Icon(Icons.edit, color: Colors.deepPurpleAccent,),
                                ),
                              ),
                            ],
                          ),
                        )
                    )
                ),

                ]
              )

          ),
    FlatButton(
        onPressed: () {
          Navigator.of(context).pushNamed(
              AppRoutes.CREATEDOCS
          );
        },
        child: Text(
              'Cria ae',
              style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'PeachSans',
                    color: Colors.deepPurpleAccent,
              )
            )
          )
        ]
      )
    );
  }

}
