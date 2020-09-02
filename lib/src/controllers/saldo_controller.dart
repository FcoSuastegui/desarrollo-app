import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/helpers/helper.dart';
import 'package:midesarrollo/src/helpers/network.dart';
import 'package:midesarrollo/src/models/cargo_model.dart';
import 'package:midesarrollo/src/models/saldos_model.dart';
import 'package:midesarrollo/src/routes/routes.dart';
import 'package:intl/intl.dart';

import 'package:midesarrollo/src/helpers/conekta/conekta_flutter_token.dart';
import 'package:midesarrollo/src/helpers/conekta/conekta_model.dart';
import 'package:midesarrollo/src/helpers/conekta/payment_model.dart';

class SaldoController extends GetxController {
  SaldoController._internal();
  static SaldoController _instance = SaldoController._internal();
  static SaldoController get instance => _instance;

  final TextStyle _label = TextStyle(fontSize: 14.0, color: Colors.grey);

  // Datos de saldos
  SaldosModel _saldo;
  SaldosModel get saldo => _saldo;

  RxBool _loading = false.obs;
  RxBool get loading => _loading;

  // Datos de cargos
  RxList<CargoModel> _cargos = List<CargoModel>().obs;
  RxList<CargoModel> get cargos => _cargos;

  RxBool _loadingCargo = false.obs;
  RxBool get loadingCargo => _loadingCargo;

  CargoModel _cargoSeleccionado;
  CargoModel get cargoSeleccionado => _cargoSeleccionado;

  NumberFormat moneda = NumberFormat.simpleCurrency();
  String get total => moneda.format(_cargoSeleccionado.total);

  @override
  void onInit() {
    obtenerSaldo();
    super.onInit();
  }

  Future<void> obtenerSaldo() async {
    _loading.value = true;
    final Response response = await Network.instance.post(
      'app/saldos',
      {
        'idpropietario': GetStorages.instance.idpropietario,
      },
    );
    if (response.statusCode == 200) {
      _saldo = SaldosModel.fromJson(response.data['data']);
    }
    _loading.value = false;
  }

  Future<void> obtenerCargos() async {
    _loadingCargo.value = true;
    final Response response = await Network.instance.post(
      'app/saldosCargos',
      {
        'idpropietario': GetStorages.instance.idpropietario,
      },
    );
    if (response.statusCode == 200) {
      _cargos.value = [];
      response.data['data']
          .forEach((item) => _cargos.add(CargoModel.fromJson(item)));
    }
    _loadingCargo.value = false;
  }

  Future<void> estadoCuenta() async {
    final Response response = await Network.instance.post(
      'app/saldosPdf',
      {
        'idpropietario': GetStorages.instance.idpropietario,
        'sistema': GetStorages.instance.sistema,
      },
    );

    String file = '';

    if (response.statusCode == 200) {
      file = response.data['status'] ? response.data['file'] : '';
    }

    file.isNotEmpty
        ? Helper.launchInBrowser(file)
        : Get.snackbar('Mi desarrollo', 'Hubo un error al cargar el archivo');
  }

  void goToPagoLinea() {
    Routes.instance.getRoute('detalle-pago');
    obtenerCargos();
  }

  void goToPage(String page) {
    Routes.instance.getRoute(page);
  }

  Future<void> seleccionarCargo(CargoModel cargo) async {
    _cargoSeleccionado = cargo;
    await Get.dialog(
      Center(
        child: SizedBox(
          height: 250,
          child: Dialog(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Text(
                    "¿Seleccina el método de pago? ",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey),
                  ),
                  Divider(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.back();
                      Routes.instance.getRoute('pago-oxxo');
                    },
                    child: Container(
                      width: Get.width,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(FontAwesome5.money_bill_alt),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text("Efectivo", style: _label)
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      Get.back();
                      Routes.instance.getRoute('pago-tarjeta');
                    },
                    child: Container(
                      width: Get.width,
                      height: 50.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(FontAwesome5.credit_card),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text("Tarjeta de crédito o débito", style: _label)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> tarjetaPago(Map<String, dynamic> datos) async {
    Map<String, dynamic> respuesta = {'status': false, 'message': ''};

    final ConektaModel token =
        await ConektaFlutterTokenizer().tokenizePaymentMethod(
      PaymentMethod(
          name: datos['nombreCompleto'],
          number: datos['numero'],
          expirationMonth: datos['mes'],
          expirationYear: datos['anio'],
          cvc: datos['cvc']),
    );

    if (token.object == 'error') {
      respuesta['message'] = "${token.object}/${token.messageToPurchaser}";
      return respuesta;
    }

    datos['idpropietario'] = GetStorages.instance.idpropietario;
    datos['idcargo'] = _cargoSeleccionado.idcargo;
    datos['total'] = _cargoSeleccionado.total;
    datos['token'] = token.id;

    final Response response =
        await Network.instance.post('app/tarjetaPago', datos);

    if (response.statusCode == 200) {
      respuesta = response.data;
    }
    return respuesta;
  }

  Future<Map<String, dynamic>> oxxoPago(Map<String, dynamic> datos) async {
    datos['idcargo'] = _cargoSeleccionado.idcargo;
    datos['idpropietario'] = GetStorages.instance.idpropietario;
    datos['total'] = _cargoSeleccionado.total;

    Map<String, dynamic> respuesta = {'status': false, 'message': ''};

    final Response response = await Network.instance.post('app/oxxo', datos);
    if (response.statusCode == 200) {
      respuesta = response.data;
    }
    return respuesta;
  }
}
