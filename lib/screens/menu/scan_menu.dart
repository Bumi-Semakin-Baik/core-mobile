import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:new_bumi_baik/screens/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanMenu extends StatefulWidget {
  ScanMenu({Key? key}) : super(key: key);

  @override
  State<ScanMenu> createState() => _ScanMenuState();
}

class _ScanMenuState extends State<ScanMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Column(
            //   children: <Widget>[
            //     SizedBox(
            //       height: MediaQuery.of(context).size.height * 0.15,
            //     ),
            //     Expanded(flex: 3, child: _buildQrView(context)),
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    width: MediaQuery.of(context).size.width * 0.4,
                    image: const AssetImage('assets/images/logo_nama.png'),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  const Text(
                    'Scan QR Code',
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                  const Text(
                    "Arahkan kamera ke kode QR yang terletak pada pohon.",
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                  Container(
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorManager.primary, // background
                        foregroundColor: Colors.white, // foreground
                      ),
                      child: const Text('SCAN'),
                      onPressed: () async {
                        PersistentNavBarNavigator.pushNewScreen(
                          context,
                          screen: ScanPage(),
                          withNavBar: false,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
