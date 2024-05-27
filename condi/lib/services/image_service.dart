import 'package:flutter/material.dart';

class ImageService {
  final Map<String, Image> _cachedImages = {};

  Future<void> preloadImages(
      BuildContext context, List<String> imagePaths) async {
    for (var path in imagePaths) {
      var image = Image.asset(path);
      await precacheImage(image.image, context);
      _cachedImages[path] = image;
    }
  }

  Image getImage(String path,
      {BoxFit fit = BoxFit.contain, double? width, double? height}) {
    return Image.asset(
      path,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
