import 'package:flutter/material.dart';
import 'package:midesarrollo/src/widgets/Buttons/back_button.dart';

class ScaffoldTemplateWidget extends StatelessWidget {
  final String title;
  final IconData leading;
  final Widget body, floatingActionButton;
  final List<Widget> actions;
  final bool resizeToAvoidBottomInset;

  ScaffoldTemplateWidget({
    @required this.body,
    this.title = '',
    this.actions,
    this.floatingActionButton,
    this.leading,
    this.resizeToAvoidBottomInset = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [Colors.teal[900], Colors.teal[800], Colors.teal[400]],
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 45.0, left: 10.0, right: 20.0),
                  child: Row(
                    children: <Widget>[
                      leading != null
                          ? Container(
                              alignment: Alignment.topLeft,
                              margin: EdgeInsets.only(top: 15.0),
                              child: BackButtonWidget(icon: leading),
                            )
                          : Container(),
                      Expanded(
                        child: Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 15.0, left: 10.0),
                            child: Text(
                              title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            )),
                      ),
                      actions != null
                          ? Container(
                              alignment: Alignment.topLeft,
                              height: 30.0,
                              margin: EdgeInsets.only(top: 0.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: actions,
                              ),
                            )
                          : Container()
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(top: 20.0, left: 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(0.0),
                        topRight: Radius.circular(0.0),
                      ),
                    ),
                    child: body,
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton:
          floatingActionButton != null ? floatingActionButton : null,
    );
  }
}
