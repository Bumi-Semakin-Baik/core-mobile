import 'package:flutter/material.dart';

class ColorManager {
  static Color primary = HexColor.fromHex("#63DD3E");
  static Color darkPrimary = HexColor.fromHex("#00AD30");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3000966");
  static Color orange = HexColor.fromHex("#F0BE0D");
  static Color red = HexColor.fromHex("#DA2C38");
  static Color blue = HexColor.fromHex("#05B2DC");
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
