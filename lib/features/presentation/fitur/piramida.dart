import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Piramida extends StatefulWidget {
  const Piramida({super.key});

  @override
  State<Piramida> createState() => _PiramidaState();
}

class _PiramidaState extends State<Piramida> {
  final _panjangController = TextEditingController();
  final _lebarController = TextEditingController();
  final _tinggiController = TextEditingController();
  double _volume = 0.0;
  double _keliling = 0.0;
  bool _hasCalculated = false; // Tambahkan flag untuk tracking perhitungan

  @override
  void dispose() {
    _panjangController.dispose();
    _lebarController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  void _hitungVolume() {
    if (_panjangController.text.isNotEmpty &&
        _lebarController.text.isNotEmpty &&
        _tinggiController.text.isNotEmpty) {
      double panjang = double.tryParse(_panjangController.text) ?? 0;
      double lebar = double.tryParse(_lebarController.text) ?? 0;
      double tinggi = double.tryParse(_tinggiController.text) ?? 0;

      if (panjang > 0 && lebar > 0 && tinggi > 0) {
        _volume = (1 / 3) * panjang * lebar * tinggi;
      } else {
        _volume = 0.0;
      }
    } else {
      _volume = 0.0;
    }
  }

  void _hitungKeliling() {
    if (_panjangController.text.isNotEmpty &&
        _lebarController.text.isNotEmpty) {
      double panjang = double.tryParse(_panjangController.text) ?? 0;
      double lebar = double.tryParse(_lebarController.text) ?? 0;

      if (panjang > 0 && lebar > 0) {
        _keliling = 2 * (panjang + lebar);
      } else {
        _keliling = 0.0;
      }
    } else {
      _keliling = 0.0;
    }
  }

  void _hitungSemua() {
    print('Tombol hitung ditekan!');
    print('Panjang: ${_panjangController.text}');
    print('Lebar: ${_lebarController.text}');
    print('Tinggi: ${_tinggiController.text}');

    _hitungVolume();
    _hitungKeliling();

    setState(() {
      _hasCalculated = true; // Set flag bahwa sudah melakukan perhitungan
    });

    print('Volume hasil: $_volume');
    print('Keliling hasil: $_keliling');
    print('Has calculated: $_hasCalculated');
  }

  void _reset() {
    setState(() {
      _panjangController.clear();
      _lebarController.clear();
      _tinggiController.clear();
      _volume = 0.0;
      _keliling = 0.0;
      _hasCalculated = false; // Reset flag
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kalkulator Piramida',
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
                        Icons.change_history,
                        size: 50,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Kalkulator Piramida',
                        style: GoogleFonts.sora(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'Hitung Volume & Keliling Alas',
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
                            'Masukkan Ukuran Piramida',
                            style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Input Panjang
                          _buildInputField(
                            controller: _panjangController,
                            label: 'Panjang Alas',
                            icon: Icons.straighten,
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 15),

                          // Input Lebar
                          _buildInputField(
                            controller: _lebarController,
                            label: 'Lebar Alas',
                            icon: Icons.width_wide,
                            color: Colors.green,
                          ),
                          const SizedBox(height: 15),

                          // Input Tinggi
                          _buildInputField(
                            controller: _tinggiController,
                            label: 'Tinggi Piramida',
                            icon: Icons.height,
                            color: Colors.blue,
                          ),
                          const SizedBox(height: 25),

                          // Buttons
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _hitungSemua,
                                  icon: const Icon(
                                    Icons.calculate,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Hitung',
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

                          // Results - Ubah kondisi di sini
                          if (_hasCalculated) ...[
                            Text(
                              'Hasil Perhitungan',
                              style: GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple,
                              ),
                            ),
                            const SizedBox(height: 15),

                            // Volume Result
                            _buildResultCard(
                              title: 'Volume Piramida',
                              value: _volume.toStringAsFixed(2),
                              unit: 'satuan³',
                              icon: Icons.inventory,
                              color: Colors.orange,
                            ),
                            const SizedBox(height: 15),

                            // Keliling Result
                            _buildResultCard(
                              title: 'Keliling Alas',
                              value: _keliling.toStringAsFixed(2),
                              unit: 'satuan',
                              icon: Icons.crop_square,
                              color: Colors.green,
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
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
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

  Widget _buildResultCard({
    required String title,
    required String value,
    required String unit,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.sora(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  '$value $unit',
                  style: GoogleFonts.sora(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
