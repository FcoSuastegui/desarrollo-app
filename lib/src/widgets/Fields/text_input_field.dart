import 'package:midesarrollo/src/helpers/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldInput extends StatelessWidget {
  final String labelText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final Function onSubmitted;

  TextFieldInput({
    Key key,
    @required this.labelText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: textInputAction,
      onSubmitted: onSubmitted ?? (_) =>  FocusScope.of(context).nextFocus(),
      keyboardType: keyboardType,
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.borderColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColors.borderColor,
          ),
        ),
        labelText: labelText,
        labelStyle: GoogleFonts.lato(fontSize: 15.0, color: Colors.grey[600]),
      ),
    );
  }
}
