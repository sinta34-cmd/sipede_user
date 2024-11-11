import 'package:flutter/material.dart';

class DetailDanaDesa3 extends StatefulWidget {
  const DetailDanaDesa3({super.key});

  @override
  State<DetailDanaDesa3> createState() => _DetailDanaDesa3State();
}

class _DetailDanaDesa3State extends State<DetailDanaDesa3> {
  String? selectedDusun;
  String? selectedBulan;

  bool isEditing = false; // Flag untuk menentukan apakah dalam mode edit

  final List<String> dusunList = ['Dusun Midline', 'Dusun EXP', 'Dusun Roam'];
  final List<String> bulanList = [
    'Januari',
    'Februari',
    'Maret',
    'April',
    'Mei',
    'Juni',
    'Juli',
    'Agustus',
    'September',
    'Oktober',
    'November',
    'Desember'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Iuran desa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown untuk memilih Dusun
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Pilih Dusun'),
              value: selectedDusun,
              items: dusunList.map((dusun) {
                return DropdownMenuItem(
                  value: dusun,
                  child: Text(dusun),
                );
              }).toList(),
              onChanged: isEditing
                  ? (value) {
                      setState(() {
                        selectedDusun = value;
                      });
                    }
                  : null, // Disable perubahan jika tidak dalam mode edit
            ),
            const SizedBox(height: 20),

            // Dropdown untuk memilih Bulan
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Pilih Bulan'),
              value: selectedBulan,
              items: bulanList.map((bulan) {
                return DropdownMenuItem(
                  value: bulan,
                  child: Text(bulan),
                );
              }).toList(),
              onChanged: isEditing
                  ? (value) {
                      setState(() {
                        selectedBulan = value;
                      });
                    }
                  : null, // Disable perubahan jika tidak dalam mode edit
            ),
            const SizedBox(height: 20),

            // Tampilkan data realisasi APBN berdasarkan pilihan dusun dan bulan
            if (selectedDusun != null && selectedBulan != null)
              Text(
                'Realisasi APBN 2024 untuk $selectedDusun pada bulan $selectedBulan:',
              ),

            const Spacer(),

            // Tombol Edit dan Simpan
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (isEditing) {
                        // Jika dalam mode edit, klik "Edit" beralih ke mode "Simpan"
                        // Menyimpan perubahan
                        isEditing = false;
                      } else {
                        // Jika tidak dalam mode edit, beralih ke mode edit
                        isEditing = true;
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isEditing ? Colors.green : Colors.blue,
                  ),
                  child: Text(isEditing ? 'Simpan' : 'Edit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
