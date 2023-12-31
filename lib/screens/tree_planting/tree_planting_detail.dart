import 'package:new_bumi_baik/common/common_dialog_widget.dart';
import 'package:new_bumi_baik/common/common_shimmer_widget.dart';
import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/models/product_planting_model.dart';
import 'package:new_bumi_baik/services/product_service.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../resources/color_manager.dart';

class TreePlantingDetail extends StatefulWidget {
  ProductPlantingModel productPlantingModel;
  TreePlantingDetail({required this.productPlantingModel, Key? key})
      : super(key: key);

  @override
  State<TreePlantingDetail> createState() => _TreePlantingDetailState();
}

class _TreePlantingDetailState extends State<TreePlantingDetail> {
  ProductAdoptModel? newData;

  @override
  void initState() {
    getData();

    super.initState();
  }

  getData() async {
    newData = await ProductService()
        .getProductAdoptDetail(widget.productPlantingModel.id!);

    setState(() {});
  }

  int? _selectedIndex;
  final List<String> _options = [
    '1',
    '2',
    '3',
    "4",
    "5",
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
              _selectedIndex = i;
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
        widget.productPlantingModel.name!,
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
                              widget.productPlantingModel.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
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
                                  .headline5
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
                                  .headline5
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
                              "Harga Per Pohon",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              "Rp.200.000",
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Pilih Jumlah Pohon",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5
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
                                child: const Text('Beli'),
                                onPressed: () async {
                                  // if (_formKey.currentState!.validate()) {
                                  //   setState(() {
                                  //     isLoading = true;
                                  //   });

                                  //   loginUser();
                                  // }
                                  CommonDialogWidget.buildOkDialog(
                                      context,
                                      false,
                                      "Fitur pembayaran masih dalam tahap pengembangan.");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                const SizedBox(height: 20),
              ],
            ),
            // Column(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   crossAxisAlignment: CrossAxisAlignment.end,
            //   children: [
            //     Container(
            //       color: Colors.white,
            //       height: 50,
            //       width: double.infinity,
            //       child: Expanded(
            //         child: OutlinedButton(
            //           onPressed: () {},
            //           child: Text("Beli"),
            //         ),
            //       ),
            //     )
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  getImages() {
    List<Widget> images = [];

    for (var element in widget.productPlantingModel.images!) {
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
}
