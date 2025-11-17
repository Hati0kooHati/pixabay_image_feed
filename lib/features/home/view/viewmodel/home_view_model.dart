import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay_image_feed/features/home/models/picture.dart';
import 'package:pixabay_image_feed/features/home/repository/home_repository.dart';
import 'package:pixabay_image_feed/features/home/view/state/home_state.dart';

final homeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  HomeViewModel.new,
);

class HomeViewModel extends Notifier<HomeState> {
  late final HomeRepository _homeRepository;

  final int _limit = 10;
  int _page = 1;

  @override
  build() {
    _homeRepository = ref.read(homeRepositoryProvider);

    return HomeState(pictureList: [], isLoading: true);
  }

  void loadList() async {
    try {
      state.copyWith(isLoading: true);

      final List<Picture> pictureList = await _homeRepository.loadPictures(
        limit: _limit,
        page: _page,
      );

      _page += 1;

      state = state.copyWith(
        pictureList: [...state.pictureList, ...pictureList],
        isLoading: false,
      );

      print(pictureList);
      print(pictureList[0].url);
    } catch (e) {
      state = state.copyWith(
        errorMessage: "Couldn't load data",
        isLoading: false,
      );

      state.copyWith(errorMessage: null);

      print("failed HomeViewModel - loadList: $e");
    }
  }
}
