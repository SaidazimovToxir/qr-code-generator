import 'package:flutter/material.dart';
import 'package:qr_scanner_app/views/screens/generate_qr_scanner.dart';
import 'package:qr_scanner_app/views/screens/home_screen.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int currentIndex = 0;

  final List pages = [
    const HomeScreen(),
    const GenerateQrScanner(),
    const Placeholder(),
  ];

  void onTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  Widget buildTabIcon(IconData icon, String label, int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () => onTapped(index),
          child: Icon(
            icon,
            size: 30,
            color: currentIndex == index
                ? const Color(0xffFDB623)
                : const Color(0xffD9D9D9),
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontFamily: "itim",
            fontSize: 15,
            color: currentIndex == index
                ? const Color(0xffFDB623)
                : const Color(0xffD9D9D9),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pages[currentIndex],
          Positioned(
            bottom: 15,
            left: 25,
            right: 25,
            child: Container(
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xffFDB623),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 25,
            right: 25,
            child: Container(
              width: double.infinity,
              height: 65,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xff333333),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildTabIcon(Icons.qr_code_2_sharp, "Generate", 1),
                    buildTabIcon(Icons.history, "History", 2),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => onTapped(0),
              child: Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xffFDB623),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffFDB623),
                      blurRadius: 10,
                      offset: Offset(0, 0),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(17.0),
                  child: Center(
                    child: Image.asset("assets/icons/qr_icon.png"),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
