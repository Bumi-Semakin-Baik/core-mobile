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
    //getNewsData();
    super.initState();
  }

  getNewsData() async {
    news = await NewsService().getNews();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
