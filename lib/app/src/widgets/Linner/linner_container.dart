import 'package:flutter/material.dart';

class LinnerContainer extends StatelessWidget {
  final double top, left, right, bottom, width;
  final Widget child;

  LinnerContainer({
    this.top = 0.0,
    this.bottom = 10.0,
    this.left = 10.0,
    this.right = 10.0,
    this.child,
    this.width = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(bottom: bottom),
      margin: EdgeInsets.only(
        top: top,
        left: left,
        right: right,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: width,
            color: Colors.black38,
          ),
        ),
      ),
      child: child,
    );
  }
}
