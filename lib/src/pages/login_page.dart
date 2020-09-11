import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/blocs/login_bloc.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/helpers/helpers_export.dart';
import 'package:midesarrollo/src/widgets/Alerts/custom_alert.dart';
import 'package:midesarrollo/src/widgets/Animation/fade_animation.dart';
import 'package:midesarrollo/src/widgets/Buttons/button_submit.dart';
import 'package:midesarrollo/src/widgets/Fields/input_text_field_bloc.dart';
import 'package:midesarrollo/src/widgets/Informacion/informacion.dart';
import 'package:midesarrollo/src/widgets/Loading/loading.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[Informacion.banner],
              ),
              BlocProvider(
                create: (context) => LoginBloc(),
                child: Builder(
                  builder: (context) {
                    final login = context.bloc<LoginBloc>();
                    return FormBlocListener<LoginBloc, String, String>(
                      onSubmitting: (context, state) =>
                          LoadingDialog.show(context),
                      onSuccess: (context, state) {
                        LoadingDialog.hide(context);
                        login.close();
                        Get.offAllNamed(state.successResponse);
                      },
                      onFailure: (context, state) async {
                        LoadingDialog.hide(context);
                        Get.dialog(
                          CustomAlert(
                            type: AlertDialogType.ERROR,
                            text: state.failureResponse,
                          ),
                          barrierDismissible: true,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            FadeAnimation(1, Informacion.logo),
                            FadeAnimation(
                              1.4,
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.transparent,
                                      blurRadius: 50,
                                      offset: Offset(0, 10),
                                    )
                                  ],
                                ),
                                child: Column(
                                  children: <Widget>[
                                    InputTextFieldBloc(
                                      textFieldBloc: login.username,
                                      keyboardType: TextInputType.phone,
                                      labelText: 'Usuario',
                                      inputFormatters: [
                                        MaskedTextInputFormatter(
                                          mask: 'xxx xxxx xxx',
                                          separator: ' ',
                                        ),
                                      ],
                                      hintText: "744 1234 567",
                                    ),
                                    InputTextFieldBloc(
                                      suffixButton: SuffixButton.obscureText,
                                      textFieldBloc: login.password,
                                      labelText: "Contraseña",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            FadeAnimation(
                              1.5,
                              ButtonSubmit(
                                submit: login.submit,
                                text: 'Acceder',
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            FadeAnimation(
                              1.5,
                              Text(
                                "¿Olvidaste tu contraseña?",
                                style: TextStyle(
                                  color: CustomColors.primaryColor,
                                ),
                              ),
                            ),
                            FadeAnimation(1, Informacion.footer),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
