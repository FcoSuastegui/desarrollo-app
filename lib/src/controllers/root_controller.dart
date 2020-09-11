import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:midesarrollo/src/controllers/firebase_notificacion_controller.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/routes/routes.dart';

class RootController extends GetxController {
  RootController._internal();
  static RootController _instance = RootController._internal();
  static RootController get instance => _instance;

  String _title = 'Mi Desarrollo';
  String get title => _title;

  bool _debugShowCheckedModeBanner = false;
  bool get debugShowCheckedModeBanner => _debugShowCheckedModeBanner;

  Transition _defaultTransition = Transition.cupertino;
  Transition get defaultTransition => _defaultTransition;

  String _route = GetStorages.instance.validarToken();
  String get route => _route;

  List<GetPage> _routes = Routes.instance.routes;
  List<GetPage> get routes => _routes;

  ThemeData _theme = ThemeData(
      textTheme: GoogleFonts.quicksandTextTheme(),
      primaryColor: CustomColors.primaryColor,
      backgroundColor: CustomColors.secondColor);

  ThemeData get theme => _theme;

  Iterable<LocalizationsDelegate<dynamic>> _localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];

  Iterable<LocalizationsDelegate<dynamic>> get localizationsDelegates =>
      _localizationsDelegates;

  Locale _locale = Locale('es');
  Locale get locale => _locale;

  Iterable<Locale> _supportedLocales = [
    const Locale('es'), // Español
    const Locale('en'), // English
  ];

  Iterable<Locale> get supportedLocales => _supportedLocales;

  @override
  void onInit() {
    if (_route != '/') {
      FirebaseNotificacionController.instance.iniNotificacion();
    }
    super.onInit();
  }
}
