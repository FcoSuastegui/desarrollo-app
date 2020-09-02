import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/controllers/navigation_bar_controller.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';

class HomePage extends StatelessWidget {
  static final String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    GetStorages.instance.pagina = routeName;
    return GetBuilder<NavigationBarController>(
      init: NavigationBarController.instance,
      builder: (_) => Obx(
        () => Scaffold(
          backgroundColor: Colors.black,
          body: _.listHomePage(_.index.value),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _.index.value,
            backgroundColor: Colors.white,
            items: _.items,
            onTap: _.selectIndex,
          ),
        ),
      ),
    );
  }
}
