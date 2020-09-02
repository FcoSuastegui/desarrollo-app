import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:midesarrollo/src/blocs/accesos_bloc.dart';
import 'package:midesarrollo/src/widgets/Alerts/custom_alert.dart';
import 'package:midesarrollo/src/widgets/Buttons/button_submit_align.dart';
import 'package:midesarrollo/src/widgets/Fields/input_switch_field_bloc.dart';
import 'package:midesarrollo/src/widgets/Fields/input_text_field_bloc.dart';
import 'package:midesarrollo/src/widgets/Fields/time_field_input.dart';
import 'package:midesarrollo/src/widgets/Loading/loading.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class AccesoAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateWidget(
      leading: Icons.clear,
      title: 'Nuevo Acceso',
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: BlocProvider(
            create: (context) => AccesoBloc(),
            child: Builder(
              builder: (context) {
                final acceso = context.bloc<AccesoBloc>();
                return FormBlocListener<AccesoBloc, String, String>(
                  onSubmitting: (context, state) => LoadingDialog.show(context),
                  onSuccess: (context, state) async {
                    LoadingDialog.hide(context);
                    await Get.dialog(
                      CustomAlert(
                        type: AlertDialogType.SUCCESS,
                        action: () => Get.back(),
                        text: state.successResponse,
                      ),
                    );
                    Get.back();
                    acceso.close();
                  },
                  onFailure: (context, state) async {
                    LoadingDialog.hide(context);
                    await Get.dialog(
                      CustomAlert(
                        type: AlertDialogType.ERROR,
                        action: () => Get.back(),
                        text: state.failureResponse,
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      InputTextFieldBloc(
                        textFieldBloc: acceso.visitantes,
                        labelText: 'Nombre del visitante/proveedor',
                      ),
                      TimeFieldInput(
                        dateTimeFieldBloc: acceso.dateTime,
                        canSelectTime: true,
                        format: DateFormat('dd/mm/yyyy HH:mm'),
                        labelText: "Fecha y hora de llegada",
                      ),
                      StreamBuilder(
                        stream: acceso.activarSiempre,
                        builder: (BuildContext context, _) =>
                            InputSwitchFieldBloc(
                          text: 'Siempre activo',
                          value: acceso.activarSiempre.value,
                          onChanged: (value) =>
                              acceso.activarSiempre.updateValue(value),
                        ),
                      ),
                      StreamBuilder(
                        stream: acceso.ubicacion,
                        builder: (BuildContext context, _) =>
                            InputSwitchFieldBloc(
                          text: 'Compartir ubicación',
                          value: acceso.ubicacion.value,
                          onChanged: (value) =>
                              acceso.ubicacion.updateValue(value),
                        ),
                      ),
                      StreamBuilder(
                        stream: acceso.app,
                        builder: (BuildContext context, _) =>
                            InputSwitchFieldBloc(
                          text: 'Compartir ubicación',
                          value: acceso.app.value,
                          onChanged: (value) => acceso.app.updateValue(value),
                        ),
                      ),
                      ButtonSubmitAlign(
                        submit: acceso.submit,
                        text: 'Generar accesos',
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
