import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/player_model.dart';
import 'package:frontend/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final playerServiceProvicer = Provider((ref) {
   
   return PlayerService(ref);
},);

class PlayerService {
  final Ref _ref;

  PlayerService(this._ref);

  Dio get _dio => _ref.read(dioProvider);

  FutureOr<List<PlayerModel>> getAllPlayers(
      {int? limit, int? skip, String? sortBy}) async {
    try {
      //log("/v1.0?limit=${limit ?? 10}&skip=${skip ?? 0}&sortBy=${sortBy ?? 'id'}");
      final response = await _dio.get(
          "/v1.0?limit=${limit ?? 10}&skip=${skip ?? 0}&sortBy=${sortBy ?? 'id'}");
      log(response.toString());
      log(response.statusCode.toString());
      log("/v1.0?limit=${limit ?? 10}&skip=${skip ?? 0}&sortBy=${sortBy ?? 'id'}");
      final Iterable responseData = response.data["data"];
      return responseData.map((e) => PlayerModel.fromJson(e)).toList();
    } on DioException catch (e) {
      log(e.response?.data["error"]);
      return Future.error(e.response?.data["error"] ?? e.error);
    }
  }
}
