import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projeto_3/assets_handler.dart';
import 'infra.dart';

class searchBar extends StatefulWidget{
  @override
  _searchBar createState() {
    return _searchBar();
  }
}
class _searchBar extends State<searchBar>{

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey,
      child: Scaffold(
        backgroundColor: Assets.whiteColor,
        body: Column(
          children: [
            InteliBar(
              leftIcon: Icons.arrow_back,
              leftPath: '/',
            ),
            SizedBox(height: 20,),
            ColectionBar(),
            TextBar(texto: 'teste',color: Assets.blackColorPlaceholder,padding: 3,)
            //ReceitaDisplay(titulo:null,ingredientes: [null,null],tempo: null,height_main: 230,image: Assets.Placeholder4,),
          ],
        ),
      ),
    );
  }
}

class InteliBar extends StatelessWidget{
  Color color;
  IconData leftIcon;
  String leftPath;
  IconData rightIcon;
  String rightPath;
  var title;
  InteliBar({this.color,this.leftIcon,this.leftPath,this.rightIcon,this.rightPath,this.title});

  Color setColor(color,placeholder){ // aplica um placeholder
    if (color == null){
      //print('InteliBar setColor = Placeholder');
      print(color);
      return placeholder;
    }
    else{
      return color;
    }
  }
  setIcon(icon,placeholder){ // aplica um placeholder
    if (icon == null){
      //print('InteliBar setIcon = Placeholder');
      return placeholder;
    }
    else{
      return Icon(icon);
    }
  }
  setTitle(title,placeholder){
    if (title == null){
      //print('InteliBar setTitle = Placeholder');
      return placeholder;
    }
    else{
      return title;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helper.getScreenWidth(context),
      height: 80,
      decoration: BoxDecoration(
        color: setColor(color,Assets.redColorPlaceholder),// placeholder : Assets.redColorPlaceholder
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 20,),
            Row(
              children: [
                SizedBox(width: 15,),
                IconButton(
                    icon: setIcon(leftIcon, Icon(Icons.menu)),// placeholder : Icon(Icons.menu),
                  onPressed: () => Helper.goReplace(context,leftPath),
                ),
                Spacer(),
                setTitle( title, Image(image:Assets.IntelicipesLogo01,height: 25,)), /*Image(image:Assets.IntelicipesLogo01,height: 25,),*/
                Spacer(),
                IconButton(
                  icon: setIcon(rightIcon, Icon(Icons.more_vert)),// placeholder : Icon(Icons.more_vert),
                  onPressed: ()=> Helper.goReplace(context,rightPath),
                ),
                SizedBox(width: 15,),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
class SearchBar extends StatelessWidget {
  Color color_main;
  Color color_icon;
  double barSize;
  SearchBar({this.color_main,this.color_icon,this.barSize});

  double setBarSize(size){
    if (barSize == null){
      //print('SearchBar barSize = Placeholder');
      return size - 20;
    }
    else{
      return size - barSize;
    }
  }
  Color setColor(color){
    if (color == null){
      //print('SearchBar color = blackColorPlaceholder');
      return Assets.blackColorPlaceholder;
    }
    else{
      return color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: setBarSize(Helper.getScreenWidth(context)),
        height: 40,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: setColor(color_main)
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [

                  Text("Pesquisar...",
                  style: Assets.inriaSans18dim,
                ),
                Spacer(),
                Icon(Icons.search,
                color: setColor(color_icon)),
                ]
              ),
            ),
          ]
        ),
      ),
      onTap: () => Helper.go(context,'/food_display'),
    );
  }
}
class ReceitaDisplay extends StatelessWidget {
  String titulo;
  List ingredientes;
  int tempo;
  double height_main;
  AssetImage image;
  Color iconColor;

  ReceitaDisplay({this.titulo, this.ingredientes, this.tempo,this.height_main,this.image,this.iconColor});
  Widget imageCheck(width){
    if (this.image == null){
      return Container(
        height: height_main-60,
        decoration: BoxDecoration(
          color: Assets.blueColor,
        ),
      );
    }
    else{
      return
          Image.asset(image.assetName,
            scale: 0.3,
            width: width,
      );
    }
  }
  setColor(color){
    if (color == null) return Assets.redColorPlaceholder;
    else return color;
}
  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        width: Helper.getScreenWidth(context),
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(
              blurRadius: 15,
            ),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(30),
            )
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              imageCheck(Helper.getScreenWidth(context)),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Text("${this.titulo}",
                              style: Assets.inriaSans25,
                            ),
                            Assets.smallPaddingBox,
                            Text("$tempo min",
                              style: Assets.inriaSans18dim,
                            ),
                            Icon(Icons.timer,
                              color:Colors.grey,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),

                        child: Text("$ingredientes".replaceRange(30, "$ingredientes".length, "..."), style: Assets.inriaSans18dim,),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(Icons.favorite_border,
                      size: 40,
                      color: setColor(iconColor)),
                  )

                ],
              ),
              Assets.smallPaddingBox
            ]
        )
    );
  }
}

class TextBar extends StatelessWidget{
  Color color;
  String texto;
  double padding;
  TextStyle style;

  TextBar({this.color,this.texto,this.padding,this.style});

  setPadding(padding){
    if (padding == null){
      return 2;
    }
    else return padding;
  }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(texto,
        style: style
        ),
      )
    );
  }

}
class ColectionItem extends StatelessWidget{
  AssetImage image;
  ColectionItem({this.image});
  setImage(image){
    if (image == null){
      return Container(
        color:Assets.whiteColor,
        height: 80,
        width: 80,
      );
    }
    else{
      return image;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      width: 80,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Assets.whiteColor
      ),
      child: setImage(image),
    );
  }
}
class ColectionBar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Assets.darkGreyColor,
        ),
        height: 110,
        width: Helper.getScreenWidth(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              color: Colors.transparent,
              child: Container(
                height: 110,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: _ListBuilder
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _ListBuilder(context,index){
    return Container(
      child: Column(
        children: [
          SizedBox(height: 5,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: ColectionItem(),
          ),
          SizedBox(height: 5,),
          TextBar(
            color:Colors.white,
            texto: "categoria $index",
            padding: 2,
            style: InriaSansStyle(
              color: Assets.darkGreyColor,
              size: 10,
            ).get(),
          )
        ],
      ),
    );
  }
}