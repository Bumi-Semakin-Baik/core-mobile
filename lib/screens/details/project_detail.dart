import 'dart:async';

import 'package:new_bumi_baik/common/common_dialog_widget.dart';
import 'package:new_bumi_baik/common/common_shimmer_widget.dart';
import 'package:new_bumi_baik/models/project_detail_model.dart';
import 'package:new_bumi_baik/models/tree_scan_detail_model.dart';
import 'package:new_bumi_baik/services/project_service.dart';
import 'package:new_bumi_baik/services/tree_service.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../common/common_widget.dart';

class ProjectDetail extends StatefulWidget {
  int? id;
  ProjectDetail({required this.id, Key? key}) : super(key: key);

  @override
  State<ProjectDetail> createState() => _ProjectDetailState();
}

class _ProjectDetailState extends State<ProjectDetail> {
  ProjectDetailModel? projectDetailModel;

  @override
  void initState() {
    getDataPohon();
    super.initState();
  }

  getDataPohon() async {
    try {
      projectDetailModel = await ProjectService().getProjectDetail(widget.id!);

      setState(() {});
    } catch (e) {
      CommonDialogWidget.buildOkNotDetectedDialog(
          context, false, "Terjadi Kesalahan. Coba lagi.");
    }
  }

  @override
  Widget build(BuildContext context) {
    String imagePath1 = "${projectDetailModel!.photo!}";
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(
        context,
        "Detail Project",
      ),
      body: SingleChildScrollView(
        child: projectDetailModel == null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CommonShimmerWidget().buildTextDetailShimmer(context),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    width: double.infinity,
                    // child: Image(
                    //   fit: BoxFit.cover,
                    //   width: MediaQuery.of(context).size.width * 0.8,
                    //   image: AssetImage(
                    //     'assets/trees/${treeScanDetail!.images![0]}',
                    //   ),
                    // ),
                    child:
                    FancyShimmerImage(
                      boxFit: BoxFit.cover,
                      imageUrl: imagePath1,
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
                          '${projectDetailModel!.name!}',
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Tahun Penanaman",
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          DateFormat("yyyy")
                              .format(projectDetailModel!.plantingDate!),
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
                          projectDetailModel!.address!,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "Deskripsi",
                          style:
                              Theme.of(context).textTheme.headline5?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '${projectDetailModel!.description!}',
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
}
