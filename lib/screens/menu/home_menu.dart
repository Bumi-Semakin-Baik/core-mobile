import 'package:bumibaik_app/common/common_shimmer_widget.dart';
import 'package:bumibaik_app/models/news_model.dart';
import 'package:bumibaik_app/models/product_planting_model.dart';
import 'package:bumibaik_app/models/user_model.dart';
import 'package:bumibaik_app/resources/color_manager.dart';
import 'package:bumibaik_app/screens/widgets/product_widget.dart';
import 'package:bumibaik_app/services/product_service.dart';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

import '../../models/product_adopt_model.dart';
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
  List<NewsModel>? news;

  final ScrollController? scrollController1 = ScrollController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      productAdoptList = await ProductService().getProductAdopt();
      productPlantingList = await ProductService().getProductPlanting();
      news = await NewsService().getNews();

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              buildPelunasanKarbon(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              buildAdopsiPohon(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              buildTanamPohon(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              buildBerita(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }

  buildPelunasanKarbon() {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        child: LiquidLinearProgressIndicator(
          value: 0.25, // Defaults to 0.5.
          valueColor: AlwaysStoppedAnimation(ColorManager
              .primary), // Defaults to the current Theme's accentColor.
          backgroundColor: Colors
              .grey[700], // Defaults to the current Theme's backgroundColor.
          borderColor: Colors.grey[700]!,
          borderWidth: 5.0,
          borderRadius: 12.0,
          direction: Axis
              .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
          center: const Text(
            "Pelunasan Karbon kamu \n15%",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
        ),
      ),
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
              'Berita & Blog lainnya',
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
              onPressed: () {},
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
              onPressed: () {},
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

  buildAppbar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height * 0.13,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
        ),
      ),
    );
  }
}
