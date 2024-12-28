import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:frontend/models/player_model.dart';
import 'package:frontend/providers/dio_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final playerServiceProvicer = Provider(PlayerService.new);

class PlayerService {
  final Ref _ref;

  PlayerService(this._ref);

  Dio get _dio => _ref.read(dioProvider);

  FutureOr<List<PlayerModel>> getAllPlayers(
     [ int? limit, int? skip, String? sortBy]) async {
    try {
      final response =
          await _dio.get("/v1.0?limit=${limit??10}&skip=${skip??0}&sortBy=${sortBy??'id'}");
      final Iterable responseData = response.data;
      return responseData.map((e) => PlayerModel.fromJson(e)).toList();
    } on DioException catch (e) {
      return Future.error(e.response?.data ?? e.error);
    }
  }
}
