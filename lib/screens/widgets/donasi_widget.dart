import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/news_model.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:new_bumi_baik/screens/donasi/donasi_detail.dart';
import 'package:new_bumi_baik/screens/tree_planting/tree_planting_detail.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../models/detail_donasi_response_model.dart';
import '../../models/list_donasi_response_model.dart';
import '../../models/product_planting_model.dart';
import '../../services/donation_service.dart';
import '../tree_adopt/tree_adopt_detail.dart';
import 'package:intl/intl.dart';

class DonasiWidget extends StatefulWidget {
  ListDonasiResponseModel? donasiModel;
  DonasiWidget(
      {required this.donasiModel, Key? key})
      : super(key: key);


  @override
  State<DonasiWidget> createState() => _DonasiWidgetState();
}

class _DonasiWidgetState extends State<DonasiWidget> {
  bool isDonasi = false;

  @override
  void initState() {
    checkWhich();

    super.initState();
  }

  checkWhich() {
    if (widget.donasiModel == null) {
      isDonasi = false;
    } else {
      isDonasi = true;
    }
  }


  @override
  Widget build(BuildContext context) {
    String imagePath = "https://bumibaik.com/storage/" + widget.donasiModel!.image!;
    double progress1;
    DateTime tanggal = widget.donasiModel!.due_date!;

    int remainingDays = calculateRemainingDays(tanggal);

    return GestureDetector(
      onTap: () {
        CommonWidget().movePage(
          context,
          DonasiDetail(
            productDonasiModel: widget.donasiModel!,
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
                  imageUrl: imagePath,
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
                  const SizedBox(height: 10),
                  Text(
                    widget.donasiModel!.title!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.donasiModel!.nama_ukm!,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                  ),
                  const SizedBox(height: 10),
                  LinearPercentIndicator(
                    width: 144.0,
                    animation: true,
                    animationDuration: 1000,
                    lineHeight: 11.0,
                    // leading: new Text("left content"),
                    // trailing: new Text("right content"),
                    percent: progress1 = widget.donasiModel!.progress! / 100,
                    center: Text(
                      widget.donasiModel!.progress.toString() + '%',
                      style: TextStyle(fontSize: 10),
                    ),
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: Colors.blue,
                  ),
                  const SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Rp "  + widget.donasiModel!.collected.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                      ),
                      Text(
                        remainingDays.toString() + ' hari lagi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Pohon terkumpul",
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                  ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [

                  //     // isAdopt
                  //     //     ? Icon(
                  //     //         Icons.location_pin,
                  //     //         color: ColorManager.blue,
                  //     //       )
                  //     //     : Icon(
                  //     //         Icons.calendar_month,
                  //     //         color: ColorManager.blue,
                  //     //       ),
                  //     // Text(
                  //     //   isAdopt
                  //     //       ? widget.adoptModel!.location!
                  //     //       : DateFormat.yMMMMd('id_ID')
                  //     //           .format(widget.plantingModel!.datePlanting!),
                  //     //   style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  //     //         color: ColorManager.blue,
                  //     //       ),
                  //     // ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  int calculateRemainingDays(DateTime donationDate) {
    // Ambil tanggal sekarang
    DateTime now = DateTime.now();

    // Hitung selisih hari
    Duration difference = donationDate.difference(now);

    // Konversi selisih hari ke dalam bentuk integer
    int remainingDays = difference.inDays;

    return remainingDays;
  }
}
