import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/blocs/validators/validators.dart';
import 'package:midesarrollo/src/controllers/saldo_controller.dart';

class OxxoBloc extends FormBloc<String, String> {
  // Datos generales
  final nombreCompleto = TextFieldBloc();
  final correo = TextFieldBloc();
  final celular = TextFieldBloc();

  final SaldoController controller = Get.find<SaldoController>();

  OxxoBloc() {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [nombreCompleto, correo, celular],
    );
    nombreCompleto..addValidators([Validators.requiredField(nombreCompleto)]);
    correo
      ..addValidators(
          [Validators.requiredField(correo), Validators.emailFormat(correo)]);
    celular
      ..addValidators([
        Validators.requiredField(celular),
        Validators.numeroCelular(celular)
      ]);
  }

  @override
  void onSubmitting() async {
    final response = await controller.oxxoPago({
      "nombreCompleto": nombreCompleto.value,
      "correo": correo.value,
      "celular": celular.value,
    });

    response['status']
        ? emitSuccess(
            canSubmitAgain: true,
            successResponse: "${response['status']}/${response['message']}")
        : emitSuccess(
            canSubmitAgain: true,
            successResponse: "${response['status']}/${response['message']}");
  }
}
