import 'package:new_bumi_baik/models/user_model.dart';
import 'package:new_bumi_baik/screens/menu/carbon_menu.dart';
import 'package:new_bumi_baik/screens/menu/home_menu.dart';
import 'package:new_bumi_baik/screens/menu/news_menu.dart';
import 'package:new_bumi_baik/screens/menu/profile_menu.dart';
import 'package:new_bumi_baik/screens/menu/scan_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../resources/color_manager.dart';

class Dashboard extends StatefulWidget {
  UserModel userModel;
  Dashboard({required this.userModel, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  List<Widget> _buildScreens() {
    return [
      HomeMenu(userModel: widget.userModel),
      NewsMenu(),
      ScanMenu(),
      const CarbonMenu(
          //  userModel: widget.userModel,
          ),
      ProfileMenu(userModel: widget.userModel),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.house),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.newspaper),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.qrcode),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.leaf),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const FaIcon(FontAwesomeIcons.userLarge),
        activeColorPrimary: ColorManager.primary,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 20
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        padding: const NavBarPadding.only(top: 15),
        popActionScreens: PopActionScreensType.all,
        bottomScreenMargin: 20,
        // onWillPop: (context) async {
        //   await showDialog(
        //     context: context!,
        //     useSafeArea: true,
        //     builder: (context) => Container(
        //       height: 50.0,
        //       width: 50.0,
        //       color: Colors.white,
        //       child: ElevatedButton(
        //         child: Text("Close"),
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ),
        //   );
        //   return false;
        // },
        // selectedTabScreenContext: (context) {
        //   var testContext = context;
        // },
        hideNavigationBar: _hideNavBar,
        popAllScreensOnTapOfSelectedTab: true,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property
      ),
    );
  }
}
