import 'package:flutter/material.dart';
import 'package:midesarrollo/src/helpers/colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey, width: 0.3),
        borderRadius: BorderRadius.all( Radius.circular(100.0))
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Buscar",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 0.5),
            child: Icon(Icons.search,size: 20.0, color: CustomColors.iconColor)
          ),
        ],
      ),
    );
  }
}