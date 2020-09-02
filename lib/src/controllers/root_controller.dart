
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/routes/routes.dart';

class RootController extends GetxController {
  RootController._internal();
  static RootController _instance = RootController._internal();
  static RootController get instance => _instance;

  String _route = GetStorages.instance.validarToken();
  String get route => _route;

  List<GetPage> _routes = Routes.instance.routes;
  List<GetPage> get routes => _routes;

  ThemeData _theme = ThemeData(
    textTheme: GoogleFonts.quicksandTextTheme(),
    primaryColor: CustomColors.primaryColor,
    backgroundColor: CustomColors.secondColor
  );

  ThemeData get theme => _theme;

  @override
  void onInit() {
    super.onInit();
  }
  
}