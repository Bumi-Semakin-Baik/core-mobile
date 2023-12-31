// ignore_for_file: deprecated_member_use

import 'package:new_bumi_baik/common/common_dialog_widget.dart';
import 'package:new_bumi_baik/common/common_shimmer_widget.dart';
import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/models/transaction_model.dart';
import 'package:new_bumi_baik/services/midtrans_service.dart';
import 'package:new_bumi_baik/services/product_service.dart';
import 'package:new_bumi_baik/services/transaction_service.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:percent_indicator/percent_indicator.dart';
import '../../models/detail_donasi_response_model.dart';
import '../../models/list_donasi_response_model.dart';
import '../../resources/color_manager.dart';
import '../../services/donation_service.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class DonasiDetail extends StatefulWidget {
  ListDonasiResponseModel productDonasiModel;
  DonasiDetail({required this.productDonasiModel, Key? key}) : super(key: key);

  @override
  State<DonasiDetail> createState() => _DonasiDetailState();
}

class _DonasiDetailState extends State<DonasiDetail> {
  ListDonasiResponseModel? newData;

  MidtransSDK? _midtrans;

  bool isLoading = false;
  final String productName = 'Nama Campaign';
  final String judul = 'Detail Donasi';

  @override
  void initState() {
    getData();
    initSDK();

    super.initState();
  }

  void initSDK() async {
    _midtrans = await MidtransSDK.init(
      config: MidtransService().config,
    );
    _midtrans?.setUIKitCustomSetting(
      skipCustomerDetailsPages: true,
    );
    _midtrans!.setTransactionFinishedCallback((result) {
      //print(result.toJson());
    });
  }

  @override
  void dispose() {
    _midtrans?.removeTransactionFinishedCallback();
    super.dispose();
  }

  getData() async {
    newData =
        await DonasiService().getDonasiDetail(widget.productDonasiModel.id!);

    setState(() {});
  }

  int? _selectedIndex;

  final List<String> _options = [
    'Rp.10.000',
    'Rp.10.000',
    'Rp.50.000',
    "Rp.75.000",
    "Rp.100.000",
  ];

