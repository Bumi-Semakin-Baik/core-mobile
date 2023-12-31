import 'dart:math';

import 'package:new_bumi_baik/common/common_dialog_widget.dart';
import 'package:new_bumi_baik/models/carbon_calculation_result_model.dart';
import 'package:new_bumi_baik/models/carbon_calculator_type_model.dart';
import 'package:new_bumi_baik/models/user_model.dart';
import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:new_bumi_baik/screens/calculate_carbon/calculate_2.dart';
import 'package:new_bumi_baik/services/carbon_service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/carbon_calculator_type_item_model.dart';

class Calculate1 extends StatefulWidget {
  UserModel userModel;
  Calculate1({required this.userModel, Key? key}) : super(key: key);

  @override
  State<Calculate1> createState() => _Calculate1State();
}

class _Calculate1State extends State<Calculate1> {
  TextEditingController bbmController = TextEditingController();
  TextEditingController listrikController = TextEditingController();
  TextEditingController gasController = TextEditingController();

  final _valueValidator = MultiValidator([
    RequiredValidator(errorText: 'Harap isi data ini'),
  ]);

  final _formKey = GlobalKey<FormState>();

  String? defaultFuel = "Solar";
  String? defaultElectricity = "Subsidi";
  String? defaultGas = "Subsidi";

  CarbonCalculatorTypeModel? result;

  int? selectedFuelId;
  int? selectedElectricityId;
  int? selectedGasId;

  bool isLoading = false;

  List<CarbonCalculatorTypeItemModel> fuelList = [
    CarbonCalculatorTypeItemModel(id: 1, name: "Solar"),
    CarbonCalculatorTypeItemModel(id: 2, name: "Pertalite"),
    CarbonCalculatorTypeItemModel(id: 3, name: "Pertamax"),
    CarbonCalculatorTypeItemModel(id: 4, name: "Pertamax Turbo"),
    CarbonCalculatorTypeItemModel(id: 5, name: "Dexlite"),
    CarbonCalculatorTypeItemModel(id: 6, name: "Pertamina Dex"),
  ];

  List<CarbonCalculatorTypeItemModel> electrycityList = [
    CarbonCalculatorTypeItemModel(id: 7, name: "Subsidi"),
    CarbonCalculatorTypeItemModel(id: 8, name: "Non Subsidi"),
  ];

  List<CarbonCalculatorTypeItemModel> gasList = [
    CarbonCalculatorTypeItemModel(id: 9, name: "Subsidi"),
    CarbonCalculatorTypeItemModel(id: 10, name: "Non Subsidi"),
  ];

  @override
  void initState() {
    super.initState();

    getTypeValues();
  }

  getTypeValues() async {
    try {
      result = await CarbonService().getCalculatorType();

      print(result!.fuel!.length);

      setState(() {});

      //await setData(res);

      // fuelTypes.addAll(res.fuel!);

      print("sini");
      // electricityTypes!.addAll(res.electricity!);
      // gasTypes!.addAll(res.gas!);

      // if (res != null) {

      //   setState(() {});
      // } else {
      //   print("kosong");
      // }
    } catch (e) {
      print("@@@" + e.toString());
    }
  }

  // setData(CarbonCalculatorTypeModel c) {
  //   for (int i = 0; i < c.fuel!.length; i++) {
  //     print(c.fuel![i].name);
  //     setState(() {
  //       if (c.fuel![i] != null) {
  //         fuelTypes.add(c.fuel![i] as CarbonCalculatorTypeItemModel);
  //       }
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                child: const Center(
                    child: Text(
                  "Hitung Estimasi Emisi Karbonmu!",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
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
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 30),
                      child: Column(
                        children: [
                          const Text(
                              "Masukan nominal rupiah sesuai penggunaan rata-rata bulanan kamu"),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: bbmController,
                                  validator: _valueValidator,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'BBM',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorManager.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorManager.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    hint: const Text("Pilih data"),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorManager.primary,
                                    ),
                                    underline: const SizedBox(),
                                    items: fuelList.map((item) {
                                      return DropdownMenuItem(
                                        value: item.id,
                                        child: Text(item.name!),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedFuelId = value as int;
                                        },
                                      );
                                    },
                                    value: selectedFuelId,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: listrikController,
                                  validator: _valueValidator,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Listrik',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorManager.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorManager.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    underline: const SizedBox(),
                                    hint: const Text("Pilih data"),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorManager.primary,
                                    ),
                                    items: electrycityList.map((item) {
                                      return DropdownMenuItem(
                                        value: item.id,
                                        child: Text(item.name!),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedElectricityId = value as int;
                                        },
                                      );
                                    },
                                    value: selectedElectricityId,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: gasController,
                                  validator: _valueValidator,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Gas',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: ColorManager.primary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.03),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorManager.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    hint: const Text("Pilih data"),
                                    icon: Icon(
                                      Icons.arrow_drop_down,
                                      color: ColorManager.primary,
                                    ),
                                    underline: const SizedBox(),
                                    items: gasList.map((item) {
                                      return DropdownMenuItem(
                                        value: item.id,
                                        child: Text(item.name!),
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(
                                        () {
                                          selectedGasId = value as int;
                                        },
                                      );
                                    },
                                    value: selectedGasId,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorManager.primary, // background
                                foregroundColor: Colors.white, // foreground
                              ),
                              child: isLoading
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('HITUNG'),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                  });

                                  saveHitungKarbon();
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  saveHitungKarbon() async {
    var prefs = await SharedPreferences.getInstance();

    int? id = prefs.getInt("id");

    Map<String, dynamic> data = {
      'user_id': id,
      "fuel": int.parse(bbmController.text.trim()),
      "fuel_type": selectedFuelId,
      "electricity": int.parse(listrikController.text.trim()),
      "electricity_type": selectedElectricityId,
      "gas": int.parse(gasController.text.trim()),
      "gas_type": selectedGasId,
    };

    try {
      CarbonCalculationResultModel? res =
          await CarbonService().calculateCarbon(data);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Calculate2(
            result: res,
            userModel: widget.userModel,
          ),
        ),
      );
    } catch (e) {
      CommonDialogWidget.buildOkDialog(context, false, "Error: $e");

      setState(() {
        isLoading = false;
      });
    }
  }
}
