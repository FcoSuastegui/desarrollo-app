

import 'package:flutter/material.dart';

class Iconos {

  static final Iconos _instancia  = new Iconos._internal();
  
  factory Iconos() { return _instancia; }

  Iconos._internal();

  icono( { String icono = 'home', double size = 25.0, dynamic color = Colors.white }) {
      Map <String, dynamic> icon = {
        'home'            : Icon(Icons.home, color: color, size: size),
        'person_outline'  : Icon(Icons.person_outline, color: color, size: size),
        'announcement'    : Icon(Icons.announcement, color: color, size: size),
        'attach_money'    : Icon(Icons.attach_money, color: color, size: size),
        'assignment'      : Icon(Icons.assignment, color: color, size: size),
        'thumbs_up_down'  : Icon(Icons.thumbs_up_down, color: color, size: size),
        'library_books'   : Icon(Icons.library_books, color: color, size: size),
        'exit_to_app'     : Icon(Icons.exit_to_app, color: color, size: size),
        'cumpleanos'      : Icon(Icons.cake, color: color, size: size),
        'saldo'           : Icon(Icons.monetization_on, color: color, size: size)
      };
    return icon[icono];
  }

}