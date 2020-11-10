import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import '../model/Docs.dart';

class DocumentHelpers{
  // Banco de dados
  String nomeTabela = 'Documentos';
  String colID = 'id';
  String colDoc = 'Doc';
  String colNum = 'Num';

  static DocumentHelpers _documentHelper;
  static Database _database;

  DocumentHelpers._createInstance();

  factory DocumentHelpers(){
    if (_database == null){
      _documentHelper = DocumentHelpers._createInstance();
    }
    return _documentHelper;
  }

  Future<Database> get database async{
    if (_database == null){
      _database = await inicializaBanco();
    }
    return _database;
  }

  Future<Database> inicializaBanco() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String caminho = directory.path + 'JorgeBD.db';

    var bancodedados = await openDatabase(
      caminho, version: 1, onCreate: _criaBanco
    );

    return bancodedados;
  }

  void _criaBanco(Database db, int versao) async{
    await db.execute('CREATE TABLE $nomeTabela('
                    '$colID INTEGER PRIMARY KEY AUTOINCREMENT,'
                    '$colDoc TEXT,'
                    '$colNum TEXT)'
    );
  }

  //Crud
  // cadastro
   Future<int> inserirDocs(Document obj) async{
     Database db = await this.database;
     var resultado = await db.insert(nomeTabela, obj.toMap());
     return resultado;
   }

  // lista
  listarDocs() async {
    Database db = await this.database;
    String sql = "SELECT * FROM $nomeTabela";
    List listadocs = await db.rawQuery(sql);
    return listadocs;
  }
  // edita
  Future<int> alterarDoc(Document obj) async{
    Database db = await this.database;
    var resultado = await db.update(nomeTabela, obj.toMap(), where: "id = ?", whereArgs: [obj.id]);
    return resultado;
  }
  // excluir
  Future<int> excluitDocs(int id) async{
    Database db = await this.database;
    var resultado = await db.delete(nomeTabela, where: 'id = ?', whereArgs: [id]);
    return resultado;
  }
}