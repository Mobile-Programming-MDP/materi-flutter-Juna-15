import 'package:flutter/material.dart';
import '../services/narapidana_services.dart';

class TambahScreen extends StatefulWidget {
  const TambahScreen({super.key});

  @override
  State<TambahScreen> createState() => _TambahScreenState();
}

class _TambahScreenState extends State<TambahScreen> {
  final _namaController = TextEditingController();
  final _umurController = TextEditingController();
  final _kasusController = TextEditingController();
  String _jenisKelamin = 'Laki-laki';

  void _submit() async {
    if (_namaController.text.isEmpty || _umurController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Mohon isi semua field wajib!")),
      );
      return;
    }

    await NarapidanaService().tambahNarapidana(
      _namaController.text,
      _jenisKelamin,
      _umurController.text,
      _kasusController.text,
    );

    if (mounted) Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Input Narapidana")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _inputField(_namaController, "Nama Lengkap", Icons.person),
            const SizedBox(height: 15),
            DropdownButtonFormField<String>(
              value: _jenisKelamin,
              decoration: InputDecoration(
                labelText: "Jenis Kelamin",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefixIcon: const Icon(Icons.wc),
              ),
              items: ['Laki-laki', 'Perempuan']
                  .map((val) => DropdownMenuItem(value: val, child: Text(val)))
                  .toList(),
              onChanged: (val) => setState(() => _jenisKelamin = val!),
            ),
            const SizedBox(height: 15),
            _inputField(
              _umurController,
              "Umur",
              Icons.calendar_today,
              isNumber: true,
            ),
            const SizedBox(height: 15),
            _inputField(_kasusController, "Kasus", Icons.gavel, lines: 3),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _submit,
                child: const Text(
                  "SIMPAN DATA",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool isNumber = false,
    int lines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: lines,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
