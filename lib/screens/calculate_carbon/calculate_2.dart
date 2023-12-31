import 'package:new_bumi_baik/models/carbon_calculation_result_model.dart';
import 'package:new_bumi_baik/screens/menu/dashboard.dart';
import 'package:flutter/material.dart';

import '../../common/common_dialog_widget.dart';
import '../../common/common_shimmer_widget.dart';
import '../../models/detail_donasi_response_model.dart';
import '../../models/list_donasi_response_model.dart';
import '../../models/product_adopt_model.dart';
import '../../models/user_model.dart';
import '../../resources/color_manager.dart';
import '../../services/product_service.dart';
import '../donasi/donasi_list.dart';
import '../tree_adopt/tree_adopt_list.dart';
import '../widgets/product_widget.dart';

class Calculate2 extends StatefulWidget {
  CarbonCalculationResultModel result;
  UserModel userModel;
  Calculate2({required this.userModel, required this.result, Key? key})
      : super(key: key);

  @override
  State<Calculate2> createState() => _Calculate2State();
}

class _Calculate2State extends State<Calculate2> {
  List<ProductAdoptModel>? productAdoptList;
  List<ListDonasiResponseModel>? productDonasiList;
  final ScrollController? scrollController1 = ScrollController();
  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      productAdoptList = await ProductService().getProductAdopt();
      setState(() {});
    } catch (e) {}
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 1.2),
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                color: ColorManager.primary,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.result.result!.toStringAsFixed(2)} ${widget.result.unit}',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'adalah estimasi emisi karbonmu!',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
                // decoration: const BoxDecoration(
                //   image: DecorationImage(
                //     fit: BoxFit.fill,
                //     image: AssetImage("assets/sign_up_page_background.png"),
                //   ),
                // ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.25,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 0,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      children: [
                        const Text(
                            "Ambil langkah untuk menjadikan bumi semakin baik dengan mengurangi emisi karbonmu"),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TreeAdoptList(
                                  adoptList: productAdoptList!,
                                ),
                              ),
                            );
                            productAdoptList == null;
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.24,
                              child: CommonShimmerWidget()
                                  .buildProductItemShimmer(context),
                            );
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.24,
                              child: ListView.builder(
                                controller: scrollController1,
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: productAdoptList!.length,
                                itemBuilder: (context, index) {
                                  return ProductWidget(
                                    adoptModel: productAdoptList![index],
                                    plantingModel: null,
                                  );
                                },
                              ),
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/adopt_pic.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  color: Colors.black45,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 25),
                                child: Center(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Adopt Tree / Adopsi Pohon",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    const SizedBox(height: 30),
                                    Text(
                                      "Mulai dari Rp. 15.000 kamu bisa mengurangi emisi karbonmu sebesar 100kg",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            print("masuk");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DonasiList(
                                  donasiList: productDonasiList!,
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/plant_pic.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.23,
                                  color: Colors.black45,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 25),
                                child: Center(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Donate / Donasi",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    const SizedBox(height: 30),
                                    Text(
                                      "Setiap donasi adalah langkah kecil menuju bumi yang lebih hijau.Emisi yang kita kurangi hari ini. Bumi adalah warisan berharga yang kita tinggalkan untuk generasi mendatang.",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6
                                          ?.copyWith(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: SizedBox(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorManager.primary, // background
                                foregroundColor: Colors.white, // foreground
                              ),
                              child: const Text('LEWATI'),
                              onPressed: () async {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Dashboard(
                                      userModel: widget.userModel,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
