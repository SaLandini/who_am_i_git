import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Jorge/model/Docs.dart';
import '../../../Jorge/utils/DocsHelper.dart';

class MiDocs extends StatefulWidget{
  @override
  _MiDocState createState() => _MiDocState();
}

class _MiDocState extends State<MiDocs>{

  TextEditingController txtdoc = TextEditingController();
  TextEditingController txtnum = TextEditingController();

  List<Document> listadocs = List<Document>();
  DocumentHelpers _db = DocumentHelpers();

  void SalvarDoc({Document DocSelect}) {
    setState(() async{
      if (DocSelect == null){
        Document obj = Document(txtdoc.text, txtnum.text);

        var resultado =  await _db.inserirDocs(obj);

        if (resultado != null) {
          print("Fez o cadastro");
        } else {
          print("Num rolou");
        }
      } else {
        DocSelect.doc = txtdoc.text;
        DocSelect.num = txtnum.text;

        int resultado = await _db.alterarDoc(DocSelect);
        if (resultado != null) {
          print("Fez a alteração");
        } else {
          print("Num rolou");
        }

      }
      retornaDocs();

    });
  }
  Future<void> retornaDocs() async{
    List docs = await _db.listarDocs();
    List<Document> listatemp = List<Document>();
    for(var i in docs){
      Document d = Document.deMapParaObjeto(i);
      listatemp.add(d);
    }
    setState((){
      listadocs = listatemp;
    });
    listatemp = null;
  }

  @override
  void initState(){

    super.initState();
    retornaDocs();
  }

  @override
  Widget build(BuildContext context) {
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
                    itemCount: listadocs.length,
                    itemBuilder: (context, index){
                    Document obj = listadocs[index];
                    return Expanded(
                      child: ListTile(
                        title: Text(obj.doc,
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Noto',
                          color: Colors.white,)),
                        subtitle: Text(obj.num,
                         style: TextStyle(
                         fontSize: 14,
                         fontFamily: 'Noto',
                          color: Colors.blueGrey,)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            GestureDetector(
                              onTap: (){
                                remove(obj.id);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(Icons.delete, color: Colors.deepPurpleAccent,),
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                exibirTelinha(Documento: obj);
                              },
                              child: Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(Icons.edit, color: Colors.deepPurpleAccent,),
                              ),
                            ),
                          ],
                        ),
                      )
                  );
                }
              )
            )
          ],
              ),
          ),

    FlatButton(
        onPressed: exibirTelinha,
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
  void remove(int id) async{
    int resultado = await _db.excluitDocs(id);
    retornaDocs();
  }

  void exibirTelinha({Document Documento}) async {

    if(Documento == null){

    } else {
      txtdoc.text = Documento.doc;
      txtnum.text = Documento.num;
    }

    showDialog(context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("Add/Edit Docs"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        TextField(
                          controller: txtdoc,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: "tipo de doc",
                          ),
                        ),
                        TextField(
                          controller: txtnum,
                          autofocus: true,
                          decoration: InputDecoration(
                            labelText: "num de doc",
                          ),
                        ),
                      ]),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Salva ae'),
                          onPressed: (){
                            SalvarDoc(DocSelect: Documento);
                            Navigator.pop(context);
                          },
                        ),
                        FlatButton(
                          child: Text('Cancela ae'),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        )
                    ],
                    );
                });
  }

}