import 'package:flutter/material.dart';
import 'package:module_a/page/basket/Basket.dart';
import 'package:module_a/page/catalog/CatalogPage.dart';
import 'package:module_a/page/profiler/ProfilerPage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0; 

  final List<Widget> _pages = [
     CatalogPage(),   
     BasketPage(),      
    const Profilerpage(), 
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, 
        onTap: _onItemTapped,         
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/home_icon.png', width: 24, height: 24),
            label: 'Каталог',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/shop_icon.png', width: 24, height: 24),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/profile_icon.png', width: 24, height: 24),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}