import 'package:new_bumi_baik/screens/auth/login.dart';
// import 'package:new_bumi_baik/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:new_bumi_baik/screens/calculate_carbon/calculate_2.dart';
import 'package:new_bumi_baik/splashscreen.dart';

import 'models/carbon_calculation_result_model.dart';
import 'models/user_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BumiBaik',
      home: Splashscreen(),
      // home: CarbonMenu(),
      // home: Calculate2(
      //   result: CarbonCalculationResultModel(unit: 'unit', result: 3.0),
      //   userModel: UserModel(
      //       id: 1,
      //       name: 'Derajat',
      //       email: 'darkbludevil@gmail.com',
      //       telp: '08887125515',
      //       birthDate: '28 agustus 2020',
      //       gender: 'laki - laki',
      //       address: ' aslkdjalsdjlsakj',
      //       photo: '',
      //       type: '',
      //       emailVerifiedAt: DateTime.now()),
      // ),
    );
  }
}
