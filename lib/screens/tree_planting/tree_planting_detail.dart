import 'package:bumibaik_app/common/common_widget.dart';
import 'package:bumibaik_app/models/product_adopt_model.dart';
import 'package:bumibaik_app/models/product_planting_model.dart';
import 'package:flutter/material.dart';

class TreePlantingDetail extends StatefulWidget {
  ProductPlantingModel productPlantingModel;
  TreePlantingDetail({required this.productPlantingModel, Key? key})
      : super(key: key);

  @override
  State<TreePlantingDetail> createState() => _TreePlantingDetailState();
}

class _TreePlantingDetailState extends State<TreePlantingDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(
        context,
        widget.productPlantingModel.name!,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
