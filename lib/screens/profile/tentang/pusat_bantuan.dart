import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:flutter/material.dart';

class PusatBantuan extends StatefulWidget {
  PusatBantuan({Key? key}) : super(key: key);

  @override
  State<PusatBantuan> createState() => _PusatBantuanState();
}

class _PusatBantuanState extends State<PusatBantuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Pusat Bantuan"),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: Image(
                width: MediaQuery.of(context).size.width * 0.6,
                image: const AssetImage('assets/images/logo_nama.png'),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Anda dapat kontak Customer Service kami di "),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  const Text("Nomor: -"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  const Text("Email: - "),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  const Text("Media Sosial: @bumi.baik"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
