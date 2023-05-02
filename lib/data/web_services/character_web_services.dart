import 'package:blocproject/constants/strings.dart';
import 'package:blocproject/data/model/character.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CharacterWebServices {
  late Dio dio;

  CharacterWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 20000),
    );
    dio = Dio(options);
  }

  Future<List<Map<String, dynamic>>> getAllCharacters() async {
    try {
      List<Map<String, dynamic>> allEntities = [];
      Response response = await dio.get('character');
      allEntities.addAll(
          List<Map<String, dynamic>>.from(response.data["results"]));
      return allEntities;
    } catch (e) {
      debugPrint('error is $e');
      return [];
    }
  }
}
