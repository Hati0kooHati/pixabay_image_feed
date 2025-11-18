import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay_image_feed/core/constants/constants.dart';
import 'package:pixabay_image_feed/core/network/dio/dio_interceptors.dart';

final dioProvider = Provider((ref) {
  return Dio()
    ..options.baseUrl = Constants.pixabayBaseUrl
    ..interceptors.add(PixabayImageFeedInterceptor());
});
