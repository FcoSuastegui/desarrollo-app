import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:midesarrollo/src/routes/routes.dart';
import 'package:midesarrollo/src/widgets/ListTile/listTileCustom.dart';

class ServicioController extends GetxController {
  ServicioController._internal();
  static ServicioController _instance = ServicioController._internal();
  static ServicioController get instance => _instance;

  RxList<Widget> _servicios = [
    ListTileCustom(
      text: 'Pago en línea',
      trailing: Icons.payment,
      bottom: 10.0,
      onPress: () => Routes.instance.getRoute('detalle-pago'),
    ),
  ].obs;
  
  RxList<Widget> get servicios => _servicios;
}
