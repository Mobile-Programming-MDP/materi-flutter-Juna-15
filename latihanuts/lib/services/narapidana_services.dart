import 'package:firebase_database/firebase_database.dart';

class NarapidanaService {
  // Referensi ke node 'narapidana' di Firebase Realtime Database
  final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child(
    'narapidana',
  );

  // Mengambil aliran data secara real-time
  Stream<DatabaseEvent> getNarapidanaStream() {
    return _dbRef.onValue;
  }

  // Fungsi menambah data narapidana baru
  Future<void> tambahNarapidana(
    String nama,
    String gender,
    String umur,
    String kasus,
  ) async {
    await _dbRef.push().set({
      'nama': nama,
      'jenis_kelamin': gender,
      'umur': umur,
      'kasus': kasus,
    });
  }

  // Fungsi menghapus data berdasarkan key unik dari Firebase
  Future<void> hapusNarapidana(String id) async {
    await _dbRef.child(id).remove();
  }
}
