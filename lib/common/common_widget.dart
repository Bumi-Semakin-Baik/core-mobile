import 'package:bumibaik_app/resources/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommonWidget {
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
