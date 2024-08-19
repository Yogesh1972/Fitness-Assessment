import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;
  final BoxFit fit;
  const CachedImage(this.url, this.imageBuilder,
      {super.key, this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      key: UniqueKey(),
      imageUrl: url,
      imageBuilder: imageBuilder,
      fit: fit,
      errorWidget: (context, url, error) => const Image(
          image: AssetImage('assets/image_loading_error.jpg'),
          fit: BoxFit.fill),
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
          child: CircularProgressIndicator(
        value: downloadProgress.progress,
        color: Colors.grey,
        strokeWidth: 2,
      )),
    );
  }
}
