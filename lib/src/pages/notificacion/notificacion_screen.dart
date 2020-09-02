import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/notificacion_controller.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/helpers/iconos.dart';
import 'package:midesarrollo/src/widgets/ListTile/list_tile_notification_custom.dart';
import 'package:midesarrollo/src/widgets/NoInformation/no_information.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class NotificacionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateWidget(
      title: 'Mis notificaciones',
      body: GetBuilder<NotificacionController>(
        init: NotificacionController.instance,
        builder: (_) => Obx(
          () => Container(
            margin: EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
            child: _.loading.value
                ? Center(child: CircularProgressIndicator())
                : _homeContent(),
          ),
        ),
      ),
    );
  }

  Widget _homeContent() {
    return Obx(
      () {
        final controller = Get.find<NotificacionController>();
        return controller.notificaciones.length > 0
            ? ListView(
                padding: EdgeInsets.only(top: 0.0),
                shrinkWrap: false,
                children: List.generate(controller.notificaciones.length,
                    (index) => _listarNotificaciones(index)),
              )
            : NoInformationWidget(onPress: controller.listarNotificaciones);
      },
    );
  }

  Widget _listarNotificaciones(int index) {
    final controller = Get.find<NotificacionController>();
    final notificacion = controller.notificaciones[index];

    return ListTileNotificationCustom(
      confirmDismiss: (DismissDirection direction) {},
      text: notificacion.descripcion,
      leading: notificacion.status
          ? Icon(Icons.done, color: CustomColors.iconColor)
          : Icon(Icons.done_all, color: CustomColors.iconColor),
      trailing: Iconos.nombre(
          nombre: notificacion.icono,
          size: 25.0,
          color: CustomColors.iconColor),
      onPress: () {
        if (notificacion.status) {
          controller.leerNotificacion(notificacion.id);
        }
        controller.seleccionarNotificacion(notificacion);
      },
      bottom: 10.0,
    );
  }
}
