import 'package:flutter/material.dart';

import 'assets_handler.dart';
import 'infra.dart';

/*class TestAreaState extends StatefulWidget {

  @override
  WidgetDisplay createState() => WidgetDisplay();
}*/

class WidgetDisplay extends StatelessWidget {
  final String titulo;
  final List ingredientes;
  final int tempo;
  WidgetDisplay(this.titulo, this.ingredientes, this.tempo);

  @override
  Widget build(BuildContext context) {
    return Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: Helper.getScreenWidth(context),
                  height: Helper.getScreenHeight(context)/2.5,
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
                      Container(
                        height: Helper.getScreenHeight(context)/3.4,
                        decoration: BoxDecoration(
                          color: Assets.redColorPlaceholder,
                          ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${this.titulo}",
                            style: Assets.inriaSans25,
                            ),
                          ),
                          Text("$tempo min",
                          style: Assets.inriaSans18dim,
                          ),
                          Icon(Icons.timer,
                          color:Colors.grey,),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Icon(Icons.favorite_border,
                            size: 40,
                            color: Assets.redColorPlaceholder,),
                          )

                        ],
                      ),
                    ]
    )
    );
  }
}

