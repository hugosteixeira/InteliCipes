import 'package:flutter/material.dart';
import 'package:projeto_3/infra.dart';
import 'package:projeto_3/widgets.dart';
import 'assets_handler.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Assets.whiteColor,
      /*appBar: AppBar(
        title: Row(
          children: [
            Spacer(),
            Image(image: Assets.IntelicipesLogo01,
            height: 25,),
            SizedBox(width: 20,)
          ],
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                icon: Icon(Icons.search),
                onPressed: () => print("this"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(
                Icons.more_vert
              ),
              onPressed: () => Helper.go(context,'/settings'),
            ),
          )

        ],
      ),*/

      /*floatingActionButton:GestureDetector(
        child: FloatingActionButton(
          onPressed: () => Helper.go(context,'/food_display'),
          child: Icon(Icons.search),
        ),
      ) ,*/
      body: Column(
        children: [
          InteliBar(),
          Assets.SmallPaddingBox,
          Hero(
              tag: 'searchbar',
              child: Material(
                color: Colors.transparent,
                child:
                  SearchBar(color_icon:Assets.whiteColor),
              )
          ),
          Placeholder(),
        ],
      ),
    );
  }
}
