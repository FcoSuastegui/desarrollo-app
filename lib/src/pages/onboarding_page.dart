import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:midesarrollo/src/preferences/preferences.dart';
import 'package:midesarrollo/src/widgets/onboarding_stepper.dart';
import 'package:midesarrollo/src/widgets/onboarding_template.dart';

class OnBoardingPage extends StatefulWidget {
  
  static final String routeName = 'onboarding';
  
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  
  final _prefs = new Preferencias();
  final PageController _pageViewController = PageController(initialPage: 0);
  
  final int _numPages = 3;
  int _currentPage = 0;

  @override
  @override
  void initState() { 
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.9 ],
              colors: [
                Color.fromRGBO(50, 150, 136, 1.0),
                Color.fromRGBO(50, 110, 120, 1.0),
                Color.fromRGBO(0, 38, 62, 1.0)
              ],
            )
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView(
                  controller: _pageViewController,
                  onPageChanged: (int page) {
                    setState(() {
                        _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    OnBoardingTemplate(
                      title: "Conoce",
                      subtitle: "El estado de tu propiedad.",
                      image: Image.asset("assets/images/onboarding0.png"),
                    ),
                    OnBoardingTemplate(
                      title: "Consulta.",
                      subtitle: "Tus estados de cuenta, abonos, adeudos desde donde te encuentres.",
                      image: Image.asset("assets/images/onboarding1.png"),
                    ),
                    OnBoardingTemplate(
                      title: "Revisa.",
                      subtitle: "Las publicaciones que se hacen por desarrollo dentro de la plataforma.",
                      image: Image.asset("assets/images/onboarding2.png"),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(24.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: OnBoardingStepper(pages: _numPages, currentPages: _currentPage)
                    ),
                    ClipOval(
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        child: IconButton(
                          icon: Icon(
                            _currentPage >= 2 ? Icons.done : Icons.trending_flat, 
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (_pageViewController.page >= 2) {
                                _prefs.onboarding = 1;
                                Navigator.pushReplacementNamed(context, 'inicio');
                              return;
                            }
                            _pageViewController.nextPage(
                                duration: Duration(milliseconds: 500),
                                curve: Curves.ease);
                          },
                          padding: EdgeInsets.all(13.0),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
