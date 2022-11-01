import 'package:bumibaik_app/models/product_planting_model.dart';
import 'package:bumibaik_app/resources/color_manager.dart';
import 'package:bumibaik_app/screens/widgets/product_widget.dart';
import 'package:bumibaik_app/services/product_service.dart';
import 'package:flutter/material.dart';

import '../../models/product_adopt_model.dart';

class HomeMenu extends StatefulWidget {
  HomeMenu({Key? key}) : super(key: key);

  @override
  State<HomeMenu> createState() => _HomeMenuState();
}

class _HomeMenuState extends State<HomeMenu> {
  List<ProductPlantingModel>? productPlantingList;
  List<ProductAdoptModel>? productAdoptList;

  final ScrollController? scrollController1 = ScrollController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    try {
      productAdoptList = await ProductService().getProductAdopt();
      productPlantingList = await ProductService().getProductPlanting();

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              buildAdopsiPohon(),
              //buildTanamPohon(),
            ],
          ),
        ),
      ),
    );
  }

  buildTanamPohon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Tanam pohon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.007),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.01,
                  color: ColorManager.blue,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.blue, // background
                foregroundColor: Colors.white, // foreground
              ),
              child: const Text('Lainnya'),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        productPlantingList == null
            ? CircularProgressIndicator()
            : ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: productPlantingList!.length,
                    itemBuilder: (context, index) {
                      return ProductWidget(
                        adoptModel: null,
                        plantingModel: productPlantingList![index],
                      );
                    },
                  )
                ],
              ),
      ],
    );
  }

  buildAdopsiPohon() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Adopsi pohon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.007),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.height * 0.01,
                  color: ColorManager.blue,
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorManager.blue, // background
                foregroundColor: Colors.white, // foreground
              ),
              child: const Text('Lainnya'),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        productAdoptList == null
            ? CircularProgressIndicator()
            : ListView.builder(
                controller: scrollController1,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: productAdoptList!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(
                    adoptModel: productAdoptList![index],
                    plantingModel: null,
                  );
                },
              ),
      ],
    );
  }

  buildAppbar() {
    return AppBar(
      elevation: 0,
      toolbarHeight: MediaQuery.of(context).size.height * 0.25,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello,",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Hendra!",
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                              fontSize: 30,
                            ),
                      ),
                    ],
                  ),
                  Image(
                    width: MediaQuery.of(context).size.width * 0.4,
                    image: const AssetImage('assets/images/logo_1.png'),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.09,
                color: ColorManager.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
