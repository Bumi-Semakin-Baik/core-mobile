// import 'dart:developer';
// import 'dart:io';

// import 'package:new_bumi_baik/common/common_widget.dart';
// import 'package:new_bumi_baik/resources/color_manager.dart';
// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// //import 'package:qr_code_scanner/qr_code_scanner.dart';

// class ScanPage extends StatefulWidget {
//   ScanPage({Key? key}) : super(key: key);

//   @override
//   State<ScanPage> createState() => _ScanPageState();
// }

// class _ScanPageState extends State<ScanPage> {
//   Barcode? result;
//   QRViewController? controller;
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

//   // In order to get hot reload to work we need to pause the camera if the platform
//   // is android, or resume the camera if the platform is iOS.
//   @override
//   void reassemble() {
//     super.reassemble();

//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     } else if (Platform.isIOS) {
//       controller!.resumeCamera();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 250.0
//         : 400.0;

//     return Scaffold(
//       appBar: CommonWidget.buildCommonAppbar(context, "Scan Kode QR"),
//       // body: Column(
//       //   children: [
//       //     Expanded(
//       //       flex: 5,
//       //       child: QRView(
//       //         key: qrKey,
//       //         onQRViewCreated: _onQRViewCreated,
//       //         overlay: QrScannerOverlayShape(
//       //             borderColor: ColorManager.primary,
//       //             borderRadius: 10,
//       //             borderLength: 30,
//       //             borderWidth: 10,
//       //             cutOutSize: scanArea),
//       //         onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//       //       ),
//       //     ),
//       //   ],
//       // ),
//       body: MobileScanner(
//           allowDuplicates: false,
//           onDetect: (barcode, args) {
//             if (barcode.rawValue == null) {
//               debugPrint('Failed to scan Barcode');
//             } else {
//               final String code = barcode.rawValue!;
//               debugPrint('Barcode found! $code');
//             }
//           }),
//     );
//   }

//   void showPopupDialog(BuildContext context, Barcode? result) {
//     showGeneralDialog(
//       barrierLabel: "Barrier",
//       barrierDismissible: false,
//       barrierColor: Colors.black.withOpacity(0.5),
//       transitionDuration: const Duration(milliseconds: 100),
//       context: context,
//       pageBuilder: (_, __, ___) {
//         return Align(
//           alignment: Alignment.center,
//           child: Container(
//             height: MediaQuery.of(context).size.height * 0.4,
//             padding: const EdgeInsets.all(20),
//             margin: const EdgeInsets.only(top: 150, left: 32, right: 32),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: SizedBox.expand(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 10),
//                   Padding(
//                     padding: const EdgeInsets.all(10),
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).pop();
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               color: ColorManager.primary,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Icon(
//                                 Icons.check,
//                                 color: Colors.white,
//                                 size: 30,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         Text(
//                           "Pohon Terdeteksi",
//                           textAlign: TextAlign.center,
//                           style: Theme.of(context)
//                               .textTheme
//                               .headline6
//                               ?.copyWith(fontWeight: FontWeight.normal),
//                         ),
//                         const SizedBox(height: 10),
//                         Text(
//                           result!.code.toString(),
//                           textAlign: TextAlign.center,
//                           style:
//                               Theme.of(context).textTheme.headline6?.copyWith(
//                                     fontWeight: FontWeight.normal,
//                                     color: ColorManager.primary,
//                                     fontStyle: FontStyle.italic,
//                                   ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 30),
//                   Center(
//                     child: SizedBox(
//                       width: 213,
//                       height: 55,
//                       child: OutlinedButton(
//                         style: OutlinedButton.styleFrom(
//                             backgroundColor: ColorManager.primary),
//                         onPressed: () {
//                           // setState(() {
//                           //   controller?.resumeCamera();
//                           // });

//                           Navigator.of(context, rootNavigator: true).pop();

//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) =>
//                           //         const OpenDoorConfirmation(),
//                           //   ),
//                           // );
//                         },
//                         child: const Text('Lihat Detail'),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 15),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildQrView(BuildContext context) {
//     // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 250.0
//         : 400.0;
//     // To ensure the Scanner view is properly sizes after rotation
//     // we need to listen for Flutter SizeChanged notification and update controller
//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//           borderColor: ColorManager.primary,
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;

//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;

//         //controller.pauseCamera();
//       });

//       if (result != null) {
//         showPopupDialog(context, result);
//       }
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('no Permission')),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
// }

import 'package:new_bumi_baik/screens/details/tree_scan_detail.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../common/common_widget.dart';
import '../resources/color_manager.dart';

class ScanPage extends StatefulWidget {
  ScanPage({Key? key}) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(
        context,
        "Scan Kode QR",
      ),
      body: MobileScanner(
          allowDuplicates: false,
          controller: MobileScannerController(
            facing: CameraFacing.back,
            torchEnabled: false,
          ),
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
              showPopupDialog(context, 'Failed to scan Barcode');
            } else {
              final String code = barcode.rawValue!;
              debugPrint('Barcode found! $code');

              showPopupDialog(context, code);
            }
          }),
    );
  }

  void showPopupDialog(BuildContext context, String res) {
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
                          "Kode QR Terdeteksi",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          res,
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
                        style: OutlinedButton.styleFrom(
                            backgroundColor: ColorManager.primary),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();

                          CommonWidget().movePage(
                            context,
                            TreeScanDetail(
                              kode: res,
                            ),
                          );
                        },
                        child: const Text(
                          'Lihat Detail',
                          style: TextStyle(color: Colors.white),
                        ),
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
