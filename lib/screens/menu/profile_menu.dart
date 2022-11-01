import 'package:bumibaik_app/common/common_method.dart';
import 'package:bumibaik_app/screens/auth/login.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manager.dart';

class ProfileMenu extends StatefulWidget {
  ProfileMenu({Key? key}) : super(key: key);

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopSection(),
              buildMiddleSection(),
              buildBottomSection(context),
            ],
          ),
        ),
      ),
    );
  }

  buildTopSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: MediaQuery.of(context).size.width * 0.4,
            image: const AssetImage('assets/images/logo_1.png'),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          const Text(
            'Profil',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  buildMiddleSection() {
    return Column(
      children: [],
    );
  }

  buildBottomSection(BuildContext context) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: ElevatedButton(
            onPressed: () {
              CommonMethod().saveUserLoginsDetails(0, "", "", "", "", false);

              Navigator.of(context, rootNavigator: true).pop();

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Login(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorManager.red, // background
              foregroundColor: Colors.white, // foreground
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.logout),
                const Text("Keluar"),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
