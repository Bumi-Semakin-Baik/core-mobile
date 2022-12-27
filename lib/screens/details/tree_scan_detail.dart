import 'package:bumibaik_app/common/common_shimmer_widget.dart';
import 'package:bumibaik_app/models/tree_scan_detail_model.dart';
import 'package:bumibaik_app/services/tree_service.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../common/common_widget.dart';

class TreeScanDetail extends StatefulWidget {
  String? kode;
  TreeScanDetail({required this.kode, Key? key}) : super(key: key);

  @override
  State<TreeScanDetail> createState() => _TreeScanDetailState();
}

class _TreeScanDetailState extends State<TreeScanDetail> {
  TreeScanDetailModel? treeScanDetail;
  List<TreeScanDetailModel>? trees = [
    TreeScanDetailModel(
      id: 1,
      code: "BB2022PP1",
      name: "Kayu Manis",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_113145811.jpg"],
      createdAt: DateTime(2022),
    ),
    TreeScanDetailModel(
      id: 2,
      code: "BB2022PP2",
      name: "Kayu Putih",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_113049201.jpg"],
      createdAt: DateTime(2022),
    ),
    TreeScanDetailModel(
      id: 3,
      code: "BB2022PP3",
      name: "Kayu Putih",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_113242415.jpg"],
      createdAt: DateTime(2022),
    ),
    TreeScanDetailModel(
      id: 4,
      code: "BB2022PP4",
      name: "Kayu Manis",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_114704496.jpg"],
      createdAt: DateTime(2022),
    ),
    TreeScanDetailModel(
      id: 5,
      code: "BB2022PP5",
      name: "Kayu Manis",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_114905497.jpg"],
      createdAt: DateTime(2022),
    ),
    TreeScanDetailModel(
      id: 6,
      code: "BB2022PP6",
      name: "Kayu Putih",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_115031446.jpg"],
      createdAt: DateTime(2022),
    ),
    TreeScanDetailModel(
      id: 7,
      code: "BB2022PP7",
      name: "Kayu Putih",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_115112413.jpg"],
      createdAt: DateTime(2022),
    ),
    TreeScanDetailModel(
      id: 8,
      code: "BB2022PP8",
      name: "Kayu Putih",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_115638888.jpg"],
      createdAt: DateTime(2022),
    ),
    TreeScanDetailModel(
      id: 9,
      code: "BB2022PP9",
      name: "Kayu Manis",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_115830791.jpg"],
      createdAt: DateTime(2022),
    ),
    TreeScanDetailModel(
      id: 10,
      code: "BB2022PP10",
      name: "Kluwih",
      description: "PT. Sorini Agro Asia Corporindo",
      locationName: "Hutan Cempaka",
      location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
      plantingDate: DateTime(2022),
      images: ["Curahtangkil_20221220_120147834.jpg"],
      createdAt: DateTime(2022),
    ),
  ];

  @override
  void initState() {
    getDataPohon();
    super.initState();
  }

  getDataPohon() async {
    // treeScanDetail = await TreeService().getTreeScanDetails(widget.kode!);

    // setState(() {});
    for (var element in trees!) {
      if (element.code == widget.kode) {
        setState(() {
          treeScanDetail = element;
        });
      }
    }
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
                    child: Image(
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width * 0.8,
                      image: AssetImage(
                        'assets/trees/${treeScanDetail!.images![0]}',
                      ),
                    ),
                    // child: FancyShimmerImage(
                    //   boxFit: BoxFit.cover,
                    //   imageUrl: treeScanDetail!.images![0],
                    //   errorWidget: Image.network(
                    //       'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                    // ),
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
                          "${treeScanDetail!.name!} - ${treeScanDetail!.description!}",
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
                          "${treeScanDetail!.locationName!} (${treeScanDetail!.location!.latitude}, ${treeScanDetail!.location!.longitude})",
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
                              .format(treeScanDetail!.plantingDate!),
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
