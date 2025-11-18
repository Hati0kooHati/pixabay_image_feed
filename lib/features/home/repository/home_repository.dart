import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay_image_feed/core/constants/constants.dart';
import 'package:pixabay_image_feed/core/network/dio/dio_provider.dart';
import 'package:pixabay_image_feed/features/home/models/picture.dart';

final homeRepositoryProvider = Provider((ref) {
  final dio = ref.read(dioProvider);

  return HomeRepository(dio);
});

class HomeRepository {
  final Dio _dio;

  const HomeRepository(this._dio);

  Future<List<Picture>> loadPictures({
    required int page,
    required int limit,
  }) async {
    final query =
        "?key=${Constants.pixabayApiKey}&image_type=photo&page=$page&per_page=$limit";

    try {
      final response = await _dio.get(query);

      final responseData = response.data;

      final List<Picture> pictureList = (responseData["hits"] as List)
          .map((data) => Picture.fromJson(data))
          .toList();

      return pictureList;
    } catch (e) {
      print("failed HomeRepository - loadPictures: $e");
      rethrow;
    }
  }
}
