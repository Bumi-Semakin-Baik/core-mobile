import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/news_model.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:new_bumi_baik/screens/tree_planting/tree_planting_detail.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/product_planting_model.dart';
import '../tree_adopt/tree_adopt_detail.dart';

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
      onTap: () {
        isAdopt
            ? CommonWidget().movePage(
                context,
                TreeAdoptDetail(
                  productAdoptModel: widget.adoptModel!,
                ),
              )
            : CommonWidget().movePage(
                context,
                TreePlantingDetail(
                  productPlantingModel: widget.plantingModel!,
                ),
              );
      },
      child: Card(
        elevation: 1.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.13,
              width: MediaQuery.of(context).size.width * 0.4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
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
              width: MediaQuery.of(context).size.width * 0.4,
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    isAdopt
                        ? widget.adoptModel!.name!
                        : widget.plantingModel!.name!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isAdopt
                          ? Icon(
                              Icons.location_pin,
                              color: ColorManager.blue,
                            )
                          : Icon(
                              Icons.calendar_month,
                              color: ColorManager.blue,
                            ),
                      Text(
                        isAdopt
                            ? widget.adoptModel!.location!
                            : DateFormat.yMMMMd('id_ID')
                                .format(widget.plantingModel!.datePlanting!),
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: ColorManager.blue,
                            ),
                      ),
                    ],
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
