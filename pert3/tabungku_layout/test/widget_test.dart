import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tabungku_layout/main.dart';

void main() {
  testWidgets('Halaman Ringkasan Tabungan tampil dengan benar',
      (WidgetTester tester) async {
    // Menjalankan aplikasi TabungKu.
    await tester.pumpWidget(const TabungKuApp());

    // Memastikan AppBar dan kartu ringkasan tampil.
    expect(find.text('Ringkasan Tabungan'), findsOneWidget);
    expect(find.text('Tabungan Pendidikan'), findsOneWidget);
    expect(find.text('Rp 2.750.000'), findsOneWidget);
    expect(find.text('Target Rp 5.000.000'), findsOneWidget);

    // Memastikan tiga kategori transaksi tersedia.
    expect(find.text('Menabung'), findsOneWidget);
    expect(find.text('Tarik'), findsOneWidget);
    expect(find.text('Riwayat'), findsOneWidget);

    // Memastikan bagian riwayat transaksi tersedia.
    expect(find.text('Riwayat Transaksi'), findsOneWidget);

    // Memastikan ketiga transaksi ditampilkan.
    expect(find.text('Setoran Mingguan'), findsOneWidget);
    expect(find.text('Beli Perlengkapan'), findsOneWidget);
    expect(find.text('Tabungan Bulanan'), findsOneWidget);

    // Memastikan ikon transaksi sesuai jenisnya.
    expect(find.byIcon(Icons.arrow_downward), findsNWidgets(2));
    expect(find.byIcon(Icons.arrow_upward), findsOneWidget);
  });
}
