import 'package:flutter/material.dart';
import 'package:flutter_application_3/features/presentation/layout/main_layout.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      currentRoute: '/home',
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[300]!, Colors.blue[500]!],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Icon(Icons.home, size: 50, color: Colors.white),
                    const SizedBox(height: 10),
                    Text(
                      'Halaman Home',
                      style: GoogleFonts.sora(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Pilih menu aplikasi di bawah ini',
                      style: GoogleFonts.sora(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),

              // Grid Menu
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Text(
                        'Menu Aplikasi',
                        style: GoogleFonts.sora(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                      const SizedBox(height: 20),

                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1.1,
                          children: [
                            _buildMenuCard(
                              context: context,
                              title: "Kalkulator\nPiramida",
                              subtitle: "Hitung Volume\n& Keliling",
                              icon: Icons.change_history,
                              color: Colors.deepPurple,
                              route: '/piramida',
                            ),
                            _buildMenuCard(
                              context: context,
                              title: "Konversi\nWaktu",
                              subtitle: "WIB, WITA, WIT",
                              icon: Icons.access_time,
                              color: Colors.teal,
                              route: '/konversiWaktu',
                            ),
                            _buildMenuCard(
                              context: context,
                              title: "Cek Hari\nSekarang",
                              subtitle: "Info Hari\nTerkini",
                              icon: Icons.calendar_today,
                              color: Colors.orange,
                              route: '/konversiHari',
                            ),
                            _buildMenuCard(
                              context: context,
                              title: "Coming\nSoon",
                              subtitle: "Fitur Baru\nSegera Hadir",
                              icon: Icons.star_outline,
                              color: Colors.grey,
                              route: null, // No route for coming soon
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    String? route,
  }) {
    return GestureDetector(
      onTap: () {
        if (route != null) {
          context.go(route);
        } else {
          // Show coming soon message
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Fitur ini akan segera hadir!',
                style: GoogleFonts.sora(),
              ),
              backgroundColor: Colors.grey[600],
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(0.8), color],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 15,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, size: 35, color: Colors.white),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.sora(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
