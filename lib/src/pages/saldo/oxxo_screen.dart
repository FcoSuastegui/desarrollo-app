import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/blocs/oxxo_bloc.dart';
import 'package:midesarrollo/src/helpers/helpers_export.dart';
import 'package:midesarrollo/src/widgets/Alerts/custom_alert.dart';
import 'package:midesarrollo/src/widgets/Fields/input_text_field_bloc.dart';
import 'package:midesarrollo/src/widgets/Loading/loading.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class OxxoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OxxoBloc(),
      child: Builder(
        builder: (context) {
          final oxxo = context.bloc<OxxoBloc>();
          return ScaffoldTemplateWidget(
            leading: Icons.arrow_back,
            title: 'Oxxo pay',
            body: FormBlocListener<OxxoBloc, String, String>(
              onSubmitting: (context, state) => LoadingDialog.show(context),
              onSuccess: (context, state) async {
                LoadingDialog.hide(context);
                if (state.stepCompleted == state.lastStep) {
                  final resp = state.successResponse.split('/');
                  await Get.dialog(
                    CustomAlert(
                      type: resp[0] == 'error'
                          ? AlertDialogType.ERROR
                          : AlertDialogType.SUCCESS,
                      action: () => Get.back(),
                      text: resp[1],
                    ),
                  );

                  if (resp[0] != 'error') {
                    Get.offAllNamed('home');
                  }
                }
              },
              onFailure: (context, state) => LoadingDialog.hide(context),
              child: StepperFormBlocBuilder<OxxoBloc>(
                type: StepperType.horizontal,
                physics: ClampingScrollPhysics(),
                stepsBuilder: (formBloc) {
                  return [
                    _datosGenerales(oxxo),
                  ];
                },
              ),
            ),
          );
        },
      ),
    );
  }

  FormBlocStep _datosGenerales(OxxoBloc oxxo) {
    return FormBlocStep(
      title: Text('Datos Personales'),
      content: Column(
        children: <Widget>[
          InputTextFieldBloc(
            textFieldBloc: oxxo.nombreCompleto,
            labelText: "Nombre Completo",
            keyboardType: TextInputType.emailAddress,
          ),
          InputTextFieldBloc(
            textFieldBloc: oxxo.correo,
            labelText: "Correo electrónico",
            keyboardType: TextInputType.emailAddress,
          ),
          InputTextFieldBloc(
            textFieldBloc: oxxo.celular,
            labelText: "Número de celular",
            keyboardType: TextInputType.phone,
            inputFormatters: [
              MaskedTextInputFormatter(
                mask: 'xxx xxxx xxx',
                separator: ' ',
              ),
            ],
            hintText: "744 1234 567",
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text("Total a pagar ${oxxo.controller.total}"),
            ),
          )
        ],
      ),
    );
  }
}
