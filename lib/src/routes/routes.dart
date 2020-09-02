import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/pages/acceso/acceso_add.dart';
import 'package:midesarrollo/src/pages/acceso/acceso_contenido.dart';
import 'package:midesarrollo/src/pages/home_page.dart';
import 'package:midesarrollo/src/pages/login_page.dart';
import 'package:midesarrollo/src/pages/onboarding_page.dart';

import 'package:midesarrollo/src/pages/notificacion/notificacion_screen.dart';
import 'package:midesarrollo/src/pages/asamblea/asamblea_sceen.dart';
import 'package:midesarrollo/src/pages/home/home_screen.dart';
import 'package:midesarrollo/src/pages/publicacion/publicacion_screen.dart';
import 'package:midesarrollo/src/pages/reglamento/reglamento_screen.dart';
import 'package:midesarrollo/src/pages/saldo/detalle_pago_screen.dart';
import 'package:midesarrollo/src/pages/saldo/oxxo_screen.dart';
import 'package:midesarrollo/src/pages/saldo/saldo_screen.dart';
import 'package:midesarrollo/src/pages/saldo/tarjeta_screen.dart';
import 'package:midesarrollo/src/pages/servicio/servicio_screen.dart';
import 'package:midesarrollo/src/pages/setting/setting_sreen.dart';
import 'package:midesarrollo/src/pages/ticket/ticket_add.dart';
import 'package:midesarrollo/src/pages/ticket/ticket_screen.dart';

class Routes {
  Routes._internal();
  static Routes _instance = Routes._internal();
  static Routes get instance => _instance;

  final List<GetPage> routes = [
    GetPage(
      name: LoginPage.routeName,
      page: () => LoginPage(),
    ),
    GetPage(
      name: HomePage.routeName,
      page: () => HomePage(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: OnBoardingPage.routeName,
      page: () => OnBoardingPage(),
    ),
  ];

  Widget listHomePage(int index) {
    List<Widget> list = [
      HomeScreen(),
      //AccesoScreen(),
      NotificacionScreen(),
      SettingSreen(),
    ];

    int indexAux = index + 1;
    return list.length >= indexAux ? list[index] : HomeScreen();
  }

  void getRoute(String route) {
    Map<String, dynamic> page = {
      'reglamento': ReglamentoScreen(),
      'asamblea': AsambleaScreen(),
      'saldo': SaldoScreen(),
      'publicacion': PublicacionScreen(),
      'servicio': ServicioScreen(),
      'ticket': TicketScreen(),
      'ticket-add': TicketAdd(),
      'detalle-pago': DetallePagoScreen(),
      'pago-tarjeta': TarjetaScreen(),
      'pago-oxxo': OxxoScreen(),
      'acceso-add': AccesoAdd(),
      'acceso-contenido': AccesoContenido(),
    };

    if (page[route] == null) {
      if (!Get.isSnackbarOpen) {
        Get.snackbar(
          "Mi Desarrollo",
          "El módulo no esta disponible o no tienes acceso a ello.",
          backgroundColor: Colors.red.withOpacity(0.8),
          colorText: Colors.white,
        );
      }
    } else {
      Get.to(page[route]);
    }
  }
}
