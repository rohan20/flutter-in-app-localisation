import 'package:flutter/material.dart';
import 'package:in_app_localisation/language_selector_icon_button.dart';

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
            LanguageSelectorIconButton(),
          ],
          title: Text("Localised App"),
        ),
        body: Container(),
      ),
    );
  }
}
