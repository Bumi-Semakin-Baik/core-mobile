import 'dart:async';

import 'package:new_bumi_baik/models/carbon_model.dart';
import 'package:new_bumi_baik/resources/token.dart';
import 'package:new_bumi_baik/screens/auth/login.dart';
import 'package:new_bumi_baik/screens/menu/dashboard.dart';
import 'package:new_bumi_baik/services/auth_service.dart';
import 'package:new_bumi_baik/services/carbon_service.dart';
import 'package:new_bumi_baik/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/common_dialog_widget.dart';
import 'common/common_method.dart';
import 'models/auth_response_model.dart';
import 'models/carbon_and_tree_model.dart';
import 'models/tree_model.dart';
import 'models/user_model.dart';

CarbonModel? carbon;
List<TreeModel> trees = [];

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  Timer? _timer;

  _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  @override
  void initState() {
    _startDelay();

    super.initState();
  }

  getCarbonData() async {
    try {
      CarbonAndTreeModel res = await CarbonService().getCarbon();

      carbon = res.carbon;
      trees.addAll(res.trees!);

      setState(() {});
    } catch (e) {
      carbon = null;
      trees = [];

      setState(() {});
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Future<bool> _checkUserLoginStatus() async {
    WidgetsFlutterBinding.ensureInitialized();
    var prefs = await SharedPreferences.getInstance();
    return prefs.getBool("loginStatus") ?? false;
  }

  _goNext() async {
    if (await _checkUserLoginStatus()) {
      var prefs = await SharedPreferences.getInstance();

      String? email = prefs.getString("email");
      String? password = prefs.getString("password");

      Map<String, dynamic> data = {
        'user': email,
        'password': password,
      };

      try {
        AuthResponseModel? res = await AuthService().login(data);

        setState(() {
          globalAccessToken = res.accessToken!;
        });

        UserModel user = await UserService().getUserDetails();

        CommonMethod().saveUserLoginsDetails(
          user.id!,
          user.name!,
          user.email!,
          password!,
          res.accessToken!,
          true,
          user.gender!,
        );

        await getCarbonData();

        _goToPage(Dashboard(userModel: user));
      } catch (e) {
        buildError(e);
      }
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (ctx) => Login(),
        ),
      );
    }
  }

  buildError(var e) {
    CommonDialogWidget.buildWrongWithAuth(context, false, e.toString());
  }

  _goToPage(Widget name) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => name,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.3),
            Image(
              width: MediaQuery.of(context).size.width * 0.8,
              image: const AssetImage('assets/images/logo_nama.png'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Text(
              "v 0.1.1",
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.2),
            Text(
              "From",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Image(
              width: MediaQuery.of(context).size.width * 0.2,
              image: const AssetImage('assets/images/logo_cempaka.png'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
