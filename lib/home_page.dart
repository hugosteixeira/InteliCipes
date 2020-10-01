import 'package:flutter/material.dart';
import 'package:projeto_3/infra.dart';
import 'package:projeto_3/widgets.dart';
import 'assets_handler.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Assets.whiteColor,
      body: Column(
        children: [
          Hero(
            tag: 'intelibar',
            child: Material(
              color: Colors.transparent,
              child: InteliBar(
                color: Assets.blueColor,
                rightPath: '/settings',
              ),
            ),
          ),
          Assets.smallPaddingBox,
          Hero(
              tag: 'searchbar',
              child: Material(
                color: Colors.transparent,
                child:
                  SearchBar(
                    color_icon:Assets.whiteColor,
                    color_main: Assets.darkGreyColor,
                  ),
              )
          ),
          Assets.smallPaddingBox,
          Row(
            children: [
              Assets.smallPaddingBox,
              TextBar(
                texto: "Categorias",
                color: Assets.darkGreyColor,
                padding: 2,
                style: InriaSansStyle(
                  color: Assets.whiteColor,
                  size: 13,
                ).get(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4,left: 8,right: 8,bottom: 8),
            child: ColectionBar(),
          ),//ColectionBar
          RecommendedDisplay(),
        ],
      ),
    );
  }
}
