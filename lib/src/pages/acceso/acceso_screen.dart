import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/acceso_controller.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/models/accesos_model.dart';
import 'package:midesarrollo/src/widgets/Alerts/alert_actions.dart';
import 'package:midesarrollo/src/widgets/ListTile/listTileCustom.dart';
import 'package:midesarrollo/src/widgets/NoInformation/no_information.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class AccesoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccesoController>(
      init: AccesoController.instance,
      builder: (_) => ScaffoldTemplateWidget(
        title: 'Mis accesos',
        actions: _.actions,
        body: Obx(
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
    final controller = Get.find<AccesoController>();
    return controller.accesos.length > 0
        ? ListView(
            padding: EdgeInsets.only(top: 0.0),
            shrinkWrap: false,
            children: List.generate(
              controller.accesos.length,
              (index) => _listarAccesos(index),
            ),
          )
        : NoInformationWidget(onPress: controller.obtenerAccesos);
  }

  Widget _listarAccesos(int index) {
    final AccesoController controller = Get.find<AccesoController>();
    final AccesosModel acceso = controller.accesos[index];
    bool active = acceso.active;

    return ListTileCustom(
      text: acceso.visitante,
      bottom: 10.0,
      widget: Switch(
        value: active,
        onChanged: (value) async {
          Get.dialog(
            AlertAction(
              title: active
                  ? "Esta cancelando el acceso programado ¿Estaa seguro?"
                  : "Esta habilitando nuevamente el acceso para el día de hoy ¿Esta seguro?",
              onPress: () async {
                await controller.cambiarAccesos(acceso.id, value);
                Get.back();
              },
            ),
            barrierDismissible: false,
          );
        },
        activeTrackColor: CustomColors.primaryColor,
        activeColor: CustomColors.primaryColor,
      ),
      onPress: () => controller.goToContent(acceso),
    );
  }
}
