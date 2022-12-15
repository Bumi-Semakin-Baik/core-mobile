import 'dart:convert';

import 'package:bumibaik_app/resources/app_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:http/http.dart' as http;

class MidtransService {
  var config = AppConstants.isProd
      ? MidtransConfig(
          clientKey: dotenv.env['PROD_MIDTRANS_CLIENT_KEY'] ?? "",
          merchantBaseUrl: dotenv.env['PROD_MIDTRANS_MERCHANT_BASE_URL'] ?? "",
          // colorTheme: ColorTheme(
          //   colorPrimary: Theme.of(context).accentColor,
          //   colorPrimaryDark: Theme.of(context).accentColor,
          //   colorSecondary: Theme.of(context).accentColor,
          // ),
        )
      : MidtransConfig(
          clientKey: dotenv.env['SB_MIDTRANS_CLIENT_KEY'] ?? "",
          merchantBaseUrl: dotenv.env['SB_MIDTRANS_MERCHANT_BASE_URL'] ?? "",
          // colorTheme: ColorTheme(
          //   colorPrimary: Theme.of(context).accentColor,
          //   colorPrimaryDark: Theme.of(context).accentColor,
          //   colorSecondary: Theme.of(context).accentColor,
          // ),
        );
}
