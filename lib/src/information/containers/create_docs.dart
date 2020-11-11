import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:who_am_i/Jorge/model/Docs.dart';
import 'package:who_am_i/Jorge/provider/docs.dart';

class CreateDocs extends StatefulWidget{
  @override
  _CreateDocsState createState() => _CreateDocsState();
}

class _CreateDocsState extends State<CreateDocs> {
  final _form = GlobalKey<FormState>();

  final Map<String, String> _formData = {};

  void _loadFormData(Document docs){
    if (docs != null) {
      _formData['id'] = docs.id;
      _formData['doc'] = docs.doc;
      _formData['num'] = docs.num;
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    final Document doc = ModalRoute.of(context).settings.arguments;
    _loadFormData(doc);
    return Material(
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.all(30),
            child:Container(
                width: double.infinity,
                decoration: BoxDecoration(
                color: Colors.white
              ),
            child:Column(
                children: <Widget>[
                  Form(
                    key: _form,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        initialValue: _formData['doc'],
                        decoration: InputDecoration(labelText: 'Documento'),
                        onSaved: (value) => _formData['doc'] = value,
                      ),
                      TextFormField(
                        initialValue: _formData['num'],
                        decoration: InputDecoration(labelText: 'Numero do doc'),
                        onSaved: (value) => _formData['num'] = value,
                      )
                    ],
                  ),
                ),
                  FlatButton(
                    child: Padding(
                        padding: EdgeInsets.only(top: 600),
                        child: Icon(Icons.save, color: Colors.deepPurpleAccent, size: 50,)),
                    onPressed: (){
                      _form.currentState.save();
                      Provider.of<Docs>(context, listen: false).put(Document(
                        id: _formData['id'],
                        doc:_formData['doc'],
                        num: _formData['num']
                      ),
                      );
                      Navigator.of(context).pop();
                    },
                  )
              ]
            )
        )
      )
    );
  }
}