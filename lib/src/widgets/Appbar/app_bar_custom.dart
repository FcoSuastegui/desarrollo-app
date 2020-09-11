import 'package:flutter/material.dart';
import 'package:midesarrollo/src/widgets/Buttons/back_button.dart';

class AppBarCustom extends AppBar {
  final String appBarTitle;
  final IconData leadingIcon;
  final List<Widget> actions;

  AppBarCustom({
    @required this.appBarTitle,
    this.leadingIcon,
    this.actions,
  }) : super(
          centerTitle: false,
          automaticallyImplyLeading: true,
          title: Text(
            appBarTitle,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
          elevation: 0.0,
          backgroundColor: Colors.teal[800],
          leading: leadingIcon != null
              ? BackButtonWidget(icon: leadingIcon)
              : leadingIcon,
          actions: actions,
        );
}
