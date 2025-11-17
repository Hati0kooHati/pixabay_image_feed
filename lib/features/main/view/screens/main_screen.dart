import 'package:flutter/material.dart';
import 'package:pixabay_image_feed/core/constants/app_strings.dart';
import 'package:pixabay_image_feed/core/icons/icomoon_icons.dart';
import 'package:pixabay_image_feed/features/home/view/screens/home_screen.dart';
import 'package:pixabay_image_feed/features/main/view/widgets/main_custom_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTabIndex = 0;
  final List<Widget> screens = [
    HomeScreen(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
    SizedBox(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          screens[currentTabIndex],
          Positioned(
            left: 0,
            right: 0,
            bottom: 690,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: MainCustomAppBar(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        currentIndex: currentTabIndex,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        onTap: (index) => setState(() {
          currentTabIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icomoon.home, color: Colors.white, size: 30),
            activeIcon: Icon(Icomoon.home, color: Colors.red, size: 30),
            label: AppStrings.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icomoon.boards, color: Colors.white, size: 30),
            activeIcon: Icon(Icomoon.boards, color: Colors.red, size: 30),
            label: AppStrings.boards,
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red,
              ),
              child: Icon(Icons.add, color: Colors.white, size: 45),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icomoon.messages, color: Colors.white, size: 30),
            activeIcon: Icon(Icomoon.messages, color: Colors.red, size: 30),
            label: AppStrings.messages,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icomoon.profile, color: Colors.green, size: 30),
            activeIcon: Icon(Icomoon.profile, color: Colors.red, size: 30),
            label: AppStrings.profile,
          ),
        ],
      ),
    );
  }
}
