import 'dart:math';

import 'package:flutter/material.dart';
import 'package:who_am_i/Jorge/data/dummy_docs.dart';
import 'package:who_am_i/Jorge/model/Docs.dart';

class Docs with ChangeNotifier{
  final Map<String, Document> _item = {...DUMMY_DOCS};

  List<Document> get all {
    return [..._item.values];
  }

  int get count {
    return _item.length;
  }

  Document byIndex(int i){
    return _item.values.elementAt(i);
  }

  void put(Document doc){
    if (doc == null){
      return;
    }
    if (doc.id != null && doc.id.trim().isNotEmpty && _item.containsKey(doc.id)){
      _item.update(doc.id, (value) => Document(
        id: doc.id,
        doc: doc.doc,
        num: doc.num
      ));
    }else {
      final id = Random().nextDouble().toString();
      _item.putIfAbsent(id, () =>
          Document(
              id: id,
              doc: doc.doc,
              num: doc.num
          ));
    }
    notifyListeners();
  }

  void remove(Document doc){
    if (doc != null && doc.id !=null){
     _item.remove(doc.id);
     notifyListeners();
    }
  }
}