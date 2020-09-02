import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/relamento_controller.dart';
import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:midesarrollo/src/widgets/NoInformation/no_information.dart';
import 'package:midesarrollo/src/widgets/PdfViewer/pdfViewer.dart';
import 'package:midesarrollo/src/widgets/Scaffold/scaffold_template_widget.dart';

class ReglamentoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReglamentoController>(
      init: ReglamentoController.instance,
      builder: (_) => ScaffoldTemplateWidget(
        leading: Icons.arrow_back,
        title: 'Reglamento',
        body: Obx(
          () => _.loading.value
              ? Center(child: CircularProgressIndicator())
              : _homeContent(),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: 'download-reglamento',
          backgroundColor: CustomColors.iconColor,
          onPressed: _.launchInBrowser,
          tooltip: 'Descargar',
          child: Icon(
            Icons.cloud_download,
          ),
        ),
      ),
    );
  }

  Widget _homeContent() {
    final ReglamentoController controller = Get.find<ReglamentoController>();
    return controller.url.value.isEmpty
        ? NoInformationWidget(onPress: controller.obtenerReglamento)
        : Container(child: PdfViewerWidget(path: controller.url.value));
  }
}
