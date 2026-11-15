import 'package:flutter/material.dart';

void main() {
  runApp(const TabungKuApp());
}

// Widget utama aplikasi TabungKu.
class TabungKuApp extends StatelessWidget {
  const TabungKuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TabungKu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF176B87),
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF5F8FA),
      ),
      home: const RingkasanPage(),
    );
  }
}

// Halaman ringkasan tabungan sesuai instruksi tugas.
class RingkasanPage extends StatelessWidget {
  const RingkasanPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data transaksi statis tanpa database atau package tambahan.
    const transaksi = [
      {
        'judul': 'Setoran Mingguan',
        'tanggal': '12 November 2026',
        'nominal': '+ Rp 150.000',
        'masuk': true,
      },
      {
        'judul': 'Beli Perlengkapan',
        'tanggal': '10 November 2026',
        'nominal': '- Rp 75.000',
        'masuk': false,
      },
      {
        'judul': 'Tabungan Bulanan',
        'tanggal': '5 November 2026',
        'nominal': '+ Rp 300.000',
        'masuk': true,
      },
    ];

    return Scaffold(
      // AppBar menampilkan judul halaman.
      appBar: AppBar(
        title: const Text(
          'Ringkasan Tabungan',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF176B87),
        foregroundColor: Colors.white,
      ),

      // SafeArea melindungi konten dari area sistem perangkat.
      body: SafeArea(
        // ScrollView mencegah overflow vertikal pada layar kecil.
        child: SingleChildScrollView(
          child: Center(
            // Batasi lebar konten agar tetap rapi pada tablet.
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 650),
              child: Padding(
                padding: const EdgeInsets.all(16),

                // Column menyusun semua bagian secara vertikal.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bagian 1: kartu informasi tabungan.
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF176B87),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nama tabungan.
                          Text(
                            'Tabungan Pendidikan',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 15,
                            ),
                          ),

                          SizedBox(height: 12),

                          // Informasi saldo utama.
                          Text(
                            'Rp 2.750.000',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 18),

                          // Row membagi informasi saldo dan target.
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Saldo Terkumpul',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  'Target Rp 5.000.000',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Bagian 2: judul kategori.
                    const Text(
                      'Kategori Transaksi',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Row menampilkan tiga kategori secara horizontal.
                    const Row(
                      children: [
                        Expanded(
                          child: KategoriWidget(
                            icon: Icons.savings_outlined,
                            label: 'Menabung',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: KategoriWidget(
                            icon: Icons.account_balance_wallet_outlined,
                            label: 'Tarik',
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: KategoriWidget(
                            icon: Icons.history,
                            label: 'Riwayat',
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Bagian 3: judul daftar transaksi.
                    const Text(
                      'Riwayat Transaksi',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Column membangun daftar dari data statis.
                    Column(
                      children: transaksi.map((item) {
                        final bool masuk = item['masuk'] == true;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10),

                          // Container membentuk kartu transaksi.
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: const Color(0xFFE1E7EB),
                              ),
                            ),

                            // Row membagi ikon, detail, dan nominal.
                            child: Row(
                              children: [
                                Container(
                                  width: 42,
                                  height: 42,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: masuk
                                        ? const Color(0xFFE5F5ED)
                                        : const Color(0xFFFFF0EA),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Icon(
                                    masuk
                                        ? Icons.arrow_downward
                                        : Icons.arrow_upward,
                                    color: masuk
                                        ? const Color(0xFF16804A)
                                        : const Color(0xFFD36A32),
                                  ),
                                ),

                                const SizedBox(width: 12),

                                // Expanded memberi ruang fleksibel untuk teks.
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item['judul'] as String,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        item['tanggal'] as String,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                const SizedBox(width: 8),

                                // Flexible mencegah nominal melewati layar.
                                Flexible(
                                  child: Text(
                                    item['nominal'] as String,
                                    textAlign: TextAlign.end,
                                    style: TextStyle(
                                      color: masuk
                                          ? const Color(0xFF16804A)
                                          : const Color(0xFFD36A32),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 16),

                    // Catatan sederhana di bagian bawah halaman.
                    const Center(
                      child: Text(
                        'TabungKu • Kelola tabungan dengan lebih teratur',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Widget kategori menggunakan Container, Column, dan SizedBox.
class KategoriWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const KategoriWidget({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 4,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F4F8),
        borderRadius: BorderRadius.circular(12),
      ),

      // Susunan ikon dan label kategori.
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 27,
            color: const Color(0xFF176B87),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
