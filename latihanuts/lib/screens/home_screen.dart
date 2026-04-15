import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import '../services/narapidana_services.dart';
import 'tambah_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("E-Lapas: Data Narapidana"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: StreamBuilder(
        stream: NarapidanaService().getNarapidanaStream(),
        builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
          if (snapshot.hasData && snapshot.data!.snapshot.value != null) {
            Map<dynamic, dynamic> data =
                snapshot.data!.snapshot.value as Map<dynamic, dynamic>;

            // Ambil ID (keys) dan datanya
            List<String> keys = data.keys.cast<String>().toList();
            List<dynamic> items = data.values.toList();

            return ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 2,
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo[50],
                      child: Text(
                        items[index]['nama'][0].toUpperCase(),
                        style: const TextStyle(color: Colors.indigo),
                      ),
                    ),
                    title: Text(
                      items[index]['nama'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${items[index]['jenis_kelamin']} • ${items[index]['umur']} Tahun",
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Kasus: ${items[index]['kasus']}",
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.redAccent,
                      ),
                      onPressed: () {
                        NarapidanaService().hapusNarapidana(keys[index]);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Data telah dihapus")),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.person_off, size: 80, color: Colors.grey[400]),
                  const Text("Belum ada data narapidana"),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const TambahScreen()),
        ),
        label: const Text("Data Baru"),
        icon: const Icon(Icons.add),
        backgroundColor: Colors.indigo,
      ),
    );
  }
}
