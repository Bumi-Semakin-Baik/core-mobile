import 'package:bumibaik_app/common/common_widget.dart';
import 'package:bumibaik_app/models/product_adopt_model.dart';
import 'package:bumibaik_app/services/product_service.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

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

  @override
  void initState() {
    getData();

    super.initState();
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

  Widget _buildChips() {
    List<Widget> chips = [];

    for (int i = 0; i < _options.length; i++) {
      ChoiceChip choiceChip = ChoiceChip(
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
        widget.productAdoptModel.name!,
      ),
      body: SingleChildScrollView(
        child: Column(
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
                ? const CircularProgressIndicator()
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productAdoptModel.name!,
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Detail",
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
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
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
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
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
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
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
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
                      ],
                    ),
                  ),
            const SizedBox(height: 20),
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
}
