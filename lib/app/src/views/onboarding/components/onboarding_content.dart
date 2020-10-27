import 'package:flutter/material.dart';
import 'package:midesarrollo/app/app.dart';
import 'package:midesarrollo/app/src/themes/app_theme.dart';

class OnBoardingContent extends StatelessWidget {
  final String title, subtitle, image;
  final bool isTop;

  OnBoardingContent({
    @required this.title,
    @required this.image,
    this.subtitle,
    this.isTop = true,
  }) : assert(title != null);
  @override
  Widget build(BuildContext context) {
    final ThemeData _theme = Theme.of(context);
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: AppTheme.kPrimaryGradientColor,
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Positioned(
          top: isTop ? 30.0 : null,
          bottom: isTop ? null : 0.0,
          child: Container(
            height: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    subtitle,
                    maxLines: 4,
                    softWrap: false,
                    style: _theme.textTheme.bodyText1.merge(
                      TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
