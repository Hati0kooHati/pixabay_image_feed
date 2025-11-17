import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pixabay_image_feed/features/home/view/state/home_state.dart';
import 'package:pixabay_image_feed/features/home/view/viewmodel/home_view_model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(homeViewModelProvider.notifier).loadList();
    });

    super.initState();
  }

  bool onScrollNotification(ScrollEndNotification scrollInfo) {
    final isAtBottom =
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent;

    if (!isAtBottom) return false;

    ref.read(homeViewModelProvider.notifier).loadList();

    return false;
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent;

    final state = ref.watch(homeViewModelProvider);

    ref.listen<HomeState>(homeViewModelProvider, (previous, next) {
      if (next.errorMessage != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage!)));
      }
    });

    if (state.isLoading && state.pictureList.isEmpty) {
      mainContent = Center(child: CircularProgressIndicator());
    } else if (state.pictureList.isEmpty) {
      mainContent = Center(
        child: Text("no photo", style: TextStyle(color: Colors.white)),
      );
    } else {
      final pictureListLen = state.pictureList.length;

      mainContent = NotificationListener(
        onNotification: onScrollNotification,
        child: MasonryGridView.count(
          itemCount: pictureListLen,
          crossAxisCount: 2,
          crossAxisSpacing: 17,
          mainAxisSpacing: 17,
          padding: EdgeInsets.all(17),

          itemBuilder: (context, index) {
            return Container(
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),

              child: CachedNetworkImage(
                imageUrl: state.pictureList[index].url,
                placeholder: (context, url) => Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: BoxBorder.all(color: Colors.white, width: 1.4),
                  ),
                  child: Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: BoxBorder.all(color: Colors.white, width: 1.4),
                  ),
                  child: Icon(Icons.error, color: Colors.red),
                ),
              ),
            );
          },
        ),
      );
    }

    return mainContent;
  }
}
