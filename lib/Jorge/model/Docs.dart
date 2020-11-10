
class Document {
  //atributos
  int _id;
  String _doc;
  String _num;

  //contrutor
  Document(this._doc, this._num);

  //getter
  int get id => _id;
  String get doc => _doc;
  String get num => _num;

  //setter
  set id(int value) {
    _id = value;
  }
  set doc(String value) {
    _doc = value;
  }
  set num(String value) {
    _num = value;
  }

  //Model => Map
  Map<String,dynamic> toMap() {
    var map = Map<String, dynamic>();

    map['id'] = _id;
    map['doc'] = _doc;
    map['num'] = _num;

    return map;
  }

  //Map => Model
  Document.deMapParaObjeto(Map<String, dynamic> map){
    this._id = map['id'];
    this._doc = map['doc'];
    this._num = map['num'];
  }
}