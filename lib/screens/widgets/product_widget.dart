import 'package:bumibaik_app/models/news_model.dart';
import 'package:bumibaik_app/models/product_adopt_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../models/product_planting_model.dart';

class ProductWidget extends StatefulWidget {
  ProductAdoptModel? adoptModel;
  ProductPlantingModel? plantingModel;
  ProductWidget(
      {required this.adoptModel, required this.plantingModel, Key? key})
      : super(key: key);

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool isAdopt = false;

  @override
  void initState() {
    checkWhich();
    super.initState();
  }

  checkWhich() {
    if (widget.adoptModel == null) {
      isAdopt = false;
    } else {
      isAdopt = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 1.0,
        child: Column(
          children: [
            // SizedBox(
            //   height: 200.0,
            //   child: Ink.image(
            //     image: NetworkImage(package.imageUrl1!),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: FancyShimmerImage(
                  boxFit: BoxFit.cover,
                  imageUrl: isAdopt
                      ? widget.adoptModel!.images![0]
                      : widget.plantingModel!.images![0],
                  errorWidget: Image.network(
                      'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isAdopt
                        ? widget.adoptModel!.name!
                        : widget.plantingModel!.name!,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Disediakan oleh ",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
