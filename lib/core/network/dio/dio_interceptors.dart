import 'package:dio/dio.dart';
import 'package:pixabay_image_feed/core/constants/constants.dart';

class PixabayImageFeedInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print("interceptor is working");

    final String token = Constants.token;

    final Map<String, dynamic> headers = {"Token": token};

    options.headers.addAll(headers);

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // TODO: implement onError
    super.onError(err, handler);
  }
}
