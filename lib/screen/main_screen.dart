import 'package:flutter/material.dart';
import 'package:flutter_application/screen/favorite_screen.dart';
import 'package:flutter_application/screen/home_screen.dart';
import 'package:flutter_application/widgets/bottom_nav_item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const _screens = [HomeScreen(), FavoriteScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///extendBody: true akan membuat 'body' bisa di scroll SAMPAI KE BELAKANG navbar bawah yang melakukan
      ///bukan berhenti tepat di atasnya
      extendBody: true,
      body: IndexedStack(index: _selectedIndex, children: _screens),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Container(
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 24,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: BottomNavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex == 0),
                ),
              ),
              Expanded(
                child: BottomNavItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  selected: _selectedIndex == 0,
                  onTap: () => setState(() => _selectedIndex == 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
