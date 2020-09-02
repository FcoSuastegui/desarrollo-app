import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Informacion {
  static final logo = Align(
    alignment: Alignment.topLeft,
    child: Image.asset(
      "assets/images/midesarrollo_logo.png",
      width: 100.0,
      height: 60.0,
    ),
  );

  static final footer = Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text("Powered by", style: TextStyle(color: Colors.grey)),
      Image.asset(
        "assets/images/apleeks_01.png",
        width: 90.0,
        height: 90.0,
      )
    ],
  );

  static final banner = Container(
    margin: EdgeInsets.only(top: 0.0),
    child: Container(
      height: Get.height * 0.32,
      width: Get.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/midesarrollo_01.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        colors: [
          Colors.teal[800],
          Colors.teal[200],
        ],
      ),
    ),
  );
}
