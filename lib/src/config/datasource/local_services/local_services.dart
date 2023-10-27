import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LocalServices {
  loadData(localPath) async {
    try {
      final String response =
          await rootBundle.loadString(localPath, cache: true);

      return response;
    } catch (e) {
      debugPrint('e is $e');
    }
  }
}
