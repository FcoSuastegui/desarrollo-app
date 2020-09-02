import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/notificacion_controller.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/pages/acceso/acceso_screen.dart';
import 'package:midesarrollo/src/pages/home/home_screen.dart';
import 'package:midesarrollo/src/pages/notificacion/notificacion_screen.dart';
import 'package:midesarrollo/src/pages/setting/setting_sreen.dart';

class NavigationBarController extends GetxController {
  NavigationBarController._internal();
  static NavigationBarController _instance =
      NavigationBarController._internal();
  static NavigationBarController get instance => _instance;

  RxInt _index = 0.obs;
  RxInt get index => _index;

  @override
  void onInit() {
    _index.value = 0; 
    super.onInit();
  }

  void selectIndex(int index) => _index.value = index;


  Widget listHomePage(int index) {
    List<Widget> list = [
      HomeScreen(),
      AccesoScreen(),
      NotificacionScreen(),
      SettingSreen(),
    ];

    int indexAux = index + 1;
    return list.length >= indexAux ? list[index] : HomeScreen();
  }

  List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, color: CustomColors.iconColor, size: 18),
      title: Text("Inicio", style: TextStyle(fontSize: 12.0)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fingerprint, color: CustomColors.iconColor, size: 18),
      title: Text("Accesos", style: TextStyle(fontSize: 12.0)),
    ),
    BottomNavigationBarItem(
      icon: Badge(
        badgeContent: GetBuilder<NotificacionController>(
          init: NotificacionController.instance,
          builder: (_) => Obx(
            () => Text(
              _.counter.value.toString(),
              style: TextStyle(fontSize: 10.0, color: Colors.white),
            ),
          ),
        ),
        child:
            Icon(Icons.notifications, color: CustomColors.iconColor, size: 18),
      ),
      title: Text("Notificaciones", style: TextStyle(fontSize: 12.0)),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings, color: CustomColors.iconColor, size: 18),
      title: Text("Configuración", style: TextStyle(fontSize: 12.0)),
    ),
  ];

  List<BottomNavigationBarItem> get items => _items;
}
