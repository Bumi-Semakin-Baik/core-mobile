import 'dart:async';

import 'package:new_bumi_baik/common/common_dialog_widget.dart';
import 'package:new_bumi_baik/common/common_shimmer_widget.dart';
import 'package:new_bumi_baik/models/tree_scan_detail_model.dart';
import 'package:new_bumi_baik/services/tree_service.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  // List<TreeScanDetailModel>? trees = [
  //   TreeScanDetailModel(
  //     id: 1,
  //     code: "BB2022PP1",
  //     name: "Kayu Manis",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_113145811.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  //   TreeScanDetailModel(
  //     id: 2,
  //     code: "BB2022PP2",
  //     name: "Kayu Putih",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_113049201.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  //   TreeScanDetailModel(
  //     id: 3,
  //     code: "BB2022PP3",
  //     name: "Kayu Putih",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_113242415.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  //   TreeScanDetailModel(
  //     id: 4,
  //     code: "BB2022PP4",
  //     name: "Kayu Manis",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_114704496.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  //   TreeScanDetailModel(
  //     id: 5,
  //     code: "BB2022PP5",
  //     name: "Kayu Manis",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_114905497.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  //   TreeScanDetailModel(
  //     id: 6,
  //     code: "BB2022PP6",
  //     name: "Kayu Putih",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_115031446.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  //   TreeScanDetailModel(
  //     id: 7,
  //     code: "BB2022PP7",
  //     name: "Kayu Putih",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_115112413.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  //   TreeScanDetailModel(
  //     id: 8,
  //     code: "BB2022PP8",
  //     name: "Kayu Putih",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_115638888.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  //   TreeScanDetailModel(
  //     id: 9,
  //     code: "BB2022PP9",
  //     name: "Kayu Manis",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_115830791.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  //   TreeScanDetailModel(
  //     id: 10,
  //     code: "BB2022PP10",
  //     name: "Kluwih",
  //     description: "PT. Sorini Agro Asia Corporindo",
  //     locationName: "Hutan Cempaka",
  //     location: Location(latitude: "-7.7437485", longitude: "112.6561664"),
  //     plantingDate: DateTime(2022),
  //     images: ["Curahtangkil_20221220_120147834.jpg"],
  //     createdAt: DateTime(2022),
  //   ),
  // ];

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition? treePosition;

  final Map<String, Marker> _markers = {};

  Marker? treeMarker;

  @override
  void initState() {
    getDataPohon();
    super.initState();
  }

  getDataPohon() async {
    try {
      treeScanDetail = await TreeService().getTreeScanDetails(widget.kode!);

      treePosition = CameraPosition(
        target: LatLng(double.parse(treeScanDetail!.location!.latitude!),
            double.parse(treeScanDetail!.location!.longitude!)),
        zoom: 14.4746,
      );

      treeMarker = Marker(
        markerId: MarkerId(treeScanDetail!.name!),
        position: LatLng(double.parse(treeScanDetail!.location!.latitude!),
            double.parse(treeScanDetail!.location!.longitude!)),
        infoWindow: InfoWindow(
            title: treeScanDetail!.name!,
            snippet: treeScanDetail!.locationName,
            onTap: () {
              // pushNewScreen(
              //   context,
              //   screen: DetailKunjungan(
              //     pengguna: widget.pengguna,
              //     kunjungan: k,
              //   ),
              //   withNavBar: false, // OPTIONAL VALUE. True by default.
              //   pageTransitionAnimation: PageTransitionAnimation.fade,
              // );
            }),
      );

      setState(() {});
      // for (var element in trees!) {
      //   if (element.code == widget.kode) {
      //     setState(() {
      //       treeScanDetail = element;
      //     });
      //   }
      // }
    } catch (e) {
      CommonDialogWidget.buildOkNotDetectedDialog(context, false,
          "Kode QR pohon tidak terdeteksi dalam database. Coba lagi.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(
        context,
        "Detail - ${widget.kode}",
      ),
      body: SingleChildScrollView(
        child: treeScanDetail == null
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
                          "${treeScanDetail!.name!} - ${treeScanDetail!.description!}",
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
                        treePosition == null
                            ? Container()
                            : SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
                                child: GoogleMap(
                                  mapType: MapType.normal,
                                  initialCameraPosition: treePosition!,
                                  mapToolbarEnabled: true,
                                  zoomControlsEnabled: true,
                                  markers: {treeMarker!},
                                  onMapCreated:
                                      (GoogleMapController controller) {
                                    _controller.complete(controller);
                                  },
                                ),
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
