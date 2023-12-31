import 'package:new_bumi_baik/common/common_method.dart';
import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/news_model.dart';
import 'package:new_bumi_baik/screens/details/news_detail.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class NewsWidget extends StatefulWidget {
  NewsModel news;
  NewsWidget({required this.news, Key? key}) : super(key: key);

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        CommonWidget().movePage(
          context,
          NewsDetail(
            news: widget.news,
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //set border radius more than 50% of height and width to make circle
        ),
        elevation: 1.0,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.16,
          child: Row(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.35,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: FancyShimmerImage(
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    boxFit: BoxFit.cover,
                    imageUrl: widget.news.image!,
                    errorWidget: Image.network(
                        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.news.title!.length > 40
                            ? "${widget.news.title!.substring(0, 40)}..."
                            : widget.news.title!,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                      ),
                      const SizedBox(height: 15),
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
                                DateFormat.yMd('id_ID')
                                    .format(widget.news.createdAt!),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
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
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .bodyText2
                          //           ?.copyWith(
                          //             color: Colors.grey,
                          //           ),
                          //     ),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
