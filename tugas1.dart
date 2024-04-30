import 'dart:convert';

void main() {
  // Data transkrip mahasiswa dalam bentuk string JSON
  String transkripJson = '''
  {
    "nama": "John Doe",
    "NIM": "123456789",
    "program_studi": "Teknik Informatika",
    "mata_kuliah": [
      {
        "kode": "TI101",
        "nama": "Pemrograman Dasar",
        "sks": 3,
        "nilai": "A"
      },
      {
        "kode": "TI102",
        "nama": "Matematika Dasar",
        "sks": 4,
        "nilai": "B+"
      },
      {
        "kode": "TI103",
        "nama": "Algoritma dan Struktur Data",
        "sks": 3,
        "nilai": "A-"
      },
      {
        "kode": "TI104",
        "nama": "Pemrograman Web",
        "sks": 3,
        "nilai": "B"
      },
      {
        "kode": "TI105",
        "nama": "Sistem Operasi",
        "sks": 3,
        "nilai": "A"
      }
    ]
  }
  ''';

  // Parsing string JSON menjadi objek Map
  Map<String, dynamic> transkrip = jsonDecode(transkripJson);

  // Cetak transkrip mahasiswa
  print("Transkrip Mahasiswa:");
  print("Nama: ${transkrip["nama"]}");
  print("NIM: ${transkrip["NIM"]}");
  print("Program Studi: ${transkrip["program_studi"]}");
  print("Mata Kuliah:");
  for (var matkul in transkrip["mata_kuliah"]) {
    print("- Kode: ${matkul["kode"]}");
    print("  Nama: ${matkul["nama"]}");
    print("  SKS: ${matkul["sks"]}");
    print("  Nilai: ${matkul["nilai"]}");
  }

  // Hitung IPK
  double ipk = hitungIPK(transkrip["mata_kuliah"]);
  print("\nIPK: $ipk");
}

// Fungsi untuk menghitung IPK
double hitungIPK(List<Map<String, dynamic>> mataKuliah) {
  double totalSKS = 0;
  double totalBobot = 0;

  for (var matkul in mataKuliah) {
    double sks = matkul["sks"];
    totalSKS += sks;
    String nilai = matkul["nilai"];
    double bobot = 0; // Inisialisasi variabel bobot di awal
    if (nilai == "A") {
      bobot = 4.0;
    } else if (nilai == "A-") {
      bobot = 3.7;
    } else if (nilai == "B+") {
      bobot = 3.3;
    } else if (nilai == "B") {
      bobot = 3.0;
    }
    // Tambahkan kondisi untuk nilai lainnya sesuai kebutuhan

    totalBobot += bobot * sks;
  }

  double ipk = totalBobot / totalSKS;
  return ipk;
}
