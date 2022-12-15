import 'package:bumibaik_app/resources/color_manager.dart';
import 'package:bumibaik_app/screens/scan_page.dart';
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

  void showPopupDialog(BuildContext context, Barcode? result) {
    showGeneralDialog(
      barrierLabel: "Barrier",
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 100),
      context: context,
      pageBuilder: (_, __, ___) {
        return Align(
          alignment: Alignment.center,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(top: 150, left: 32, right: 32),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox.expand(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: ColorManager.primary,
                              shape: BoxShape.circle,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          "Pohon Terdeteksi",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          result!.code.toString(),
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    fontWeight: FontWeight.normal,
                                    color: ColorManager.primary,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: 213,
                      height: 55,
                      child: OutlinedButton(
                        child: const Text('Lihat Detail'),
                        style: OutlinedButton.styleFrom(
                            backgroundColor: ColorManager.primary),
                        onPressed: () {
                          // controller?.resumeCamera();

                          Navigator.of(context, rootNavigator: true).pop();
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         const OpenDoorConfirmation(),
                          //   ),
                          // );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
