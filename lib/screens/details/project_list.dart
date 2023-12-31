import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/models/project_model.dart';
import 'package:new_bumi_baik/screens/details/project_detail.dart';
import 'package:new_bumi_baik/screens/tree_adopt/tree_adopt_detail.dart';
import 'package:new_bumi_baik/screens/widgets/product_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:responsive_grid_list/responsive_grid_list.dart';

import '../../resources/color_manager.dart';

class ProjectList extends StatefulWidget {
  List<ProjectModel> projectList;
  ProjectList({required this.projectList, Key? key}) : super(key: key);

  @override
  State<ProjectList> createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidget.buildCommonAppbar(context, "Daftar Project"),
      body: ResponsiveGridList(
        listViewBuilderOptions: ListViewBuilderOptions(shrinkWrap: true),
        minItemsPerRow: 2,
        horizontalGridSpacing: 10,
        verticalGridSpacing: 10,
        minItemWidth: MediaQuery.of(context).size.width * 0.5,
        horizontalGridMargin: 10,
        verticalGridMargin: 10,
        children: List.generate(
          widget.projectList.length,
          (index) => GestureDetector(
            onTap: () {
              CommonWidget().movePage(
                context,
                ProjectDetail(
                  id: widget.projectList[index].id,
                ),
              );
            },
            child: Card(
              elevation: 1.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.13,
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: FancyShimmerImage(
                        boxFit: BoxFit.cover,
                        imageUrl: widget.projectList[index].photo.toString(),
                        errorWidget: Image.network(
                            'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          widget.projectList[index].name!,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style:
                              Theme.of(context).textTheme.headline6?.copyWith(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: ColorManager.blue,
                            ),
                            Text(
                              DateFormat.yMMMMd('id_ID').format(
                                  widget.projectList[index].plantingDate!),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  ?.copyWith(
                                    color: ColorManager.blue,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          growable: false,
        ),
      ),
    );
  }
}
