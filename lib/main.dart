import 'package:flutter/material.dart';

void main() {
  runApp(LocalisedApp());
}

class LocalisedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(
              Icons.settings,
              color: Colors.white,
            ))
          ],
          title: Text("Localised App"),
        ),
        body: Container(),
      ),
    );
  }
}
