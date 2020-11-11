import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NamePicture extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage('assets/images/test.png'),
              ),
              borderRadius: BorderRadius.all(Radius.circular(40.0))
            ),
          ),
          new Container(
            width: 300,
            height: 100,
            child: Text(
              """
              Rafael Salandin Moraes;\n
              16 anos - 09/09/2004\n
              """,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Noto',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}