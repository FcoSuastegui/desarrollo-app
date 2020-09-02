import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/blocs/validators/validators.dart';
import 'package:midesarrollo/src/controllers/ticket_controller.dart';

class TicketBloc extends FormBloc<String, String> {
  final descripcion = TextFieldBloc();
  final TicketController controller = Get.find<TicketController>();

  TicketBloc() {
    addFieldBlocs(fieldBlocs: [
      descripcion,
    ]);

    descripcion..addValidators([Validators.requiredField(descripcion)]);
  }

  @override
  void onSubmitting() async {
    if (controller.catalogoSeleccionado == null) {
      emitFailure(failureResponse: "Selecciona algun tipo de servicio");
    } else {
      final response = await controller.addTicket({
        'id_cat_ticket': controller.catalogoSeleccionado.id,
        'mensaje': descripcion.value
      });

      response['status']
          ? emitSuccess(successResponse: response['message'])
          : emitFailure(failureResponse: response['message']);
    }
  }
}
