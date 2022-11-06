import 'package:bumibaik_app/common/common_widget.dart';
import 'package:flutter/material.dart';

class TentangBb extends StatefulWidget {
  TentangBb({Key? key}) : super(key: key);

  @override
  State<TentangBb> createState() => _TentangBbState();
}

class _TentangBbState extends State<TentangBb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Tentang Bumi Baik"),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
