import 'package:flutter/material.dart';
import 'package:midesarrollo/src/helpers/colors.dart';

class InputSwitchFieldBloc extends StatelessWidget {
  final bool value;
  final String text;
  final ValueChanged<bool> onChanged;

  InputSwitchFieldBloc({
    Key key,
    @required this.value,
    @required this.text,
    @required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.0, bottom: 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(left: 0.0),
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
              value: value,
              onChanged: onChanged,
              activeTrackColor: CustomColors.primaryColor,
              activeColor: CustomColors.primaryColor,
            ),
            margin: EdgeInsets.only(right: 20.0),
          )
        ],
      ),
    );
  }
}
