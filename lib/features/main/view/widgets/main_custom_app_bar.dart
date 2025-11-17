import 'package:flutter/material.dart';
import 'package:pixabay_image_feed/core/constants/app_strings.dart';
import 'package:pixabay_image_feed/core/icons/icomoon_icons.dart';

class MainCustomAppBar extends StatelessWidget {
  const MainCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actions: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(180, 0, 0, 0),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icomoon.notificationBell, color: Colors.white),
          ),
        ),

        const Spacer(),

        Row(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                AppStrings.explore,
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: () {},
              child: Text(
                AppStrings.forYou,
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
          ],
        ),

        const Spacer(),

        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color.fromARGB(180, 0, 0, 0),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icomoon.searchLoop, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
