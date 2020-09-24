import 'package:flutter/material.dart';
import 'package:projeto_3/test_area.dart';
import 'package:projeto_3/widgets.dart';
import 'Receitas.dart';
import 'assets_handler.dart';
import 'infra.dart';

class FoodDisplay extends StatefulWidget {
  final items;

  const FoodDisplay({Key key, this.items}) : super(key: key);
  @override
  FoodDisplayPage createState() {
    return FoodDisplayPage();
  }
}
class FoodDisplayPage extends State<FoodDisplay>{
  final _items = receitaController.getAll();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Assets.whiteColor,
      /*appBar: AppBar(
        title: Center(
          child: Image(image: Assets.Display01,
            height: 25,),
        ),
        actions: [
          Icon(
              Icons.search
          ),
          Icon(
              Icons.more_vert
          )
        ],
      ),*/
      body: Column(
        children: [
          //InteliBar(),
          //SizedBox(height: 5,),
          Container(
            height: Helper.getScreenHeight(context),
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.vertical(top:Radius.circular(40)),
                color: Assets.blackColor,
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  height: 5,
                  width: Helper.getScreenWidth(context)/1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Assets.whiteColor),
                ),
                SizedBox(height: 10,),
                GestureDetector( // Deslizar para baixo para voltar a tela
                  onVerticalDragUpdate: (details) {
                    if(details.delta.dy > 2){
                      Helper.go(context,'/');
                    }
                  },
                  child: Hero( // animaçao entre as telas
                      tag:'searchbar',
                      child:Material(
                        color: Colors.transparent,
                        child: SearchBar(color_main:Assets.whiteColor,color_icon:Assets.blackColor,barSize: 50,),
                      )),
                ),
                Assets.SmallPaddingBox,
                Container(
                  height: Helper.getScreenHeight(context)-85, // se der problema de overflow incremente esse numero
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: _items.length,
                    itemBuilder: _buildListTile,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(context,index){
    var __receita = _items;
    var _receita = __receita[index];
    return ListTile(
        visualDensity: VisualDensity.compact,
        title: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.7),
                offset: Offset(0,3),
                blurRadius: 5
              )
            ]

          ),
          child: ReceitaDisplay(titulo:_receita.titulo,ingredientes:_receita.ingredientes,tempo:_receita.tempo,image: _receita.image,height_main: 230,)




              /*Row(
                children: [
                  Placeholder(
                    fallbackHeight: 50,
                    fallbackWidth: 50,
                  ),
                  SizedBox(
                    width: 20,
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${_receita.titulo}",
                        style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      Text("Ingredientes necessarios: ${_receita.nIngredientes}"),
                      Text("Tempo de preparo: ${_receita.tempo}"),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: Helper.getScreenWidth(context),
                  height: 1,
                  child: Container(
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),*/
        ),
      );
    }

  
}