  final List<double> optionValue = [
    10000,
    10000,
    50000,
    75000,
    100000,
  ];

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
        labelPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        selected: _selectedIndex == i,
        label: Text(_options[i], style: const TextStyle(color: Colors.white)),
        elevation: 1,
        shadowColor: Colors.teal,
        backgroundColor: Colors.grey,
        selectedColor: ColorManager.primary,
        onSelected: (bool selected) {
          setState(() {
            if (selected) {
              setState(() {
                _selectedIndex = i;
              });
            }
          });
        },
      );

      chips.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: choiceChip,
        ),
      );
    }

    return ListView(
      // This next line does the trick.
      scrollDirection: Axis.horizontal,
      children: chips,
    );
  }

  @override
  Widget build(BuildContext context) {
    String imagePath =
        "https://bumibaik.com/storage/" + widget.productDonasiModel.image!;
    double progress1;
    int Linkid = widget.productDonasiModel.id!;

    //contoh tanggal
    DateTime dueDate1 = widget.productDonasiModel.due_date!;

    // Format Tanggal
    String formattedDate = DateFormat.yMMMMd().format(dueDate1);

    // Pisahkan Tanggal
    List<String> dateParts = formattedDate.split(' ');

    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(
        context,
        judul,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.infinity,
                  child: FancyShimmerImage(
                    boxFit: BoxFit.cover,
                    imageUrl: imagePath,
                    errorWidget: Image.network(
                        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                  ),
                ),
                newData == null
                    ? SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: CommonShimmerWidget()
                              .buildTextDetailShimmer(context),
                        ),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Rp. " +
                                  widget.productDonasiModel.collected!
                                      .toString() +
                                  " /  Rp. " +
                                  widget.productDonasiModel.target!.toString(),
                              textAlign: TextAlign.left,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 20),
                            LinearPercentIndicator(
                              width: 370.0,
                              animation: true,
                              animationDuration: 1000,
                              lineHeight: 20.0,
                              percent: progress1 =
                                  widget.productDonasiModel.progress! / 100,
                              center: Text(widget.productDonasiModel.progress!
                                      .toString() +
                                  " %"),
                              linearStrokeCap: LinearStrokeCap.butt,
                              progressColor: Colors.blue,
                            ),
                            const SizedBox(height: 20),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Detail',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.height *
                                      0.005,
                                  color: ColorManager.blue,
                                ),
                                const SizedBox(height: 25),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Kelompok Tani :  ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      widget.productDonasiModel.nama_ukm!,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Lokasi :  ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      widget.productDonasiModel.nama_lokasi!,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Jenis Pohon :  ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Batas Donasi :  ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      dueDate1.toString(),
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Penanaman :  ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      '-',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mitra Penanaman :  ",
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13),
                                    ),
                                    Text(
                                      widget.productDonasiModel.nama_mitra!,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 35),
                            SizedBox(
                              height: 50,
                              width: 200,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorManager.primary, // background
                                  foregroundColor: Colors.white, // foreground
                                ),
                                onPressed: () {
                                  // Buka URL di browser
                                  launch(
                                      'https://bumibaik.com/donate-payment/' +
                                          Linkid.toString());
                                },
                                child: Text('Donasi Sekarang'),
                              ),
                            )

                            // const SizedBox(height: 35),
                            //  Column(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       children: [
                            //         // LaunchButton
                            //       ],
                            //     ),

                            // const SizedBox(height: 35),
                            // SizedBox(
                            //   height: 50,
                            //   width: 200,
                            //   child:
                            //   ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //       backgroundColor:
                            //           ColorManager.primary, // background
                            //       foregroundColor: Colors.white, // foreground
                            //     ),
                            //     child: isLoading
                            //         ? const Padding(
                            //             padding: EdgeInsets.all(8.0),
                            //             child: CircularProgressIndicator(
                            //               color: Colors.white,
                            //             ),
                            //           )
                            //         : const Text('Donasi Sekarang'),
                            //     onPressed: () async {
                            //       // // CommonDialogWidget.buildOkDialog(
                            //       // //     context,
                            //       // //     false,
                            //       // //     "Fitur pembayaran masih dalam tahap pengembangan.");
                            //       // if (_selectedIndex == null) {
                            //       //   CommonDialogWidget.buildOkDialog(
                            //       //       context,
                            //       //       false,
                            //       //       "Harap pilih nominal pembelian terlebih dahulu.");
                            //       // } else {
                            //       //   startTransaction();
                            //       // }
                            //     },
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                const SizedBox(height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  getImages() {
    List<Widget> image = [];

    image.add(
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        width: double.infinity,
        child: Image.asset(
          'assets/images/coba1.png', // Ganti dengan path gambar Anda
          fit: BoxFit.cover,
        ),
        //  FancyShimmerImage(
        //   boxFit: BoxFit.cover,
        //   imageUrl: element,
        //   errorWidget: Image.network(
        //       'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
        // ),
      ),
    );

    setState(() {});
  }

  // startTransaction() async {
  //   Map<String, dynamic> data = {
  //     "productId": widget.productDonasiModel.id,
  //     "productName": widget.productDonasiModel.data,
  //     "total": 15000,
  //   };
  //   try {
  //     TransactionReturnModel? tr = await TransactionService().adoptTree(data);
  //     String? token = tr.token;

  //     try {
  //       await _midtrans?.startPaymentUiFlow(
  //         token: token,
  //       );

  //       // setState(() {
  //       //   _isLoading = false;
  //       // });

  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => PaymentStatus(
  //       //       orderId: orderId,
  //       //       paymentStatus: true,
  //       //     ),
  //       //   ),
  //       // );
  //     } catch (e) {
  //       // setState(() {
  //       //   _isLoading = false;
  //       // });

  //       // Navigator.push(
  //       //   context,
  //       //   MaterialPageRoute(
  //       //     builder: (context) => PaymentStatus(
  //       //       orderId: orderId,
  //       //       paymentStatus: false,
  //       //     ),
  //       //   ),
  //       // );
  //       // ignore: use_build_context_synchronously
  //       CommonDialogWidget.buildOkDialog(context, false, e.toString());
  //     }
  //   } catch (e) {
  //     CommonDialogWidget.buildOkDialog(context, false, e.toString());
  //   }
  // }
}
