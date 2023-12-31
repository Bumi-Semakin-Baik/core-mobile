import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/screens/donasi/donasi_detail.dart';
import 'package:new_bumi_baik/screens/tree_adopt/tree_adopt_detail.dart';
import 'package:new_bumi_baik/screens/widgets/product_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../models/detail_donasi_response_model.dart';
import '../../models/list_donasi_response_model.dart';
import '../../resources/color_manager.dart';
import 'package:percent_indicator/percent_indicator.dart';

class DonasiList extends StatefulWidget {
  List<ListDonasiResponseModel> donasiList;
  DonasiList({required this.donasiList, Key? key}) : super(key: key);

  @override
  State<DonasiList> createState() => _DonasiListState();
}

class _DonasiListState extends State<DonasiList> {
  @override
  Widget build(BuildContext context) {
    double progress1;

    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Daftar Donasi"),
      body: ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(shrinkWrap: true),
        minItemsPerRow: 2,
        horizontalGridSpacing: 10,
        verticalGridSpacing: 10,
        minItemWidth: MediaQuery.of(context).size.width * 0.5,
        horizontalGridMargin: 10,
        verticalGridMargin: 10,
        children: List.generate(
          widget.donasiList.length,
          (index) => GestureDetector(
            onTap: () {
              CommonWidget().movePage(
                context,
                DonasiDetail(
                  productDonasiModel: widget.donasiList[index],
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
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: FancyShimmerImage(
                      boxFit: BoxFit.cover,
                      imageUrl: "https://bumibaik.com/storage/" +
                          widget.donasiList[index].image!,
                      errorWidget: Image.network(
                          'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width * 0.40,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.donasiList[index].title!,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.donasiList[index].nama_ukm!,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
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
                          percent: progress1 =
                              widget.donasiList[index].progress! / 100,
                          center: Text(
                            widget.donasiList[index].progress.toString() + " %",
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
                              'Rp. ' +
                                  widget.donasiList[index].collected.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              "${calculateRemainingDays(widget.donasiList[index].due_date!)} hari lagi",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Pohon terkumpul",
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.black,
                                    fontSize: 12,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          growable: false,
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
