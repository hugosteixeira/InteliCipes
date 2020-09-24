import 'package:flutter/material.dart';
import 'package:projeto_3/blocs/theme.dart';
import 'package:provider/provider.dart';

import 'infra.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    ThemeChanger _themeChanger = Provider.of<ThemeChanger>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.search
          ),
          SizedBox(
            width: 30,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Row(
              children: [
                RaisedButton(
                  onPressed: ()=>_themeChanger.setTheme(Themes.themed),
                  child: Text("dark Theme"),
                ),
                Spacer(),
                RaisedButton(
                  onPressed: ()=>_themeChanger.setTheme(Themes.themel),
                  child: Text("light Theme"),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(50),
            child: Row(
              children: [
                RaisedButton(
                  onPressed: ()=> Helper.go(context,'/test_area'),
                  child: Text("test area 1")
                ),
                RaisedButton(
                  onPressed: ()=> Helper.go(context,'/test_area2'),
                  child: Text("test area 2")
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}