import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final bool _showTabs = true;
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 55, 129, 189),
          bottom: _showTabs
              ? const TabBar(
                  tabs: [
                    Tab(text: "Pendapatan"),
                    Tab(text: "Pengeluaran"),
                  ],
                  labelStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : null,
          title: const Text('Halaman Kedua'),
        ),
        body: _showTabs
            ? TabBarView(
                children: [
                  _buildTabContent(),
                  _buildTabContent(),
                ],
              )
            : const Center(
                child: Text("Tekan tombol di bawah untuk memulai"),
              ),
      ),
    );
  }

  Widget _buildTabContent() {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Column(
        children: [
          const Row(
            children: [
              Icon(Icons.settings),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Rp',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 26),
          const Row(
            children: [
              Icon(Icons.settings),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Pilih Kategori',
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                    ),
                    hintText: 'Masukkan nama lengkap di sini',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.settings),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(
                    labelText: 'Pilih Opsi',
                    border: OutlineInputBorder(),
                  ),
                  items:
                      ['Option 1', 'Option 2', 'Option 3'].map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Logika perubahan nilai dropdown
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => _selectDate(context),
                  child: AbsorbPointer(
                    child: TextField(
                      controller: TextEditingController(
                        text: _selectedDate != null
                            ? "${_selectedDate!.toLocal()}".split(' ')[0]
                            : 'Pilih Tanggal',
                      ),
                      decoration: const InputDecoration(
                        labelText: 'Tanggal',
                        hintText: 'Pilih Tanggal',
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B39EF),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'SIMPAN',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
