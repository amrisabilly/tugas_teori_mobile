import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LayoutPage extends StatefulWidget {
  final Widget body;
  final String currentRoute;
  final Widget? bottomNavigationBar;

  const LayoutPage({
    super.key,
    required this.body,
    required this.currentRoute,
    this.bottomNavigationBar,
  });

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _setCurrentIndex();
  }

  @override
  void didUpdateWidget(LayoutPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentRoute != widget.currentRoute) {
      _setCurrentIndex();
    }
  }

  void _setCurrentIndex() {
    switch (widget.currentRoute) {
      case '/':
      case '/home':
        _currentIndex = 0;
        break;
      case '/profile':
        _currentIndex = 1;
        break;
      default:
        _currentIndex = 0;
    }
  }

  void _onItemTapped(int index) {
    // Jangan update state jika sudah di halaman yang sama
    if (_currentIndex == index) return;

    setState(() {
      _currentIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.go('/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      bottomNavigationBar: widget.bottomNavigationBar ??
          BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _onItemTapped,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: Colors.blue[600],
            unselectedItemColor: Colors.grey[400],
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            elevation: 8,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
    );
  }
}