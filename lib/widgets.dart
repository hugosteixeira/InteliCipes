import 'package:flutter/material.dart';
import 'package:projeto_3/assets_handler.dart';
import 'package:image_size_getter/image_size_getter.dart';

import 'infra.dart';

/*class ICscaffold extends StatelessWidget {
  final body;
  final appbar;

  const ICscaffold({Key key, this.appbar, this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: body,
      drawer: _buildDrawer(context),
    );
  }

  _buildAppBar(context) {
    if (this.appbar == Null) {
      return {};
    }
    return AppBar(
      title: Text("InteliCipes"),
    );
  }

  _buildDrawer(context) {
    return;
  }
}*/

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
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Assets.blackColor,
        body: Column(
          children: [
            InteliBar(),
            SizedBox(height: 20,),
            ReceitaDisplay(titulo:null,ingredientes: [null,null],tempo: null,height_main: 230,image: Assets.Placeholder4,),
          ],
        ),
      ),
    );
  }
}

class InteliBar extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helper.getScreenWidth(context),
      height: 80,
      decoration: BoxDecoration(
        color: Assets.redColor,
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
                    icon: Icon(Icons.menu),
                  onPressed: () => Helper.go(context,'/settings'),
                ),
                Spacer(),
                Image(image:Assets.IntelicipesLogo01,
                height: 25,),
                Spacer(),
                Icon(Icons.more_vert),
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
    return size - 20;
    }
    else{
      return size - barSize;
    }
  }
  Color setColor(color){
    if (color == null){
      return Assets.blackColor;
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
                  style: Assets.InriaSans18dim,
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
  final String titulo;
  final List ingredientes;
  final int tempo;
  final double height_main;
  final AssetImage image;
  ReceitaDisplay({this.titulo, this.ingredientes, this.tempo,this.height_main,this.image});
  Widget imageCheck(width){
    if (this.image == null){
      return Container(
        height: height_main-60,
        decoration: BoxDecoration(
          color: Assets.redColor,
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
                              style: Assets.InriaSans25,
                            ),
                            Assets.SmallPaddingBox,
                            Text("$tempo min",
                              style: Assets.InriaSans18dim,
                            ),
                            Icon(Icons.timer,
                              color:Colors.grey,),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),

                        child: Text("$ingredientes".replaceRange(30, "$ingredientes".length, "..."), style: Assets.InriaSans18dim,),
                      )
                    ],
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Icon(Icons.favorite_border,
                      size: 40,
                      color: Assets.redColor,),
                  )

                ],
              ),
              Assets.SmallPaddingBox
            ]
        )
    );
  }
}