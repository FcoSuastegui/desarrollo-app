import 'package:midesarrollo/app/src/views/onboarding/components/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController {
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

  List<OnBoardingContent> onboarding = [
    OnBoardingContent(
      title: "Conoce.",
      subtitle: "El estado de tu propiedad",
      image: "assets/onboarding/onboarding0.png",
      isTop: false,
    ),
    OnBoardingContent(
      title: "Consulta.",
      subtitle: "Tus estados de cuenta, abonos, \nadeudos desde donde te encuentres.",
      image: "assets/onboarding/onboarding1.png",
      isTop: false,
    ),
    OnBoardingContent(
      title: "Revisa.",
      subtitle: "Las publicaciones que se hacen por \ndesarrollo dentro de la plataforma.",
      image: "assets/onboarding/onboarding1.png",
      isTop: false,
    )
  ];

  void onPageChanged(int page) => _currentPage.value = page;
  bool onPressed() {
    if (_pageViewController.page > 1) {
      return true;
    }
    _pageViewController.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    return false;
  }
}
