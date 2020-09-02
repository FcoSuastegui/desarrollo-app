import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/saldo_controller.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/models/cargo_model.dart';
import 'package:midesarrollo/src/widgets/NoInformation/no_information.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class DetallePagoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SaldoController>(
      init: SaldoController.instance,
      builder: (_) => ScaffoldTemplateWidget(
        leading: Icons.arrow_back,
        title: 'Pago en línea',
        body: Obx(
          () => _.loadingCargo.value
              ? Center(child: CircularProgressIndicator())
              : _homeContent(),
        ),
      ),
    );
  }

  Widget _homeContent() {
    final SaldoController controller = Get.find<SaldoController>();
    return controller.cargos.length > 0
        ? Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: ListView(
              padding: EdgeInsets.only(top: 0.0),
              shrinkWrap: true,
              children: List.generate(
                controller.cargos.length,
                (index) => _listarCargos(index),
              ),
            ))
        : NoInformationWidget(onPress: controller.obtenerCargos);
  }

  Widget _listarCargos(int index) {
    final SaldoController controller = Get.find<SaldoController>();
    final CargoModel cargo = controller.cargos[index];
    final bool pagar = controller.cargos.length - 1 != index || controller.cargos.length == 1;

    return Card(
      shadowColor: CustomColors.primaryColor,
      elevation: 0,
      child: Container(
        child: Column(
          children: <Widget>[
            ListTile(
              enabled: true,
              leading: Icon(
                Icons.payment,
                color: CustomColors.iconColor,
              ),
              title: Container(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "${cargo.concepto}",
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${controller.moneda.format(cargo.cargo)}",
                              style: TextStyle(fontSize: 13.0),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              subtitle: Container(
                padding: EdgeInsets.all(0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Text(
                              "${cargo.mes} ",
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "${cargo.anio} ",
                              style: TextStyle(fontSize: 13.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Text(
                            "Total a pagar",
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${controller.moneda.format(cargo.total)} ",
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ButtonBar(
              children: <Widget>[
                GestureDetector(
                  onTap: pagar ? () => controller.seleccionarCargo(cargo) : () {},
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    width: Get.width * 0.3,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'PAGAR',
                        style: TextStyle(
                          color: pagar
                              ? CustomColors.primaryColor
                              : Colors.grey,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: [0.020, 0.015],
            colors: [CustomColors.primaryColor, Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              color: Colors.grey[400],
            ),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
          border: Border.all(width: 0.3, color: Colors.grey[200]),
        ),
      ),
    );
  }
}
