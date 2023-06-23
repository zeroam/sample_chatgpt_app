import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:sample_chatgpt_app/models/models_model.dart';

import '../constants/api_constants.dart';

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse("$baseUrl/v1/models"),
        headers: {"Authorization": "Bearer $apiKey"},
      );

      Map jsonResponse = jsonDecode(response.body);

      if (jsonResponse["error"] != null) {
        throw HttpException(jsonResponse["error"]["message"]);
      }
      return ModelsModel.modelsFromSnapshot(jsonResponse["data"]);
    } catch (error) {
      log("api service error $error");
      rethrow;
    }
  }
}
