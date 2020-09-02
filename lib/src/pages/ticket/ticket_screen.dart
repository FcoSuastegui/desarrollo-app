import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/ticket_controller.dart';
import 'package:midesarrollo/src/widgets/ListTile/listTileCustom.dart';
import 'package:midesarrollo/src/widgets/NoInformation/no_information.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class TicketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TicketController>(
      init: TicketController.instance,
      builder: (_) => ScaffoldTemplateWidget(
        leading: Icons.arrow_back,
        title: 'Mis ticktes',
        actions: _.actions,
        body: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 15),
          child: Obx(
            () => _.loading.value
                ? Center(child: CircularProgressIndicator())
                : _homeContent(),
          ),
        ),
      ),
    );
  }

  Widget _homeContent() {
    return Obx(
      () {
        final TicketController controller = Get.find<TicketController>();
        return controller.tickets.length > 0
            ? ListView(
                padding: EdgeInsets.only(top: 0.0),
                shrinkWrap: false,
                children: List.generate(
                  controller.tickets.length,
                  (index) => _listarTickets(index),
                ),
              )
            : NoInformationWidget(onPress: controller.listarTickets);
      },
    );
  }

  Widget _listarTickets(int index) {
    final controller = Get.find<TicketController>();
    final tickets = controller.tickets[index];

    return ListTileCustom(
      text: tickets.descripcion,
      subtext: 'F-${tickets.folio}',
      bottom: 10.0,
      onPress: controller.toTimeline,
    );
  }
}
