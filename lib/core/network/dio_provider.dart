import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay_image_feed/core/constants/constants.dart';

final dioProvider = Provider(
  (ref) => Dio(BaseOptions(baseUrl: Constants.pixabayBaseUrl)),
);
