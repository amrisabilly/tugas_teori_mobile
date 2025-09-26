import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  final Widget body;
  final Widget? bottomNavigationBar;

  const LayoutPage({super.key, required this.body, this.bottomNavigationBar});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar:
          bottomNavigationBar ??
          BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.calculate),
                label: 'Hitung',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
    );
  }
}
