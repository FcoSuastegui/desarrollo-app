import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/routes/routes.dart';
import 'package:midesarrollo/src/widgets/Cards/cardCustomWidget.dart';
import 'package:midesarrollo/src/widgets/ListTile/listTileCustom.dart';

class HomeController extends GetxController {
  HomeController._internal();
  static HomeController _instance = HomeController._internal();
  static HomeController get instance => _instance;

  RxList<Widget> _accesosRapido = [
    CardCustomWidget(
      text: 'Reglamentos',
      icon: Icons.info,
      onPress: () => Routes.instance.getRoute("reglamento"),
      left: 0.0,
    ),
    CardCustomWidget(
      text: 'Asambleas',
      icon: Icons.gavel,
      iconColor: Colors.grey,
      onPress: () => Routes.instance.getRoute(""),
    ),
    CardCustomWidget(
      text: 'Saldos',
      icon: Icons.attach_money,
      onPress: () => Routes.instance.getRoute("saldo"),
      right: 0.0,
    ),
  ].obs;

  RxList<Widget> get accesosRapido => _accesosRapido;

  RxList<Widget> _listItems = [
    ListTileCustom(
      text: 'Publicaciones',
      top: 10.0,
      bottom: 10.0,
      trailing: Icons.book,
      onPress: () => Routes.instance.getRoute("publicacion"),
    ),
    ListTileCustom(
      text: 'Servicios',
      bottom: 10.0,
      trailing: Icons.room_service,
      onPress: () => Routes.instance.getRoute("servicio"),
    ),
    ListTileCustom(
      text: 'Tickets',
      bottom: 10.0,
      trailing: Icons.headset_mic,
      onPress: () => Routes.instance.getRoute("ticket"),
    ),
    ListTileCustom(
      text: 'Encuesta',
      bottom: 10.0,
      color: Colors.grey,
      trailing: Icons.live_help,
      onPress: () => Routes.instance.getRoute(""),
    ),
  ].obs;


  RxList<Widget> get listItems => _listItems;

}