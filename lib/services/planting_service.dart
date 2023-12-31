// import 'dart:convert';

// import 'package:new_bumi_baik/models/donasi_respone_list_model.dart';
// import 'package:http/http.dart' as http;
// import 'package:new_bumi_baik/resources/token.dart';
// import '../models/donasi_respone_detail_model.dart';
// import '../resources/app_constants.dart';

// class PlantingService {
//   String url = AppConstants.apiUrl;
//   Future<List<Donasi>> getProductPlanting() async {
//     String plantingListUrl = "$url/donations";
//     print(url);

//     try {
//       final response = await http.get(
//         Uri.parse(plantingListUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Cache-control': 'no-cache',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $globalAccessToken',
//         },
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body)['data'];
//         List<Donasi> newsData = [];

//         for (var item in data) {
//           newsData.add(Donasi.fromJson(item));
//         }

//         return newsData;
//       } else {
//         print(response.statusCode);
//         throw Exception("ehe");
//       }
//     } catch (e) {
//       print(e);
//       rethrow;
//     }
//   }

//   Future<DonasiDetail> getProductAdoptDetail(int id) async {
//     String donasiDetailUrl = "$url/donations/$id";

//     print(url);

//     try {
//       final response = await http.get(
//         Uri.parse(donasiDetailUrl),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Cache-control': 'no-cache',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $globalAccessToken',
//         },
//       );

//       if (response.statusCode == 200) {
//         var data = jsonDecode(response.body)['data'];

//         return DonasiDetail.fromJson(data);
//       } else {
//         print(response.statusCode);
//         throw Exception("ehe");
//       }
//     } catch (e) {
//       print(e);
//       rethrow;
//     }
//   }
// }
