import 'dart:convert';

import 'package:new_bumi_baik/models/news_model.dart';
import 'package:new_bumi_baik/models/product_adopt_model.dart';
import 'package:new_bumi_baik/models/product_planting_model.dart';
import 'package:new_bumi_baik/models/project_detail_model.dart';
import 'package:new_bumi_baik/resources/app_constants.dart';
import 'package:http/http.dart' as http;

import '../models/project_model.dart';
import '../resources/token.dart';

class ProjectService {
  String projectUrl = "${AppConstants.apiUrl}/projects";

  Future<List<ProjectModel>> getProjects() async {
    String url = "$projectUrl?limit=10&page=1";

    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-control': 'no-cache',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];
        List<ProjectModel> newsData = [];

        for (var item in data) {
          newsData.add(ProjectModel.fromJson(item));
        }

        return newsData;
      } else {
        print(response.body);
        print(response.statusCode);
        throw Exception("ehe");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<ProjectDetailModel> getProjectDetail(int id) async {
    String url = "$projectUrl/$id";

    print(url);

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Cache-control': 'no-cache',
          'Accept': 'application/json',
          'Authorization': 'Bearer $globalAccessToken',
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];

        return ProjectDetailModel.fromJson(data);
      } else {
        print(response.body);

        print(response.statusCode);
        throw Exception("ehe");
      }
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
