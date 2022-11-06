import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_ns/liquid_progress_indicator.dart';

import '../../resources/color_manager.dart';

class CarbonMenu extends StatefulWidget {
  CarbonMenu({Key? key}) : super(key: key);

  @override
  State<CarbonMenu> createState() => _CarbonMenuState();
}

class _CarbonMenuState extends State<CarbonMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }

  buildAppbar() {
    return AppBar(
      elevation: 1,
      toolbarHeight: MediaQuery.of(context).size.height * 0.51,
      backgroundColor: Colors.white,
      flexibleSpace: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                width: MediaQuery.of(context).size.width * 0.4,
                image: const AssetImage('assets/images/logo_1.png'),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              const Text(
                'Offset Karbon',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              const Text(
                "Total Jejak karbon kamu dalam setahun teralkhir adalah 1.855,01 Kg ",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: LiquidLinearProgressIndicator(
                    value: 0.25, // Defaults to 0.5.
                    valueColor: AlwaysStoppedAnimation(ColorManager
                        .primary), // Defaults to the current Theme's accentColor.
                    backgroundColor: Colors.grey[
                        700], // Defaults to the current Theme's backgroundColor.
                    borderColor: Colors.grey[700]!,
                    borderWidth: 5.0,
                    borderRadius: 12.0,
                    direction: Axis
                        .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.horizontal.
                    center: const Text(
                      "15%",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              const Text(
                "Pelunasan karbon kamu telah mencapai 15% dari total jejak karbon dalam setahun terakhir",
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.015),
              const Text(
                "Tanggal perhitungan jejak karbon terakhir 10 Juni 2022",
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
