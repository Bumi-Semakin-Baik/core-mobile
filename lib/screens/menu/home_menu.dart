import 'package:new_bumi_baik/common/common_dialog_widget.dart';
import 'package:new_bumi_baik/common/common_method.dart';
import 'package:new_bumi_baik/common/common_shimmer_widget.dart';
import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/news_model.dart';
import 'package:new_bumi_baik/models/product_planting_model.dart';
import 'package:new_bumi_baik/models/project_model.dart';
import 'package:new_bumi_baik/models/user_model.dart';
import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:new_bumi_baik/screens/details/project_list.dart';
import 'package:new_bumi_baik/screens/donasi/donasi_list.dart';
import 'package:new_bumi_baik/screens/tree_adopt/tree_adopt_list.dart';
import 'package:new_bumi_baik/screens/tree_planting/tree_planting_list.dart';
import 'package:new_bumi_baik/screens/widgets/donasi_widget.dart';
import 'package:new_bumi_baik/screens/widgets/product_widget.dart';
import 'package:new_bumi_baik/screens/widgets/project_widget.dart';
import 'package:new_bumi_baik/services/product_service.dart';
import 'package:new_bumi_baik/services/project_service.dart';
import 'package:new_bumi_baik/splashscreen.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../models/detail_donasi_response_model.dart';
import '../../models/list_donasi_response_model.dart';
import '../../models/product_adopt_model.dart';
import '../../services/donation_service.dart';
import '../../services/news_service.dart';
import '../widgets/news_widget.dart';

