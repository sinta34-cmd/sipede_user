import 'package:flutter/material.dart';

class DetailDokumen extends StatefulWidget {
  const DetailDokumen({super.key});

  @override
  State<DetailDokumen> createState() => _DetailDokumenState();
}

class _DetailDokumenState extends State<DetailDokumen> {
  List<String> dusun = [
    "Dusun EMEL REJO",
    "Dusun JUNLE REJO",
    "Dusun MIDLINEHARHO"
  ];
  List<List<String>> detailDusun = [
    ["RT 1", "RT 2", "RT 3"],
    ["RT 1", "RT 2"],
    ["RT 1", "RT 2", "RT 3", "RT 4"]
  ];
  List<bool> isExpanded = [false, false, false];

  // Fungsi untuk mengedit nama dusun
  void _editDusun(int index) {
    TextEditingController controller =
        TextEditingController(text: dusun[index]);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit Dusun"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Nama Dusun'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  dusun[index] = controller.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Batal"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menghapus dusun
  void _deleteDusun(int index) {
    setState(() {
      dusun.removeAt(index);
      detailDusun.removeAt(index);
      isExpanded.removeAt(index);
    });
  }

  // Fungsi untuk mengedit nama RT/RW
  void _editRT(int dusunIndex, int rtIndex) {
    TextEditingController controller =
        TextEditingController(text: detailDusun[dusunIndex][rtIndex]);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Edit RT/RW"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(labelText: 'Nama RT/RW'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  detailDusun[dusunIndex][rtIndex] = controller.text;
                });
                Navigator.pop(context);
              },
              child: const Text("Simpan"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Batal"),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menghapus RT/RW
  void _deleteRT(int dusunIndex, int rtIndex) {
    setState(() {
      detailDusun[dusunIndex].removeAt(rtIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dokumentasi"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Dusun',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: dusun.length,
              itemBuilder: (context, index) {
                return ExpansionPanelList(
                  expansionCallback: (int item, bool status) {
                    setState(() {
                      isExpanded[index] = !isExpanded[index];
                    });
                  },
                  children: [
                    ExpansionPanel(
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(
                          title: Text(dusun[index]),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon:
                                    const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () => _editDusun(index),
                              ),
                              IconButton(
                                icon:
                                    const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => _deleteDusun(index),
                              ),
                            ],
                          ),
                        );
                      },
                      body: Column(
                        children:
                            detailDusun[index].asMap().entries.map((entry) {
                          int rtIndex = entry.key;
                          String rt = entry.value;
                          return ListTile(
                            title: Text(rt),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit,
                                      color: Colors.blue),
                                  onPressed: () => _editRT(index, rtIndex),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete,
                                      color: Colors.red),
                                  onPressed: () => _deleteRT(index, rtIndex),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      isExpanded: isExpanded[index],
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
