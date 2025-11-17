import 'package:pixabay_image_feed/features/home/models/picture.dart';

class HomeState {
  final List<Picture> pictureList;
  final bool isLoading;
  String? errorMessage;

  HomeState({required this.pictureList, bool? isLoading, this.errorMessage})
    : isLoading = isLoading ?? false;

  HomeState copyWith({
    List<Picture>? pictureList,
    bool? isLoading,
    String? errorMessage,
  }) {
    return HomeState(
      pictureList: pictureList ?? this.pictureList,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
