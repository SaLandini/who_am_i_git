import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_am_i/Jorge/provider/docs.dart';

import 'containers/name_row.dart';
import 'containers/remedio.dart';
import 'containers/docs.dart';
import 'containers/consultas.dart';
import 'containers/datas_importantes.dart';

import 'containers/close.dart';

class Information extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Docs(),
        )
      ],
      child: SingleChildScrollView(
          child:  Material(
              color: Colors.black,
              child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100),
                  child:Container(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        new Container(
                          child: NamePicture(),
                        ),
                        SizedBox(height: 40,),
                        new Container(
                          child: Remedio(),
                        ),
                        SizedBox(height: 20,),
                        new Container(
                          child: Consultas(),
                        ),
                        SizedBox(height: 20,),
                        new Container(
                          child: DatasImportantes(),
                        ),
                        SizedBox(height: 20,),
                        new Container(
                          child: MiDocs(),
                        ),
                        SizedBox(height: 50),
                        new Container(
                          child: Close(),
                        )
                      ],
                    ),
                  )
              )
          )
      ),
    );
  }
}