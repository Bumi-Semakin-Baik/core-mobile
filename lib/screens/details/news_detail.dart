import 'package:new_bumi_baik/common/common_shimmer_widget.dart';
import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/news_model.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../services/news_service.dart';

class NewsDetail extends StatefulWidget {
  NewsModel news;
  NewsDetail({required this.news, Key? key}) : super(key: key);

  @override
  State<NewsDetail> createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  NewsModel? newsDetail;

  @override
  void initState() {
    getNewsData();

    super.initState();
  }

  getNewsData() async {
    newsDetail = await NewsService().getNewsDetails(widget.news.id!);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, widget.news.title!),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              width: double.infinity,
              child: FancyShimmerImage(
                boxFit: BoxFit.cover,
                imageUrl: widget.news.image!,
                errorWidget: Image.network(
                    'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.news.title!,
                    style: Theme.of(context).textTheme.headline6?.copyWith(
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            DateFormat.yMMMMEEEEd('id_ID')
                                .format(widget.news.createdAt!),
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     const Icon(
                      //       Icons.visibility,
                      //       color: Colors.grey,
                      //     ),
                      //     const SizedBox(width: 5),
                      //     Text(
                      //       widget.news.views!.toString(),
                      //       style:
                      //           Theme.of(context).textTheme.bodyText2?.copyWith(
                      //                 color: Colors.grey,
                      //               ),
                      //     ),
                      //   ],
                      // ),
                      Row(
                        children: [
                          const Icon(
                            FontAwesomeIcons.pen,
                            color: Colors.grey,
                            size: 18,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            newsDetail == null ? "-" : newsDetail!.author!,
                            style:
                                Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(
                    thickness: 1,
                    color: Colors.grey,
                  ),
                  const SizedBox(height: 10),
                  newsDetail == null
                      ? CommonShimmerWidget().buildTextDescShimmer(context)
                      : HtmlWidget(newsDetail!.content!),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
