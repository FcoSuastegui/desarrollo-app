import 'package:midesarrollo/app/src/helpers/helpers.dart';
import 'package:midesarrollo/app/src/routes/routes.dart';
import 'package:midesarrollo/app/src/views/saldos/controller/saldo_controller.dart';
import 'package:midesarrollo/app/src/widgets/ListTile/list_tile_default.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SaldosBody extends GetView<SaldoController> {
  const SaldosBody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 15),
      child: ListView(
        padding: EdgeInsets.only(top: 0.0),
        shrinkWrap: true,
        children: <Widget>[
          ListTileDefault(
            text: 'Cuota de mantenimiento',
            subtext: controller.saldo.cuotaord,
            bottom: 10.0,
          ),
          ListTileDefault(
            text: 'Cuota extraordinaria',
            subtext: controller.saldo.cuotaext,
            bottom: 10.0,
          ),
          ListTileDefault(
            text: 'Saldo actual',
            subtext: controller.saldo.saldo,
            bottom: 10.0,
          ),
          ListTileDefault(
            text: 'Pago en línea',
            trailing: Icons.payment,
            bottom: 10.0,
            onPress: () => Routes.inst.goToPage("/listar-cargos"),
          ),
          ListTileDefault(
            text: 'Estado de cuenta',
            trailing: Icons.file_download,
            bottom: 10.0,
            onPress: () async {
              final file = await controller.estadoCuenta();
              file.isNotEmpty
                  ? Helpers.launchInBrowser(file)
                  : Helpers.error(message: "Hubó un error al cargar el archivo");
            },
          ),
          ListTileDefault(
            text: 'Recibos de pagos',
            trailing: Icons.work,
            color: Colors.grey,
            bottom: 10.0,
            onPress: () => Routes.inst.goToPage("page"),
          ),
        ],
      ),
    );
  }
}
