import 'package:new_bumi_baik/common/common_method.dart';
import 'package:new_bumi_baik/common/common_widget.dart';
import 'package:new_bumi_baik/models/user_model.dart';
import 'package:new_bumi_baik/screens/auth/login.dart';
import 'package:new_bumi_baik/screens/daftar_transaksi.dart';
import 'package:new_bumi_baik/screens/profile/edit_password.dart';
import 'package:new_bumi_baik/screens/profile/edit_profile.dart';
import 'package:new_bumi_baik/screens/profile/tentang/panduan.dart';
import 'package:new_bumi_baik/screens/profile/tentang/pusat_bantuan.dart';
import 'package:new_bumi_baik/screens/profile/tentang/tentang_bb.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../resources/color_manager.dart';

class ProfileMenu extends StatefulWidget {
  UserModel userModel;
  ProfileMenu({required this.userModel, Key? key}) : super(key: key);

  @override
  State<ProfileMenu> createState() => _ProfileMenuState();
}

class _ProfileMenuState extends State<ProfileMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height * 0.15,
        backgroundColor: Colors.white,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Image(
                  width: MediaQuery.of(context).size.width * 0.4,
                  image: const AssetImage('assets/images/logo_nama.png'),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTopSection(),
              buildMiddleSection(),
              buildBottomSection(context),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }

  buildTopSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.015),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              '',
              // 'Profil',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: FancyShimmerImage(
                    boxDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    boxFit: BoxFit.cover,
                    imageUrl: widget.userModel.photo ??
                        "https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Image.png",
                    errorWidget: Image.network(
                        'https://i0.wp.com/www.dobitaobyte.com.br/wp-content/uploads/2016/02/no_image.png?ssl=1'),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.userModel.name!,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline6?.copyWith(
                        color: Colors.black,
                      ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.blue, // background
                      foregroundColor: Colors.white, // foreground
                    ),
                    child: const Text('Edit Profil'),
                    onPressed: () async {
                      print(widget.userModel.photo);
                      CommonWidget().movePage(
                          context,
                          EditProfile(
                            userModel: widget.userModel,
                          ));
                    },
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 40,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorManager.blue, // background
                      foregroundColor: Colors.white, // foreground
                    ),
                    child: const Text('Edit Password'),
                    onPressed: () async {
                      CommonWidget().movePage(context, EditPassword());
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buildMiddleSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Aktifitas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          ListTile(
            onTap: () {
              CommonWidget().movePage(context, DaftarTransaksi());
            },
            leading: Icon(
              FontAwesomeIcons.cartShopping,
              color: ColorManager.primary,
            ),
            title: const Text("Transaksi"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.primary,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              //CommonWidget().movePage(context, Panduan());
            },
            leading: Icon(
              FontAwesomeIcons.gift,
              color: ColorManager.primary,
            ),
            title: const Text("Tukar Voucher"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.primary,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Tentang',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 5),
          ListTile(
            onTap: () {
              CommonWidget().movePage(context, TentangBb());
            },
            leading: Icon(
              Icons.info,
              color: ColorManager.primary,
            ),
            title: const Text("Tentang Bumi Baik"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.primary,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              CommonWidget().movePage(context, Panduan());
            },
            leading: Icon(
              Icons.list_alt,
              color: ColorManager.primary,
            ),
            title: const Text("Panduan"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.primary,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTile(
            onTap: () {
              CommonWidget().movePage(context, PusatBantuan());
            },
            leading: Icon(
              Icons.help_center,
              color: ColorManager.primary,
            ),
            title: const Text("Pusat Bantuan"),
            trailing: Icon(
              Icons.arrow_forward_ios,
              color: ColorManager.primary,
            ),
          ),
          const Divider(
            thickness: 1,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  buildBottomSection(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 20),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width * 0.4,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              onPressed: () {
                CommonMethod()
                    .saveUserLoginsDetails(0, "", "", "", "", false, "");

                Navigator.of(context, rootNavigator: true).pop();

                PersistentNavBarNavigator.pushNewScreen(
                  context,
                  screen: Login(),
                  withNavBar: false, // OPTIONAL VALUE. True by default.
                  pageTransitionAnimation: PageTransitionAnimation.cupertino,
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
        ),
      ],
    );
  }
}
