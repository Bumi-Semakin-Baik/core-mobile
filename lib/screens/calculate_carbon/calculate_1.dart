import 'package:bumibaik_app/models/carbon_calculation_result_model.dart';
import 'package:bumibaik_app/models/carbon_calculator_type_model.dart';
import 'package:bumibaik_app/resources/color_manager.dart';
import 'package:bumibaik_app/screens/calculate_carbon/calculate_2.dart';
import 'package:bumibaik_app/services/carbon_service.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Calculate1 extends StatefulWidget {
  Calculate1({Key? key}) : super(key: key);

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

  List<String>? fuelType;
  List<String>? electricityType;
  List<String>? gasType;

  String? defaultBBm = 'Pertalite';

  bool isLoading = false;

  @override
  void initState() {
    getTypeValues();

    super.initState();
  }

  getTypeValues() async {
    try {
      CarbonCalculatorTypeModel res = await CarbonService().getCalculatorType();

      //fuelType!.add(res!.fuel!.);
    } catch (e) {
      print(e);
    }
  }

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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: Column(
                      children: [
                        const Text(
                            "Masukan nominal rupiah sesuai penggunana rata-rata bulanan kamu"),
                        const SizedBox(height: 20),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DropdownButton<String>(
                                      iconSize: 0.0,
                                      underline: const SizedBox(),
                                      value: defaultBBm,
                                      items: <String>[
                                        'Hourly',
                                        'Daily',
                                        'Weekly',
                                        'Monthly',
                                        'Yearly',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String? value) {
                                        setState(
                                          () {
                                            defaultBBm = value;
                                            // selectedTypeOfBooking = value;
                                            // _avaiBookingOptions = [];
                                            // _availableBookings = null;
                                          },
                                        );
                                      },
                                      // icon: Icon(
                                      //   Icons.arrow_drop_down,
                                      //   color: Colors.black,
                                      // ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: ColorManager.primary,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3),
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
                              // if (_formKey.currentState!.validate()) {
                              //   setState(() {
                              //     isLoading = true;
                              //   });

                              //   loginUser();
                              // }
                              CarbonCalculationResultModel res =
                                  CarbonCalculationResultModel(
                                unit: "Kg",
                                result: 1888,
                              );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Calculate2(
                                    result: res,
                                  ),
                                ),
                              );
                            },
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
    );
  }
}
