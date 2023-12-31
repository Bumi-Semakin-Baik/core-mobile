import 'package:new_bumi_baik/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class CommonWidget {
  static AppBar buildCommonAppbar(BuildContext context, String title) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Padding(
          padding: EdgeInsets.only(
            left: 30,
          ),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  setTextFormField(FaIcon? icon, Icon icon1, String hint) {
    return TextFormField(
      style: TextStyle(color: ColorManager.darkPrimary),
      cursorColor: ColorManager.primary,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        filled: true,
        fillColor: ColorManager.primary.withOpacity(.08),
        prefixIcon: icon ?? icon1,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary.withOpacity(.05),
          ),
          borderRadius: BorderRadius.circular(30).copyWith(
            topRight: const Radius.circular(0),
            topLeft: const Radius.circular(0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManager.primary.withOpacity(.05),
          ),
          borderRadius: BorderRadius.circular(30).copyWith(
            topRight: const Radius.circular(0),
            topLeft: const Radius.circular(0),
          ),
        ),
      ),
    );
  }

  movePage(BuildContext context, Widget wdg) {
    PersistentNavBarNavigator.pushNewScreen(
      context,
      screen: wdg,
      withNavBar: false,
      pageTransitionAnimation: PageTransitionAnimation.fade,
    );
  }

  setCustomInputDecoration(
    String hint,
    FaIcon? icon,
    Icon? icon1,
  ) {
    return InputDecoration(
      hintText: hint,
      border: InputBorder.none,
      filled: true,
      fillColor: ColorManager.primary.withOpacity(.08),
      prefixIcon: icon ?? icon1,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary.withOpacity(.05),
        ),
        borderRadius: BorderRadius.circular(30).copyWith(
          topRight: const Radius.circular(0),
          topLeft: const Radius.circular(0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: ColorManager.primary.withOpacity(.05),
        ),
        borderRadius: BorderRadius.circular(30).copyWith(
          topRight: const Radius.circular(0),
          topLeft: const Radius.circular(0),
        ),
      ),
    );
  }
}
