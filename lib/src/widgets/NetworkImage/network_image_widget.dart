import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageWidget extends StatelessWidget {
  final String image;
  final BoxFit fit;
  final double width,height;
  const NetworkImageWidget(this.image, {Key key,this.fit,this.height,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Image.asset('assets/images/imagen_no_disponible.png',fit: BoxFit.cover,),
      fit: fit,
      width: width,
      height: height,
    );
  }
}