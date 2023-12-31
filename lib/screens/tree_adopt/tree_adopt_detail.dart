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

import '../../resources/color_manager.dart';

class TreeAdoptDetail extends StatefulWidget {
  ProductAdoptModel productAdoptModel;
  TreeAdoptDetail({required this.productAdoptModel, Key? key})
      : super(key: key);

  @override
  State<TreeAdoptDetail> createState() => _TreeAdoptDetailState();
}

class _TreeAdoptDetailState extends State<TreeAdoptDetail> {
  ProductAdoptModel? newData;

  MidtransSDK? _midtrans;

  bool isLoading = false;

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
    newData = await ProductService()
        .getProductAdoptDetail(widget.productAdoptModel.id!);

    setState(() {});
  }

  int? _selectedIndex;

  final List<String> _options = [
    'Rp.15.000',
    'Rp.25.000',
    'Rp.50.000',
    "Rp.75.000",
    "Rp.100.000",
  ];

  final List<double> optionValue = [
    15000,
    25000,
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
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(
        context,
        widget.productAdoptModel.name!,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlideshow(
                  indicatorRadius: 5,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                  initialPage: 0,
                  indicatorColor: ColorManager.primary,
                  indicatorBackgroundColor: Colors.grey,
                  // onPageChanged: (value) {
                  //   debugPrint('Page changed: $value');
                  // },
                  autoPlayInterval: 3000,
                  isLoop: true,
                  children: getImages(),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.productAdoptModel.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Detail",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              newData!.detail!,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Lokasi",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              newData!.location!,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Sisa Kuota",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              newData!.quota!.toString(),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Pilih Nominal Pembelian",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 50,
                              child: _buildChips(),
                            ),
                            const SizedBox(height: 15),
                            SizedBox(
                              height: 50,
                              width: double.infinity,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorManager.primary, // background
                                  foregroundColor: Colors.white, // foreground
                                ),
                                child: isLoading
                                    ? const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Text('Beli'),
                                onPressed: () async {
                                  // CommonDialogWidget.buildOkDialog(
                                  //     context,
                                  //     false,
                                  //     "Fitur pembayaran masih dalam tahap pengembangan.");
                                  if (_selectedIndex == null) {
                                    CommonDialogWidget.buildOkDialog(
                                        context,
                                        false,
                                        "Harap pilih nominal pembelian terlebih dahulu.");
                                  } else {
                                    startTransaction();
                                  }
                                },
                              ),
                            ),
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
    List<Widget> images = [];

    for (var element in widget.productAdoptModel.images!) {
      images.add(
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          child: FancyShimmerImage(
            boxFit: BoxFit.cover,
            imageUrl: element,
            errorWidget: Image.network(
                'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
          ),
        ),
      );

      setState(() {});
    }

    return images;
  }

  startTransaction() async {
    Map<String, dynamic> data = {
      "productId": widget.productAdoptModel.id,
      "productName": widget.productAdoptModel.name,
      "total": 15000,
    };
    try {
      TransactionReturnModel? tr = await TransactionService().adoptTree(data);
      String? token = tr.token;

      try {
        await _midtrans?.startPaymentUiFlow(
          token: token,
        );

        // setState(() {
        //   _isLoading = false;
        // });

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => PaymentStatus(
        //       orderId: orderId,
        //       paymentStatus: true,
        //     ),
        //   ),
        // );
      } catch (e) {
        // setState(() {
        //   _isLoading = false;
        // });

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => PaymentStatus(
        //       orderId: orderId,
        //       paymentStatus: false,
        //     ),
        //   ),
        // );
        // ignore: use_build_context_synchronously
        CommonDialogWidget.buildOkDialog(context, false, e.toString());
      }
    } catch (e) {
      CommonDialogWidget.buildOkDialog(context, false, e.toString());
    }
  }
}
