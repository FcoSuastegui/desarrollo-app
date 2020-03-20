import 'package:flutter/material.dart';
import 'package:midesarrollo/src/widgets/menu_drawer.dart';
 

class ScaffoldTemplate extends StatefulWidget {

  final title;
  final body;

  ScaffoldTemplate( { @required this.title, @required this.body});

  @override
  _ScaffoldTemplateState createState() => _ScaffoldTemplateState();
}

class _ScaffoldTemplateState extends State<ScaffoldTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.title,
        elevation: 0.0,
        actions: <Widget>[
          //NotificationsTemplate()
        ],
      ),
      drawer: MenuDrawer(),
      body: widget.body,
    );
  }
}