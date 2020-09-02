import 'package:flutter/material.dart';
import 'package:midesarrollo/src/helpers/colors.dart';

class NoInformationWidget extends StatelessWidget {
  final String text;
  final Function onPress;

  NoInformationWidget({ this.text = '', @required this.onPress });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(3.0),
                  child: Image.asset(
                    'assets/images/no_information.png',
                  ),
                ),
              ),
            ),
            /* Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text("Sin información!",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold
                )
              )
            ),
            Container(
              margin: EdgeInsets.only(top: 0, bottom: 10),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black38)
              )
            ), */

            InkWell(
              onTap: onPress,
              child: Container(
                margin: EdgeInsets.only(top: 5),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: CustomColors.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.refresh,
                      size: 15,
                      color: Colors.white,
                    ),
                    Text(
                      "Intentar de nuevo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}