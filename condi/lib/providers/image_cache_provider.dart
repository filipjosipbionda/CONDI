import 'package:flutter/material.dart';

class ImageCacheProvider with ChangeNotifier {
  final Map<String, ImageProvider> _cachedImages = {};

  ImageProvider getCachedImage(String url) {
    if (_cachedImages.containsKey(url)) {
      return _cachedImages[url]!;
    } else {
      final imageProvider = NetworkImage(url);
      imageProvider.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((ImageInfo image, bool synchronousCall) {
          _cachedImages[url] = imageProvider;
          notifyListeners();
        }),
      );
      return imageProvider;
    }
  }
}
