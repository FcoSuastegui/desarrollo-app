import 'package:flutter/material.dart';
import 'package:midesarrollo/src/helpers/colors.dart';

class SwitchWidget extends StatelessWidget {
  final String text;
  final bool active;
  final Function onchange;
  final double top, bottom, left, right;

  SwitchWidget({ 
    @required this.text, 
    @required this.active, 
    @required this.onchange,
    this.top = 0.0,
    this.bottom = 0.0,
    this.left = 0.0,
    this.right = 0.0
  });
  
  @override
  Widget build(BuildContext context) => Container(
    
    margin: EdgeInsets.only(top: top, bottom: bottom ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(left: left),
            child: Text(
              text,
              style: TextStyle(
                color: Colors.black45,
              ),
            ),
          ),
        ),
        Container(
          child: Switch(
            value: active,
            onChanged: onchange,
            activeTrackColor: CustomColors.primaryColor,
            activeColor: CustomColors.primaryColor,
          ),
          margin: EdgeInsets.only(right: 20.0)
        ) 
      ]
    )
  );
}

