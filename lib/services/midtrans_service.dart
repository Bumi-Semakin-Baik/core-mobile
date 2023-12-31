import 'dart:convert';

import 'package:new_bumi_baik/resources/app_constants.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:midtrans_sdk/midtrans_sdk.dart';
import 'package:http/http.dart' as http;

class MidtransService {
  var config = AppConstants.isProd
      ? MidtransConfig(
          clientKey: dotenv.env['PROD_MIDTRANS_CLIENT_KEY'] ?? "",
          merchantBaseUrl: dotenv.env['PROD_MIDTRANS_MERCHANT_BASE_URL'] ?? "",
        )
      : MidtransConfig(
          clientKey: dotenv.env['SB_MIDTRANS_CLIENT_KEY'] ?? "",
          merchantBaseUrl: dotenv.env['SB_MIDTRANS_MERCHANT_BASE_URL'] ?? "",
        );
}
