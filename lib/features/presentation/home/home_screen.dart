import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/presentation/layout/main_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      body: SafeArea(
        child: Column(
          children: [
            // Header tanpa AppBar
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Halaman Home',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // Grid Menu
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: List.generate(3, (index) {
                    final customColors = [
                      Colors.red[300],
                      Colors.blue[400],
                      Colors.green[200],
                    ];
                    final dataMenu = [
                      "Layang - Layang",
                      "Lingkaran",
                      "Trapesium",
                    ];
                    return GestureDetector(
                      onTap: () {
                        // Navigasi ke halaman sesuai index
                        print("Menu ${dataMenu[index]} dipilih");
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: customColors[index % customColors.length],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            dataMenu[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
