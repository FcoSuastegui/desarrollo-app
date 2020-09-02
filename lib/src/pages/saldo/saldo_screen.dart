import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/saldo_controller.dart';
import 'package:midesarrollo/src/widgets/ListTile/listTileCustom.dart';
import 'package:midesarrollo/src/widgets/NoInformation/no_information.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class SaldoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaldoController>(
      init: SaldoController.instance,
      builder: (_) => ScaffoldTemplateWidget(
        title: 'Mi saldo',
        leading: Icons.arrow_back,
        body: Obx(() => _.loading.value
            ? Center(child: CircularProgressIndicator())
            : _homeContent()),
      ),
    );
  }

  Widget _homeContent() {
    final controller = Get.find<SaldoController>();
    return controller.saldo == null
        ? NoInformationWidget(onPress: controller.obtenerSaldo)
        : Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 15),
            child: ListView(
              padding: EdgeInsets.only(top: 0.0),
              shrinkWrap: true,
              children: <Widget>[
                ListTileCustom(
                  text: 'Cuota de mantenimiento',
                  subtext: controller.saldo.cuotaord,
                  bottom: 10.0,
                ),
                ListTileCustom(
                  text: 'Cuota extraordinaria',
                  subtext: controller.saldo.cuotaext,
                  bottom: 10.0,
                ),
                ListTileCustom(
                  text: 'Saldo actual',
                  subtext: controller.saldo.saldo,
                  bottom: 10.0,
                ),
                ListTileCustom(
                  text: 'Pago en línea',
                  trailing: Icons.payment,
                  bottom: 10.0,
                  onPress: controller.goToPagoLinea,
                ),
                ListTileCustom(
                  text: 'Estado de cuenta',
                  trailing: Icons.file_download,
                  bottom: 10.0,
                  onPress: controller.estadoCuenta,
                ),
                ListTileCustom(
                  text: 'Recibos de pagos',
                  trailing: Icons.work,
                  color: Colors.grey,
                  bottom: 10.0,
                  onPress: () => controller.goToPage(''),
                ),
              ],
            ),
          );
  }
}
