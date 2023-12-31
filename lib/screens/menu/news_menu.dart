import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:new_bumi_baik/screens/widgets/news_widget.dart';
import 'package:new_bumi_baik/services/news_service.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

import '../../common/common_shimmer_widget.dart';
import '../../common/common_widget.dart';
import '../../models/news_model.dart';
import '../details/news_detail.dart';

class NewsMenu extends StatefulWidget {
  NewsMenu({Key? key}) : super(key: key);

  @override
  State<NewsMenu> createState() => _NewsMenuState();
}

class _NewsMenuState extends State<NewsMenu> {
  List<NewsModel>? news;

  @override
  void initState() {
    getNewsData();

    super.initState();
  }

  getNewsData() async {
    news = await NewsService().getNews();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    int _current = 0;
    final CarouselController _controller = CarouselController();

    final List<Widget> imageSliders = news == null
        ? []
        : news!.isEmpty
            ? []
            : news!
                .getRange(0, 4)
                .map(
                  (item) => InkWell(
                    onTap: () {
                      CommonWidget().movePage(
                        context,
                        NewsDetail(
                          news: item,
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Stack(
                          children: <Widget>[
                            // Image.network(item.image!,
                            //     fit: BoxFit.cover, width: 1000.0),
                            FancyShimmerImage(
                              boxDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              boxFit: BoxFit.cover,
                              imageUrl: item.image!,
                              errorWidget: Image.network(
                                  'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color.fromARGB(200, 0, 0, 0),
                                      Color.fromARGB(0, 0, 0, 0)
                                    ],
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                  ),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20.0, horizontal: 20.0),
                                child: Text(
                                  item.title!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                .toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.42,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Berita dan Blog',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                imageSliders.isEmpty
                    ? Expanded(child: Container())
                    : buildSliderShow(imageSliders),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                // const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'Berita & Blog lainnya',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                            // height: MediaQuery.of(context).size.height * 0.02),
                            height: MediaQuery.of(context).size.height * 0.005),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.01,
                          color: ColorManager.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: news == null
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.42,
                  child: CommonShimmerWidget().buildNewsItemShimmer(context),
                )
              : buildNewsList(),
        )),
      ),
    );
  }

  buildSliderShow(List<Widget> imageSliders) {
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      items: imageSliders,
    );
  }

  buildNewsList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: news!.length,
              itemBuilder: (context, index) {
                return NewsWidget(
                  news: news![index],
                );
              },
            )
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
      ],
    );
  }
}
