import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_application_3/features/presentation/layout/main_layout.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutPage(
      currentRoute: '/profile', 
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo[400]!, Colors.indigo[600]!],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Header Profile
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Profile Picture
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.indigo, width: 4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Container(
                            color: Colors.indigo[50],
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.indigo[400],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Name
                      Text(
                        'Nama Lengkap Anda',
                        style: GoogleFonts.sora(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo[800],
                        ),
                      ),
                      const SizedBox(height: 5),

                      // NIM
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.indigo[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          'NIM: 123456789',
                          style: GoogleFonts.sora(
                            fontSize: 16,
                            color: Colors.indigo[600],
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Personal Information Card
                _buildInfoCard(
                  title: 'Informasi Personal',
                  icon: Icons.person_outline,
                  color: Colors.blue,
                  children: [
                    _buildInfoItem(
                      icon: Icons.cake_outlined,
                      label: 'Tempat, Tanggal Lahir',
                      value: 'Jakarta, 1 Januari 2000',
                      color: Colors.pink,
                    ),
                    _buildInfoItem(
                      icon: Icons.email_outlined,
                      label: 'Email',
                      value: 'nama@email.com',
                      color: Colors.red,
                    ),
                    _buildInfoItem(
                      icon: Icons.phone_outlined,
                      label: 'No. Telepon',
                      value: '+62 812-3456-7890',
                      color: Colors.green,
                    ),
                    _buildInfoItem(
                      icon: Icons.location_on_outlined,
                      label: 'Alamat',
                      value: 'Jl. Contoh No. 123, Jakarta',
                      color: Colors.orange,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Academic Information Card
                _buildInfoCard(
                  title: 'Informasi Akademik',
                  icon: Icons.school_outlined,
                  color: Colors.purple,
                  children: [
                    _buildInfoItem(
                      icon: Icons.account_balance_outlined,
                      label: 'Universitas',
                      value: 'Nama Universitas',
                      color: Colors.indigo,
                    ),
                    _buildInfoItem(
                      icon: Icons.class_outlined,
                      label: 'Fakultas',
                      value: 'Fakultas Teknik',
                      color: Colors.teal,
                    ),
                    _buildInfoItem(
                      icon: Icons.computer_outlined,
                      label: 'Program Studi',
                      value: 'Teknik Informatika',
                      color: Colors.blue,
                    ),
                    _buildInfoItem(
                      icon: Icons.calendar_today_outlined,
                      label: 'Semester',
                      value: 'Semester 5',
                      color: Colors.deepPurple,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Hobbies Card
                _buildInfoCard(
                  title: 'Hobi & Minat',
                  icon: Icons.favorite_outline,
                  color: Colors.pink,
                  children: [
                    _buildHobbyItem(
                      icon: Icons.code_outlined,
                      hobby: 'Programming',
                      color: Colors.blue,
                    ),
                    _buildHobbyItem(
                      icon: Icons.sports_soccer_outlined,
                      hobby: 'Sepak Bola',
                      color: Colors.green,
                    ),
                    _buildHobbyItem(
                      icon: Icons.music_note_outlined,
                      hobby: 'Musik',
                      color: Colors.purple,
                    ),
                    _buildHobbyItem(
                      icon: Icons.camera_alt_outlined,
                      hobby: 'Fotografi',
                      color: Colors.orange,
                    ),
                    _buildHobbyItem(
                      icon: Icons.book_outlined,
                      hobby: 'Membaca',
                      color: Colors.teal,
                    ),
                    _buildHobbyItem(
                      icon: Icons.movie_outlined,
                      hobby: 'Menonton Film',
                      color: Colors.red,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // About App Card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              Icons.info_outline,
                              color: Colors.grey[600],
                              size: 24,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Text(
                            'Tentang Aplikasi',
                            style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Aplikasi ini merupakan tugas mata kuliah Pemrograman Mobile yang berisi kalkulator piramida, konversi waktu zona Indonesia, dan informasi profile pengembang. Dibuat dengan Flutter dan menggunakan Google Fonts.',
                          style: GoogleFonts.sora(
                            fontSize: 14,
                            color: Colors.grey[700],
                            height: 1.5,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required IconData icon,
    required Color color,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: GoogleFonts.sora(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: GoogleFonts.sora(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHobbyItem({
    required IconData icon,
    required String hobby,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: color),
            const SizedBox(width: 8),
            Text(
              hobby,
              style: GoogleFonts.sora(
                fontSize: 14,
                color: color,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
