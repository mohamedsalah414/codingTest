import 'dart:convert';

import 'package:codingtest/src/config/datasource/local_services/local_services.dart';
import 'package:codingtest/src/core/utils/app_strings.dart';
import 'package:codingtest/src/modules/home/data/models/forecast_model.dart';
import 'package:flutter/material.dart';


abstract class DataLocalSource {
  Future<List<dynamic>> getData

  (

  {
});


}

class DataLocalSourceImpl implements DataLocalSource {
  final LocalServices localServices;

  DataLocalSourceImpl({required this.localServices});

  @override
  Future<List<dynamic>> getData() async {
    final response = await localServices.loadData(AppStrings.jsonPath,);
    if (response.statusCode == 200) {
      try {
        final parsedJson =
        await json.decode(response)["sections"] as List<dynamic>;
        return parsedJson;
      } catch (e, s) {
        debugPrint('e is $e \ns is $s');
        return Future.error(e);
      }
    } else {
      debugPrint('API request failed with status code ${response.statusCode}');
      return Future.error(
        'API request failed with status code ${response.statusCode}',
      );
    }
  }

}
