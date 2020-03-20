import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


const String urlProvider    = 'http://qa.midesarrollo.com.mx/';
const String serverProvider = '${urlProvider}server/api';


class ScreenArguments {
  final String title;
  final String message;
  ScreenArguments(this.title, this.message);
}

void navigatorLaunch( String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

bool validarUrl( url) {
  bool error = false;
  Pattern pattern = r'^((?:.|\n)*?)((http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?)';
      RegExp regExp = new RegExp(pattern);

      if( !regExp.hasMatch(url) )
          error = true;
  return error;
}


void mensajeAlerta( BuildContext context, String mensaje) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Información incorrecta'),
        content: Text(mensaje),
        actions: <Widget>[
          FlatButton(
            child: Text('Ok'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      );
    }
  );
}