class HomeMenu extends StatefulWidget {
  UserModel userModel;
  HomeMenu({required this.userModel, Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  List<ProductPlantingModel>? productPlantingList;
  List<ProductAdoptModel>? productAdoptList;
  List<ListDonasiResponseModel>? productDonasiList;
  List<ProjectModel>? projectList;
  List<NewsModel>? news;

  final ScrollController? scrollController1 = ScrollController();

  @override
  void initState() {
    getData();
    getNewsData();

    super.initState();
  }

  getData() async {
    if (widget.userModel.type!.toLowerCase() == "corporate") {
      try {
        projectList = await ProjectService().getProjects();

        print(projectList!.length);

        setState(() {});
      } catch (e) {
        CommonDialogWidget.buildOkDialog(context, false, e.toString());
      }
    } else {
      try {
        productAdoptList = await ProductService().getProductAdopt();
        productPlantingList = await ProductService().getProductPlanting();
        productDonasiList = await DonasiService().getListDonasi();

        setState(() {});
      } catch (e) {
        CommonDialogWidget.buildOkDialog(context, false, e.toString());
      }
    }
  }

  getNewsData() async {
    try {
      news = await NewsService().getNews();

      setState(() {});
    } catch (e) {
      print("news: " + e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.userModel.type == "individual"
          ? buildAppbar()
          : buildAppBarCorporate(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: widget.userModel.type == "individual"
              ? buildListInd()
              : buildListCorporate(),
        ),
      ),
    );
  }

//Susunan tampilan Screen Dashboard
  buildListInd() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        // buildPelunasanKarbon(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        buildAdopsiPohon(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        // buildTanamPohon(),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        buildDonasiPohon(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        buildBerita(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
      ],
    );
  }

  buildListCorporate() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        buildProject(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.03),
        buildBerita(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
      ],
    );
  }

  buildAppBarCorporate() {
    return AppBar(
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height * 0.25,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FancyShimmerImage(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.1,
                    boxFit: BoxFit.contain,
                    imageUrl: widget.userModel.photo!,
                    errorWidget: Image.network(
                        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                  ),
                  Text(
                    "Halo,",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText2
                        ?.copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.userModel.name!.length > 15
                        ? "${widget.userModel.name!.substring(0, 18)}..."
                        : "${widget.userModel.name}!",
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 30,
                        ),
                  ),
                ],
              ),
              Image(
                width: MediaQuery.of(context).size.width * 0.2,
                image: const AssetImage('assets/images/logo_icon.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // buildPelunasanKarbon() {
  //   return Center(
  //     child: SizedBox(
  //       width: MediaQuery.of(context).size.width,
  //       height: MediaQuery.of(context).size.height * 0.1,
  //       child: LiquidLinearProgressIndicator(
  //         value: carbon == null
  //             ? 0.0
  //             : carbon!.offset == null
  //                 ? 0.0
  //                 : carbon!.offset! / 100, // Defaults to 0.5.
  //         valueColor: AlwaysStoppedAnimation(ColorManager
  //             .primary), // Defaults to the current Theme's accentColor.
  //         backgroundColor: Colors
  //             .grey[700], // Defaults to the current Theme's backgroundColor.
  //         borderColor: Colors.grey[700]!,
  //         borderWidth: 5.0,
  //         borderRadius: 12.0,
  //         direction: Axis
  //             .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
  //         center: Text(
  //           carbon == null
  //               ? "Pelunasan karbon kamu masih 0%"
  //               : carbon!.offset == null
  //                   ? "Pelunasan karbon kamu masih 0%"
  //                   : "Pelunasan Karbon kamu \n${carbon!.offset!.toStringAsFixed(0)}%",
  //           textAlign: TextAlign.center,
  //           style: const TextStyle(
  //             color: Colors.white,
  //             fontWeight: FontWeight.bold,
  //             fontSize: 17,
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  buildDonasiPohon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Donasi',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.007),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.005,
                  color: ColorManager.blue,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.blue, // background
                foregroundColor: Colors.white, // foreground
              ),
              child: const Text('Lainnya'),
              onPressed: () {
                CommonWidget().movePage(
                  context,
                  DonasiList(
                    donasiList: productDonasiList!,
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        productDonasiList == null
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.36,
                child: CommonShimmerWidget().buildProductItemShimmer(context),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.36,
                child: ListView.builder(
                  controller: scrollController1,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: productDonasiList!.length,
                  itemBuilder: (context, index) {
                    return DonasiWidget(
                      donasiModel: productDonasiList![index],
                      // news: null,
                      // plantingModel: null,
                    );
                  },
                ),
              ),
      ],
    );
  }

  buildBerita() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              'Berita & Blog lainnya PP',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.007),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.height * 0.005,
              color: ColorManager.blue,
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        buildNewsList()
      ],
    );
  }

  buildNewsList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        news == null
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.42,
                child: CommonShimmerWidget().buildNewsItemShimmer(context),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: news!.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewsWidget(
                    news: news![index],
                  );
                },
              ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      ],
    );
  }

  buildTanamPohon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tanam pohon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.007),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.005,
                  color: ColorManager.blue,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.blue, // background
                foregroundColor: Colors.white, // foreground
              ),
              child: const Text('Lainnya'),
              onPressed: () {
                CommonWidget().movePage(
                  context,
                  TreePlantingList(
                    plantingList: productPlantingList!,
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.007),
        productPlantingList == null
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: CommonShimmerWidget().buildProductItemShimmer(context),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: ListView.builder(
                  controller: scrollController1,
                  scrollDirection: Axis.horizontal,
                  itemCount: productPlantingList!.length,
                  itemBuilder: (context, index) {
                    return ProductWidget(
                      plantingModel: productPlantingList![index],
                      adoptModel: null,
                    );
                  },
                ),
              ),
      ],
    );
  }

  buildAdopsiPohon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Adopsi pohon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.007),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.005,
                  color: ColorManager.blue,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.blue, // background
                foregroundColor: Colors.white, // foreground
              ),
              child: const Text('Lainnya'),
              onPressed: () {
                CommonWidget().movePage(
                  context,
                  TreeAdoptList(
                    adoptList: productAdoptList!,
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        productAdoptList == null
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: CommonShimmerWidget().buildProductItemShimmer(context),
              )
            : SizedBox(
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
              ),
      ],
    );
  }

  buildProject() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Daftar Project',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.007),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.005,
                  color: ColorManager.blue,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.blue, // background
                foregroundColor: Colors.white, // foreground
              ),
              child: const Text('Lainnya'),
              onPressed: () {
                CommonWidget().movePage(
                  context,
                  ProjectList(
                    projectList: projectList!,
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        projectList == null
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                child: CommonShimmerWidget().buildProductItemShimmer(context),
              )
            : SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
                child: ListView.builder(
                  controller: scrollController1,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: projectList!.length,
                  itemBuilder: (context, index) {
                    return ProjectWidget(
                      projectModel: projectList![index],
                    );
                  },
                ),
              ),
      ],
    );
  }

  buildAppbar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height * 0.13,
      backgroundColor: Colors.white,
      flexibleSpace: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Halo,",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "${widget.userModel.name}!",
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 30,
                            ),
                      ),
                    ],
                  ),
                  Image(
                    width: MediaQuery.of(context).size.width * 0.2,
                    image: const AssetImage('assets/images/logo_icon.png'),
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
