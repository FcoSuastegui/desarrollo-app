import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/blocs/validators/validators.dart';
import 'package:midesarrollo/src/controllers/acceso_controller.dart';

class AccesoBloc extends FormBloc<String, String> {
    
  final visitantes = TextFieldBloc();
  final dateTime = InputFieldBloc<DateTime, Object>();
  final activarSiempre = BooleanFieldBloc(initialValue: false);
  final ubicacion = BooleanFieldBloc();
  final app = BooleanFieldBloc();

  final AccesoController controller = Get.find<AccesoController>();


  AccesoBloc() {
    addFieldBlocs(fieldBlocs: [
      visitantes,
      dateTime,

    ]);

    visitantes
    ..addValidators([Validators.requiredField(visitantes)]);
    dateTime
    ..addValidators([Validators.requiredDateTime(dateTime), Validators.validDate(dateTime)]);
    
  }

  @override
  void onSubmitting() async {
    final response = await controller.addAccesos({
      "visitante": visitantes.value,
      "fecha": dateTime.value.toString(),
      "activoSiempre": activarSiempre.value
    });

    if(response['status']) {
      emitSuccess( successResponse: response['message']);
    } else {
      emitFailure(failureResponse: response['message']);
    }


    // Cerramos los streams
    visitantes.close();
    dateTime.close();
    activarSiempre.close();
    ubicacion.close();
    app.close();

  }
  
}