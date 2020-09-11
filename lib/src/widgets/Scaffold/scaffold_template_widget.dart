import 'package:flutter/material.dart';
import 'package:midesarrollo/src/widgets/Appbar/app_bar_custom.dart';

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
      appBar: AppBarCustom(
        appBarTitle: title,
        actions: actions,
        leadingIcon: leading,
      ),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0.0),
            topRight: Radius.circular(0.0),
          ),
        ),
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
