import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learnbuddy/view/bottom_nav_bar/provider/bottom_nav_counter.dart';
import 'package:learnbuddy/view/chatting_screen/screens/chatt_list_screen.dart';
import 'package:learnbuddy/view/home_screen/screen/home_screen.dart';
import 'package:learnbuddy/view/settings_screen/screens/settings_screen.dart';
import 'package:learnbuddy/view/shedule_screen/screens/shedule_screen.dart';

class BottomNavScreen extends ConsumerStatefulWidget {
  const BottomNavScreen({super.key});

  @override
  ConsumerState<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends ConsumerState<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> navScreens = [
      HomeScreen(),
      SheduleScreen(),
      ChattListScreen(),
      SettingsScreen(),
    ];

    int counter = ref.watch(bottomNavCounterProvider);

    return Scaffold(
      body: Stack(
        children: [
          /// Main content
          Positioned.fill(child: navScreens[counter]),

          /// Bottom nav
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 3,
                    horizontal: 12,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE24C00),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem(
                        index: 0,
                        counter: counter,
                        iconPath: 'assets/bottom_nav_icons/home.png',
                      ),
                      _buildNavItem(
                        index: 1,
                        counter: counter,
                        iconPath: 'assets/bottom_nav_icons/shedule_icon.png',
                      ),
                      _buildNavItem(
                        index: 2,
                        counter: counter,
                        iconPath: 'assets/bottom_nav_icons/Messaging.png',
                      ),
                      _buildNavItem(
                        index: 3,
                        counter: counter,
                        iconPath: 'assets/bottom_nav_icons/Settings.png',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required int counter,
    required String iconPath,
  }) {
    final isActive = index == counter;
    return InkWell(
      onTap: () {
        ref.read(bottomNavCounterProvider.notifier).state = index;
      },
      borderRadius: BorderRadius.circular(30),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8),
        child: isActive
            ? CircleAvatar(
                radius: 28, // fixed circular size (good across devices)
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Image.asset(
                    iconPath,
                    color: const Color(0xFFE24C00),
                    fit: BoxFit.contain,
                  ),
                ),
              )
            : Image.asset(iconPath, color: Colors.white, height: 28, width: 28),
      ),
    );
  }
}
