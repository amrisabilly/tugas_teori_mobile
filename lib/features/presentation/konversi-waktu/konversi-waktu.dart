import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KonversiWaktu extends StatefulWidget {
  const KonversiWaktu({super.key});

  @override
  State<KonversiWaktu> createState() => _KonversiWaktuState();
}

class _KonversiWaktuState extends State<KonversiWaktu> {
  final _inputController = TextEditingController();
  String _fromUnit = 'WIB';
  String _toUnit = 'WIT';
  String _result = '';
  bool _hasConverted = false;

  final Map<String, int> _timeZones = {
    'WIB': 7,  // GMT+7
    'WIT': 9,  // GMT+9
    'WITA': 8, // GMT+8
  };

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _convertTime() {
    if (_inputController.text.isEmpty) {
      setState(() {
        _result = 'Masukkan waktu terlebih dahulu!';
        _hasConverted = true;
      });
      return;
    }

    try {
      // Parse input time (format: HH:mm)
      List<String> timeParts = _inputController.text.split(':');
      if (timeParts.length != 2) {
        throw FormatException('Format waktu tidak valid');
      }

      int hours = int.parse(timeParts[0]);
      int minutes = int.parse(timeParts[1]);

      if (hours < 0 || hours > 23 || minutes < 0 || minutes > 59) {
        throw FormatException('Waktu tidak valid');
      }

      // Convert time based on timezone difference
      int fromGMTOffset = _timeZones[_fromUnit]!;
      int toGMTOffset = _timeZones[_toUnit]!;
      int timeDifference = toGMTOffset - fromGMTOffset;

      int newHours = hours + timeDifference;
      int newMinutes = minutes;

      // Handle day overflow/underflow
      String dayInfo = '';
      if (newHours >= 24) {
        newHours -= 24;
        dayInfo = ' (+1 hari)';
      } else if (newHours < 0) {
        newHours += 24;
        dayInfo = ' (-1 hari)';
      }

      setState(() {
        _result = '${newHours.toString().padLeft(2, '0')}:${newMinutes.toString().padLeft(2, '0')} $_toUnit$dayInfo';
        _hasConverted = true;
      });
    } catch (e) {
      setState(() {
        _result = 'Format waktu tidak valid! Gunakan format HH:MM (contoh: 14:30)';
        _hasConverted = true;
      });
    }
  }

  void _reset() {
    setState(() {
      _inputController.clear();
      _fromUnit = 'WIB';
      _toUnit = 'WIT';
      _result = '';
      _hasConverted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Konversi Waktu',
          style: GoogleFonts.sora(fontSize: 22),
        ),
        backgroundColor: Colors.teal[500],
        foregroundColor: Colors.white,
        elevation: 4,
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.teal[300],
        ),
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
                        Icons.access_time,
                        size: 50,
                        color: Colors.teal,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Konversi Waktu Indonesia',
                        style: GoogleFonts.sora(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'WIB, WITA, WIT',
                        style: GoogleFonts.sora(fontSize: 14, color: Colors.grey),
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
                            'Konversi Zona Waktu',
                            style: GoogleFonts.sora(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Input Waktu
                          _buildInputField(
                            controller: _inputController,
                            label: 'Masukkan Waktu (HH:MM)',
                            icon: Icons.schedule,
                            color: Colors.blue,
                            hintText: 'Contoh: 14:30',
                          ),
                          const SizedBox(height: 15),

                          // From Zone
                          Text(
                            'Dari Zona Waktu:',
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildDropdown(
                            value: _fromUnit,
                            onChanged: (value) {
                              setState(() {
                                _fromUnit = value!;
                              });
                            },
                            color: Colors.orange,
                          ),
                          const SizedBox(height: 15),

                          // To Zone
                          Text(
                            'Ke Zona Waktu:',
                            style: GoogleFonts.sora(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildDropdown(
                            value: _toUnit,
                            onChanged: (value) {
                              setState(() {
                                _toUnit = value!;
                              });
                            },
                            color: Colors.green,
                          ),
                          const SizedBox(height: 25),

                          // Buttons
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: _convertTime,
                                  icon: const Icon(
                                    Icons.swap_horiz,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Konversi',
                                    style: GoogleFonts.sora(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.teal,
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
                          if (_hasConverted) ...[
                            Text(
                              'Hasil Konversi',
                              style: GoogleFonts.sora(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                              ),
                            ),
                            const SizedBox(height: 15),

                            // Result Display
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.teal.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.teal.withOpacity(0.3)),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: const Icon(
                                      Icons.access_time_filled,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Waktu Hasil',
                                          style: GoogleFonts.sora(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                          _result,
                                          style: GoogleFonts.sora(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          const SizedBox(height: 20),

                          // Info Card
                          Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blue.withOpacity(0.3)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.info_outline, color: Colors.blue, size: 20),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Informasi Zona Waktu:',
                                      style: GoogleFonts.sora(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '• WIB (Waktu Indonesia Barat): GMT+7\n• WITA (Waktu Indonesia Tengah): GMT+8\n• WIT (Waktu Indonesia Timur): GMT+9',
                                  style: GoogleFonts.sora(
                                    fontSize: 12,
                                    color: Colors.blue[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
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
    String? hintText,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
        color: color.withOpacity(0.05),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hintText,
          prefixIcon: Icon(icon, color: color),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
          labelStyle: GoogleFonts.sora(color: color),
          hintStyle: GoogleFonts.sora(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String value,
    required Function(String?) onChanged,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3)),
        color: color.withOpacity(0.05),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
          prefixIcon: Icon(Icons.location_on, color: color),
        ),
        items: _timeZones.keys.map((String zone) {
          return DropdownMenuItem<String>(
            value: zone,
            child: Text(
              '$zone (GMT+${_timeZones[zone]})',
              style: GoogleFonts.sora(),
            ),
          );
        }).toList(),
        onChanged: onChanged,
        style: GoogleFonts.sora(color: color),
      ),
    );
  }
}