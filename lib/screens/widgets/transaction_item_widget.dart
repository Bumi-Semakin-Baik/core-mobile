import 'package:new_bumi_baik/models/transaction_item_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionItemWidget extends StatefulWidget {
  TransactionItemModel item;
  TransactionItemWidget({required this.item, Key? key}) : super(key: key);

  @override
  State<TransactionItemWidget> createState() => _TransactionItemWidgetState();
}

class _TransactionItemWidgetState extends State<TransactionItemWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // CommonWidget().movePage(
        //   context,
        //   NewsDetail(
        //     news: widget.news,
        //   ),
        // );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          //set border radius more than 50% of height and width to make circle
        ),
        elevation: 1.0,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            children: [
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.2,
              //   width: MediaQuery.of(context).size.width * 0.35,
              //   child: ClipRRect(
              //     borderRadius: const BorderRadius.only(
              //         topLeft: Radius.circular(10),
              //         topRight: Radius.circular(10)),
              //     child: FancyShimmerImage(
              //       boxDecoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(15),
              //       ),
              //       boxFit: BoxFit.cover,
              //       imageUrl: widget.news.image!,
              //       errorWidget: Image.network(
              //           'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
              //     ),
              //   ),
              // ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.item.code!,
                        softWrap: true,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        widget.item.detail!,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: Colors.grey,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    DateFormat.yMd('id_ID')
                                        .format(widget.item.date!),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          color: Colors.grey,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Chip(
                            label: Text(widget.item.status!),
                            backgroundColor: getChipColor(widget.item.status!),
                          ),
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

  getChipColor(String status) {
    Color? col;

    switch (status) {
      case "request":
        col = Colors.yellow;
        break;
      default:
        col = Colors.grey;

        break;
    }

    return col;
  }
}
