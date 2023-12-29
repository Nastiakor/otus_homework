import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int currentIndex;

  const MyBottomNavigationBar({required this.currentIndex, super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  final int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFFFFFFFF),
      selectedLabelStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 10,
      ),
      selectedItemColor: const Color(0xFF2ECC71),
      unselectedLabelStyle: GoogleFonts.roboto(
        fontWeight: FontWeight.w400,
        fontSize: 10,
      ),
      unselectedItemColor: const Color(0xFFC2C2C2),
      items: [
        BottomNavigationBarItem(
          label: 'Рецепты',
          icon: Image.asset('assets/images/pizza_icon.png',
              width: 24, height: 24),
        ),
        BottomNavigationBarItem(
          label: 'Вход',
          icon:
              Image.asset('assets/images/user_icon.png', width: 24, height: 24),
        ),
      ],
    );
  }
}
