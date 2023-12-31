import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:flutter/material.dart';

class Panduan extends StatefulWidget {
  Panduan({Key? key}) : super(key: key);

  @override
  State<Panduan> createState() => _PanduanState();
}

class _PanduanState extends State<Panduan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Panduan"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Image(
                width: MediaQuery.of(context).size.width * 0.6,
                image: const AssetImage('assets/images/logo_nama.png'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Column(
                children: [
                  Text("Panduan Menggunakan Aplikasi",
                      softWrap: true,
                      style: Theme.of(context).textTheme.headline6),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  buildPanduanItem("1",
                      "Unduh aplikasi BumiBaik di Playstore atau Appstore"),
                  buildPanduanItem("2", "Buka Aplikasi Bumibaik"),
                  buildPanduanItem("3",
                      "Klik / Tap Daftar [ backlink ] atau jika sudah memiliki akun isi email dan password"),
                  buildPanduanItem("4",
                      "Isi data diri seperti nomor ponsel, email, dan password"),
                  buildPanduanItem("5",
                      "Isi kalkulator karbon untuk menghitung ekstimasi karbon anda"),
                  buildPanduanItem("6",
                      "Setelah mengetahui data karbon, anda akan diberi opsi untuk menyeimbangkan antara karbon yang dihasilan dan karbon yang diserap oleh pohon (Carbon Neutral) dengan adopsi pohon atau tanam bibit pohon"),
                  buildPanduanItem(
                      "7", "Pilih produk dan isi nominal yang anda inginkan"),
                  buildPanduanItem("8", "Pilih metode pembayaran anda"),
                  buildPanduanItem("9",
                      "Setelah proses pembayaran selesai anda mendapatkan bukti transaksi"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildPanduanItem(String nomor, String desc) {
    return ListTile(
      onTap: null,
      leading: Text(
        nomor,
        style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: ColorManager.primary,
            ),
      ),
      title: Text(
        desc,
        style: Theme.of(context).textTheme.bodyText2?.copyWith(
              letterSpacing: 0.5,
              wordSpacing: 0.5,
              height: 1.5,
            ),
      ),
    );
  }
}
