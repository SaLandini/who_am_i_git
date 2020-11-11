
import 'package:flutter/cupertino.dart';

class Document {
  //atributos
  final String id;
  final String doc;
  final String num;

  const Document({
    this.id,
    @required this.doc,
    @required this.num
  });
}