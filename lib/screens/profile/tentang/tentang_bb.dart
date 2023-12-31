import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:flutter/material.dart';

class TentangBb extends StatefulWidget {
  TentangBb({Key? key}) : super(key: key);

  @override
  State<TentangBb> createState() => _TentangBbState();
}

class _TentangBbState extends State<TentangBb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Tentang Bumi Baik"),
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
              child: Text(
                "BumiBaik ( PT. BUMI SEMAKIN BAIK ) adalah platform digital membantu setiap orang menghitung emisi karbon dan menanam/adopsi pohon secara sukarela untuk menyerap emisi karbon yang dihasilkan. Sehingga setiap orang akan mencapai keseimbangan antara karbon yang dihasilan dan karbon yang diserap oleh pohon (Carbon Neutral)",
                softWrap: true,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      letterSpacing: 0.5,
                      wordSpacing: 0.5,
                      height: 1.5,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Text(
                "BumiBaik memberikan informasi dan Edukasi dampak emisi karbon terhadap lingkungan dalam issue perubahan iklim. Edukasi dimulai dari menghitung emisi karbon setiap orang, dengan ini akan menyadarkan tanggung jawab untuk mengurangi atau menghilangkan emisi karbon yang dihasilkan. Setelah mengetahui dan menyadari emisi karbon yang dihasilkan, setiap orang akan difasilitasi BumiBaik untuk melakukan aksi dalam mengurangi emisi karbon melalui penanaman pohon atau mempertahankan pohon sebagai penyerap emisi karbon.",
                softWrap: true,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      letterSpacing: 0.5,
                      wordSpacing: 0.5,
                      height: 1.5,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
