import 'package:bumibaik_app/common/common_shimmer_widget.dart';
import 'package:bumibaik_app/models/tree_scan_detail_model.dart';
import 'package:bumibaik_app/services/tree_service.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../common/common_widget.dart';

class TreeScanDetail extends StatefulWidget {
  String? kode;
  TreeScanDetail({required this.kode, Key? key}) : super(key: key);

  @override
  State<TreeScanDetail> createState() => _TreeScanDetailState();
}

class _TreeScanDetailState extends State<TreeScanDetail> {
  TreeScanDetailModel? treeScanDetail;

  @override
  void initState() {
    getDataPohon();
    super.initState();
  }

  getDataPohon() async {
    treeScanDetail = await TreeService().getTreeScanDetails(widget.kode!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(
        context,
        "Detail Pohon - ${widget.kode}",
      ),
      body: SingleChildScrollView(
        child: treeScanDetail == null
            ? CommonShimmerWidget().buildTextDetailShimmer(context)
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    child: FancyShimmerImage(
                      boxFit: BoxFit.cover,
                      imageUrl: treeScanDetail!.images![0],
                      errorWidget: Image.network(
                          'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          treeScanDetail!.name!,
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
                          treeScanDetail!.description!,
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
                          treeScanDetail!.locationName!,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
      ),
    );
  }
}
