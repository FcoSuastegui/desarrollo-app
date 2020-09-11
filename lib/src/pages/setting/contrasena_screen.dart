import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/blocs/contrasena_bloc.dart';
import 'package:midesarrollo/src/widgets/Alerts/custom_alert.dart';
import 'package:midesarrollo/src/widgets/Buttons/button_submit.dart';
import 'package:midesarrollo/src/widgets/Fields/input_text_field_bloc.dart';
import 'package:midesarrollo/src/widgets/Loading/loading.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class ContrasenaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateWidget(
      title: 'Cambiar contraseña',
      leading: Icons.arrow_back,
      body: Container(
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: BlocProvider(
          create: (context) => ContrasenaBloc(),
          child: Builder(
            builder: (context) {
              final change = context.bloc<ContrasenaBloc>();
              return FormBlocListener<ContrasenaBloc, String, String>(
                onSubmitting: (context, state) => LoadingDialog.show(context),
                onSuccess: (context, state) async {
                  LoadingDialog.hide(context);
                  change.close();
                  await Get.dialog(
                    CustomAlert(
                      type: AlertDialogType.SUCCESS,
                      text: state.successResponse,
                      action: () => Get.offAllNamed('/'),
                    ),
                  );
                },
                onFailure: (context, state) async {
                  LoadingDialog.hide(context);
                  await await Get.dialog(
                    CustomAlert(
                      type: AlertDialogType.ERROR,
                      text: state.failureResponse,
                      action: () => Get.back(),
                    ),
                  );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    InputTextFieldBloc(
                      textFieldBloc: change.password,
                      suffixButton: SuffixButton.obscureText,
                      labelText: 'Nueva Contrasena',
                    ),
                    InputTextFieldBloc(
                      suffixButton: SuffixButton.obscureText,
                      textFieldBloc: change.confirm,
                      labelText: 'Confirma Contrasena',
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ButtonSubmit(
                      submit: change.submit,
                      text: "Cambiar",
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
