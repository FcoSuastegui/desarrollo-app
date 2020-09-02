import 'package:flutter/material.dart';

class LogoutTemplate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder( borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Text(
                    "¿Deseas salir de la aplicación?",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w400
                    ),
                  )
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.pushReplacementNamed(context, '/'),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only( left: 0, right: 5, top: 20, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.teal[800], 
                            borderRadius:BorderRadius.all(Radius.circular(100))
                          ),
                          child: Text(
                            "Si",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 5, right: 0, top: 20, bottom: 0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black54, width: 0.5), 
                            borderRadius: BorderRadius.all(Radius.circular(100))
                          ),
                          child: Text(
                            "No",
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ),
                      )
                    )
                  ]
                )
              ]
            )
          )
        )
      )
    );
  }
}