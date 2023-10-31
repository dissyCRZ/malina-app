import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedWithDefaultImage extends StatelessWidget {
  const CachedWithDefaultImage({
    Key? key,
    required this.imageUrl,
    required this.defautImage,
    this.imageCover,
    this.defaultCover,
  }) : super(key: key);

  final String? imageUrl;
  final String defautImage;
  final BoxFit? imageCover;
  final BoxFit? defaultCover;

  @override
  Widget build(BuildContext context) {
    return imageUrl != null && imageUrl!.contains('http')
        ? CachedNetworkImage(
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
            errorWidget: (context, url, error) => Image.asset(
              defautImage,
              fit: defaultCover ?? BoxFit.cover,
            ),
            imageUrl: imageUrl!,
            fit: imageCover ?? BoxFit.cover,
          )
        : Image.asset(
            defautImage,
            fit: defaultCover ?? BoxFit.cover,
          );
  }
}
