import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:in_app_localisation/app_translations_delegate.dart';
import 'package:in_app_localisation/application.dart';
import 'package:in_app_localisation/language_selector_icon_button.dart';

void main() {
  runApp(LocalisedApp());
}

class LocalisedApp extends StatefulWidget {
  @override
  LocalisedAppState createState() {
    return new LocalisedAppState();
  }
}

class LocalisedAppState extends State<LocalisedApp> {
  var _streamController;
  StreamSink<AppTranslationsDelegate> _localStream;

  @override
  void initState() {
    super.initState();
    _streamController = StreamController<AppTranslationsDelegate>();
    _localStream = _streamController.sink;
    application.onLocaleChanged = onLocaleChange;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _streamController.stream,
      initialData: AppTranslationsDelegate(newLocale: Locale("en", "")),
      builder: (_, snapshot) {
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
          localizationsDelegates: [
            snapshot.data,
            //provides localised strings
            GlobalMaterialLocalizations.delegate,
            //provides RTL support
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale("en", ""),
            const Locale("es", ""),
          ],
        );
      },
    );
  }

  void onLocaleChange(Locale locale) {
    _localStream.add(AppTranslationsDelegate(newLocale: locale));
  }

  @override
  void dispose() {
    super.dispose();
    _streamController?.close();
  }
}
