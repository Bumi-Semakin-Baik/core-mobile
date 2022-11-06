import 'package:bumibaik_app/models/carbon_calculation_result_model.dart';
import 'package:bumibaik_app/screens/menu/dashboard.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class Calculate2 extends StatefulWidget {
  CarbonCalculationResultModel result;
  Calculate2({required this.result, Key? key}) : super(key: key);

  @override
  State<Calculate2> createState() => _Calculate2State();
}

class _Calculate2State extends State<Calculate2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 1),
              Positioned(
                top: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                  color: ColorManager.primary,
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${widget.result.result} ${widget.result.unit}',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 50),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'adalah estimasi emisi karbonmu!',
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  )),
                  // decoration: const BoxDecoration(
                  //   image: DecorationImage(
                  //     fit: BoxFit.fill,
                  //     image: AssetImage("assets/sign_up_page_background.png"),
                  //   ),
                  // ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.27,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    margin: EdgeInsets.zero,
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.0),
                        topRight: Radius.circular(25.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          const Text(
                              "Ambil langkah untuk menjadikan bumi semakin baik dengan mengurangi emisi karbonmu"),
                          const SizedBox(height: 20),
                          SizedBox(
                              height: MediaQuery.of(context).size.height * 0.3),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorManager.primary, // background
                                  foregroundColor: Colors.white, // foreground
                                ),
                                child: const Text('LEWATI'),
                                onPressed: () async {
                                  // if (_formKey.currentState!.validate()) {
                                  //   setState(() {
                                  //     isLoading = true;
                                  //   });

                                  //   loginUser();
                                  // }
                                  // Navigator.pushReplacement(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => Dashboard(),
                                  //   ),
                                  // );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
