import 'package:new_bumi_baik/common/common_method.dart';
import 'package:new_bumi_baik/common/common_shimmer_widget.dart';
import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/transaction_item_model.dart';
import 'package:new_bumi_baik/screens/widgets/transaction_item_widget.dart';
import 'package:new_bumi_baik/services/transaction_service.dart';
import 'package:flutter/material.dart';

import '../services/news_service.dart';

class DaftarTransaksi extends StatefulWidget {
  DaftarTransaksi({Key? key}) : super(key: key);

  @override
  State<DaftarTransaksi> createState() => _DaftarTransaksiState();
}

class _DaftarTransaksiState extends State<DaftarTransaksi> {
  List<TransactionItemModel>? transList;

  @override
  void initState() {
    getDaftarTransaksi();
    super.initState();
  }

  getDaftarTransaksi() async {
    transList = await TransactionService().getTransactions();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Daftar Transaksi"),
      body: transList == null
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: CommonShimmerWidget().buildNewsItemShimmer(context),
            )
          : transList!.isEmpty
              ? const Center(
                  child: Text("Maaf. Anda belum memiliki transaksi."),
                )
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: transList!.length,
                    itemBuilder: (context, index) {
                      return TransactionItemWidget(
                        item: transList![index],
                      );
                    },
                  ),
                ),
    );
  }
}
