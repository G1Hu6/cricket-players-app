import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final dioProvider = Provider((ref) => Dio(
  BaseOptions(
    baseUrl: "http://localhost:8080/players"
  )
));