import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/servicio_controller.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class ServicioScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ServicioController>(
      init: ServicioController.instance,
      builder: (_) => ScaffoldTemplateWidget(
        title: 'Servicios',
        leading: Icons.arrow_back,
        body: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
          child: ListView(
            padding: EdgeInsets.only(top: 0.0),
            shrinkWrap: true,
            children: _.servicios,
          ),
        ),
      ),
    );
  }
}
