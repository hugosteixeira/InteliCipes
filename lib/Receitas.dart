import 'package:flutter/cupertino.dart';

class Receita{
  int id,tempo,nIngredientes;
  String titulo,tipo;
  List ingredientes;
  AssetImage image;
  Receita({this.id,this.titulo,this.tipo,this.tempo,this.nIngredientes,this.ingredientes,this.image});

}
var receitaController = ReceitaController();

class ReceitaController{
  var _nextid = 1;
  var _receitas = <Receita>[];

  List<Receita> getAll(){
    //print(_receitas);
    return _receitas;
  }
  List getByTipo(String tipo){
    List temp;
    for(Receita p in _receitas){
      if (p.tipo == tipo){
        temp.add(p);
      }
      return temp;
    }
  }
  void save(receita){
    if (receita.id == null){
      receita.id == _nextid++;
      _receitas.add(receita);
    }
    print(receita);
    return receita;
  }
}