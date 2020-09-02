import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:midesarrollo/src/controllers/on_boarding_controller.dart';
import 'package:midesarrollo/src/widgets/Onboarding/onboarding_stepper.dart';

class OnBoardingPage extends StatelessWidget {
  static final String routeName = '/onboarding';
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(
      init: OnBoardingController.instance,
      builder: (_) => Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.9],
                colors: [Colors.teal[900], Colors.teal[800], Colors.teal[400]],
              ),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: PageView(
                    controller: _.pageViewController,
                    onPageChanged: _.onPageChanged,
                    children: _.onboarding,
                  ),
                ),
                Obx(
                  () => Container(
                    padding: EdgeInsets.all(24.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: OnBoardingStepper(
                            pages: _.numbPages,
                            currentPages: _.currentPage.value,
                          ),
                        ),
                        ClipOval(
                          child: Container(
                            color: Colors.teal[700],
                            child: IconButton(
                              icon: Icon(
                                _.currentPage.value >= 2
                                    ? Icons.done
                                    : Icons.trending_flat,
                                color: Colors.white,
                              ),
                              onPressed: _.onPressed,
                              padding: EdgeInsets.all(13.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
