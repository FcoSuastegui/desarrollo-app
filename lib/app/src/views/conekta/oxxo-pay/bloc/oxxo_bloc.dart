import 'package:midesarrollo/app/src/data/services/conekta_service.dart';
import 'package:midesarrollo/app/src/helpers/get_storage.dart';
import 'package:midesarrollo/app/src/helpers/validators_bloc.dart';
import 'package:midesarrollo/app/src/views/listar-cargos/controller/listar_cargos_controller.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';

class OxxoBloc extends FormBloc<String, String> {
  final ListarCargosController controller = Get.find<ListarCargosController>();

  // Datos generales
  final nombreCompleto = TextFieldBloc(
    validators: [ValidatorsBloc.required],
  );
  final correo = TextFieldBloc(
    validators: [
      ValidatorsBloc.required,
      ValidatorsBloc.emailFormat,
    ],
  );
  final celular = TextFieldBloc(
    validators: [
      ValidatorsBloc.required,
      ValidatorsBloc.numeroCelular
    ],
  );

  OxxoBloc() {
    addFieldBlocs(
      step: 0,
      fieldBlocs: [nombreCompleto, correo, celular],
    );
  }

  @override
  Future<void> close() {
    nombreCompleto?.close();
    correo?.close();
    celular?.close();
    return super.close();
  }

  @override
  void onSubmitting() async {
    final response = await ConektaService.inst.oxxoPago({
      "nombreCompleto": nombreCompleto.value,
      "correo": correo.value,
      "celular": celular.value,
      "idcargo": controller.cargoSeleccionado.idcargo,
      "idpropietario": GetStorages.inst.idpropietario,
      "total": controller.total,
    });

    print(response.message);

    response.status
        ? emitSuccess(
            successResponse: response.message,
          )
        : emitFailure(
            failureResponse: response.message,
          );
  }
}
