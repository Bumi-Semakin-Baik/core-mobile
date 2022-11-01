import 'package:bumibaik_app/resources/color_manager.dart';
import 'package:bumibaik_app/screens/widgets/news_widget.dart';
import 'package:bumibaik_app/services/news_service.dart';
import 'package:flutter/material.dart';

import '../../models/news_model.dart';

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

    print(news);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Berita dan Blog',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              //buildSliderShow(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),

              buildNewsList(),
            ],
          ),
        )),
      ),
    );
  }

  buildSliderShow() {}

  buildNewsList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
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
          height: MediaQuery.of(context).size.height * 0.01,
          color: ColorManager.darkPrimary,
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        news == null
            ? CircularProgressIndicator()
            : ListView(
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
