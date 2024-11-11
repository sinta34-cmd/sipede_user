import 'package:flutter/material.dart';

class DetailDanaDesa2 extends StatefulWidget {
  const DetailDanaDesa2({super.key});

  @override
  State<DetailDanaDesa2> createState() => _DetailDanaDesa2State();
}

class _DetailDanaDesa2State extends State<DetailDanaDesa2> {
  String? selectedBulan;
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
        title: const Text('Realisasi APBN 2024'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Month Selection
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pilih Bulan'),
                IconButton(
                  icon: const Icon(Icons.arrow_drop_down),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Pilih Bulan'),
                          content: SizedBox(
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: bulanList.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(bulanList[index]),
                                  onTap: () {
                                    setState(() {
                                      selectedBulan = bulanList[index];
                                    });
                                    Navigator.pop(context);
                                  },
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Display selected month
            if (selectedBulan != null)
              Text(
                'Bulan Terpilih: $selectedBulan',
                style: const TextStyle(fontSize: 16),
              ),
            const SizedBox(height: 20),

            // Display an image if it exists
            Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(child: Text('Tidak ada gambar tersedia')),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
