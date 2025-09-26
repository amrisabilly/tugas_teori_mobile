import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CekHari extends StatefulWidget {
  const CekHari({super.key});

  @override
  State<CekHari> createState() => _CekHariState();
}

class _CekHariState extends State<CekHari> {
  final _nomorController = TextEditingController();
  String _namaHari = '';
  bool _hasChecked = false;

  @override
  void dispose() {
    _nomorController.dispose();
    super.dispose();
  }

  void _cekHari() {
    print('Tombol cek ditekan!');
    print('Nomor: ${_nomorController.text}');

    if (_nomorController.text.isNotEmpty) {
      int nomor = int.tryParse(_nomorController.text) ?? 0;
      
      if (nomor > 0) {
        // Gunakan modulus 7 untuk mendapatkan sisa bagi
        int hasilModulus = nomor % 7;
        
        // Jika hasilnya 0, maka itu hari ke-7 (Minggu)
        if (hasilModulus == 0) {
          hasilModulus = 7;
        }
        
        setState(() {
          switch (hasilModulus) {
            case 1:
              _namaHari = 'Senin';
              break;
            case 2:
              _namaHari = 'Selasa';
              break;
            case 3:
              _namaHari = 'Rabu';
              break;
            case 4:
              _namaHari = 'Kamis';
              break;
            case 5:
              _namaHari = 'Jumat';
              break;
            case 6:
              _namaHari = 'Sabtu';
              break;
            case 7:
              _namaHari = 'Minggu';
              break;
            default:
              _namaHari = 'Error dalam perhitungan';
              break;
          }
          _hasChecked = true;
        });
        
        print('Angka input: $nomor');
        print('Hasil modulus 7: $hasilModulus');
      } else {
        setState(() {
          _namaHari = 'Masukkan angka positif';
          _hasChecked = true;
        });
      }
    } else {
      setState(() {
        _namaHari = 'Masukkan nomor hari';
        _hasChecked = true;
      });
    }

    print('Nama hari: $_namaHari');
    print('Has checked: $_hasChecked');
  }

  void _reset() {
    setState(() {
      _nomorController.clear();
      _namaHari = '';
      _hasChecked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cek Hari',
          style: GoogleFonts.sora(fontSize: 22),
        ),
        backgroundColor: Colors.blueGrey[500],
        foregroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey[300]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 50,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Cek Hari',
                        style: GoogleFonts.sora(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Masukkan nomor untuk mengetahui hari',
                        style: GoogleFonts.sora(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Input Fields
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.95),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Masukkan Angka (Modulus 7)',
                            style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Info Card
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.blue.withOpacity(0.3)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cara Kerja Modulus 7:',
                                  style: GoogleFonts.sora(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[800],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '• Masukkan angka berapa saja (contoh: 121212)',
                                  style: GoogleFonts.sora(
                                    fontSize: 13,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '• Sistem akan menghitung: angka % 7',
                                  style: GoogleFonts.sora(
                                    fontSize: 13,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '• Hasil sisa bagi menentukan hari',
                                  style: GoogleFonts.sora(
                                    fontSize: 13,
                                    color: Colors.grey[700],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Mapping Hasil:',
                                  style: GoogleFonts.sora(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue[800],
                                  ),
                                ),
                                const SizedBox(height: 4),
                                _buildInfoRow('1', 'Senin'),
                                _buildInfoRow('2', 'Selasa'),
                                _buildInfoRow('3', 'Rabu'),
                                _buildInfoRow('4', 'Kamis'),
                                _buildInfoRow('5', 'Jumat'),
                                _buildInfoRow('6', 'Sabtu'),
                                _buildInfoRow('0', 'Minggu'),
                              ],
                            ),
                          ),

                          const SizedBox(height: 20),

                          // Input Nomor
                          _buildInputField(
                            controller: _nomorController,
                            label: 'Masukkan Angka (contoh: 121212)',
                            icon: Icons.numbers,
                            color: Colors.indigo,
                          ),
                          const SizedBox(height: 25),

                          // Buttons
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _cekHari,
                                  icon: const Icon(
                                    Icons.search,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Cek Hari',
                                    style: GoogleFonts.sora(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepPurple,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 15,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              ElevatedButton.icon(
                                onPressed: _reset,
                                icon: const Icon(
                                  Icons.refresh,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Reset',
                                  style: GoogleFonts.sora(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey[600],
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 15,
                                    horizontal: 20,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 25),

                          // Results
                          if (_hasChecked) ...[
                            Text(
                              'Hasil Pengecekan',
                              style: GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                            const SizedBox(height: 15),

                            // Result Card dengan informasi tambahan
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: _getColorByDay(_namaHari).withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: _getColorByDay(_namaHari).withOpacity(0.3)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: _getColorByDay(_namaHari),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: const Icon(Icons.calendar_month, color: Colors.white, size: 24),
                                      ),
                                      const SizedBox(width: 15),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nama Hari',
                                              style: GoogleFonts.sora(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            Text(
                                              _namaHari,
                                              style: GoogleFonts.sora(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: _getColorByDay(_namaHari),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  if (_nomorController.text.isNotEmpty && !_namaHari.contains('Masukkan') && !_namaHari.contains('Error')) ...[
                                    const SizedBox(height: 12),
                                    Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.grey.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Perhitungan:',
                                            style: GoogleFonts.sora(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '${_nomorController.text} % 7 = ${(int.tryParse(_nomorController.text) ?? 0) % 7 == 0 ? 7 : (int.tryParse(_nomorController.text) ?? 0) % 7}',
                                            style: GoogleFonts.sora(
                                              fontSize: 12,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String number, String day) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                number,
                style: GoogleFonts.sora(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '= $day',
            style: GoogleFonts.sora(
              fontSize: 13,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
        color: color.withOpacity(0.05),
      ),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: color),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
          labelStyle: GoogleFonts.sora(color: color),
        ),
      ),
    );
  }

  Color _getColorByDay(String day) {
    switch (day) {
      case 'Senin':
        return Colors.red;
      case 'Selasa':
        return Colors.orange;
      case 'Rabu':
        return Colors.green;
      case 'Kamis':
        return Colors.blue;
      case 'Jumat':
        return Colors.purple;
      case 'Sabtu':
        return Colors.teal;
      case 'Minggu':
        return Colors.pink;
      default:
        return Colors.grey;
    }
  }
}
