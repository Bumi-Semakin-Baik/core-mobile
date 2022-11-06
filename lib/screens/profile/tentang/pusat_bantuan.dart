import 'package:bumibaik_app/common/common_widget.dart';
import 'package:flutter/material.dart';

class PusatBantuan extends StatefulWidget {
  PusatBantuan({Key? key}) : super(key: key);

  @override
  State<PusatBantuan> createState() => _PusatBantuanState();
}

class _PusatBantuanState extends State<PusatBantuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Pusat Bantuan"),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
