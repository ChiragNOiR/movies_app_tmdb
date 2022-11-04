import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String posterUrl;
  final bool isSmall;
  const CustomImage({required this.posterUrl, super.key, this.isSmall = false});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final devicePixelRatio = mediaQuery.devicePixelRatio;
    final screenSize = mediaQuery.size;
    final imageHeightRatio = isSmall ? 0.18 : 0.25;
    final imageWidthRatio = isSmall ? 0.29 : 0.4;
    final imageHeight = screenSize.height * imageHeightRatio;
    final imageWidth = screenSize.width * imageWidthRatio;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        filterQuality: FilterQuality.high,
        imageUrl: posterUrl,
        height: imageHeight,
        width: imageWidth,
        memCacheHeight: (imageHeight * devicePixelRatio).ceil(),
        memCacheWidth: (imageWidth * devicePixelRatio).ceil(),
        fit: BoxFit.fill,
        // errorWidget: (context, url, error) => const ImageLoadError(),
      ),
    );
  }
}
