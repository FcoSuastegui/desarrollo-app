import 'package:flutter/material.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/blocs/ticket_bloc.dart';
import 'package:midesarrollo/src/controllers/ticket_controller.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/widgets/Alerts/custom_alert.dart';
import 'package:midesarrollo/src/widgets/Buttons/button_submit_align.dart';
import 'package:midesarrollo/src/widgets/Fields/drop_search_field.dart';
import 'package:midesarrollo/src/widgets/Fields/input_text_field_bloc.dart';
import 'package:midesarrollo/src/widgets/Loading/loading.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class TicketAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldTemplateWidget(
      title: 'Nuevo ticket',
      leading: Icons.clear,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: BlocProvider(
            create: (context) => TicketBloc(),
            child: Builder(
              builder: (context) {
                final ticket = context.bloc<TicketBloc>();
                return FormBlocListener<TicketBloc, String, String>(
                  onSubmitting: (context, state) => LoadingDialog.show(context),
                  onSuccess: (context, state) async {
                    LoadingDialog.hide(context);
                    await Get.dialog(
                      CustomAlert(
                        type: AlertDialogType.SUCCESS,
                        text: state.successResponse,
                        action: () => Get.back(),
                      ),
                      barrierDismissible: true,
                    );
                    ticket.close();
                    Get.back();
                  },
                  onFailure: (context, state) async {
                    LoadingDialog.hide(context);
                    Get.dialog(
                      CustomAlert(
                        type: AlertDialogType.ERROR,
                        text: state.failureResponse,
                        action: () => Get.back(),
                      ),
                      barrierDismissible: true,
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        GetBuilder<TicketController>(
                          init: TicketController.instance,
                          builder: (_) => Obx(
                            () => DropSearchField(
                              showClearButton: false,
                              label: " Seleccione una opción",
                              items: _.catalogoItems,
                              onChanged: (String v) => _.seleccionarCatalogo(v),
                            ),
                          ),
                        ),
                        InputTextFieldBloc(
                          textFieldBloc: ticket.descripcion,
                          labelText: "Descripción",
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          child: Text(
                            "*Favor de describir a detalle el caso.",
                            style: TextStyle(fontSize: 17.0),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        GetBuilder<TicketController>(
                          id: "image",
                          builder: (_) => Container(
                            width: Get.width,
                            margin: EdgeInsets.only(top: 20.0),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: RaisedButton(
                                      onPressed: _.showSelectDialog,
                                      color: Colors.white,
                                      padding: EdgeInsets.all(10.0),
                                      elevation: 0.0,
                                      child: Text(
                                        "Seleccione una imagen(opcional).",
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        side: BorderSide(
                                          color: CustomColors.primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: Get.width,
                                  margin: EdgeInsets.only(top: 20.0),
                                  child: _.image != null
                                      ? Image.file(_.image)
                                      : SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ButtonSubmitAlign(
                          submit: ticket.submit,
                          text: "Agregar",
                        )
                      ],
                    ),
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
