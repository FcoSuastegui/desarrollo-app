
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:midesarrollo/src/helpers/get_storage.dart';
import 'package:midesarrollo/src/widgets/Onboarding/onboarding_template.dart';

class OnBoardingController extends GetxController{
  OnBoardingController._internal();
  static OnBoardingController _instance = OnBoardingController._internal();
  static OnBoardingController get instance => _instance;

  int _numPages = 3;
  int get numbPages => _numPages;

  RxInt _currentPage = 0.obs;
  RxInt get currentPage => _currentPage;

  final PageController _pageViewController = PageController(initialPage: 0);
  PageController get pageViewController => _pageViewController;

  @override
  void onInit() {
    _currentPage.value = 0; 
    super.onInit();
  }

  List<OnBoardingTemplate> onboarding = [
    OnBoardingTemplate(
      title: "Conoce",
      subtitle: "El estado de tu propiedad.",
      image: Image.asset("assets/onboarding/onboarding0.png"),
    ),
    OnBoardingTemplate(
      title: "Consulta.",
      subtitle:
          "Tus estados de cuenta, abonos, adeudos desde donde te encuentres.",
      image: Image.asset("assets/onboarding/onboarding1.png"),
    ),
    OnBoardingTemplate(
      title: "Revisa.",
      subtitle:
          "Las publicaciones que se hacen por desarrollo dentro de la plataforma.",
      image: Image.asset("assets/onboarding/onboarding2.png"),
    )
  ];

  void onPageChanged(int page) => _currentPage.value = page;
  void onPressed() {
    if (_pageViewController.page > 1) {
      GetStorages.instance.onboarding = 0;
      Get.offAllNamed('/home');
      return;
    }
    _pageViewController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}