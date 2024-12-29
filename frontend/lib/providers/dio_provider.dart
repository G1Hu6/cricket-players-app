import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final dioProvider = Provider(
    (ref) => Dio(BaseOptions(baseUrl: "http://192.168.124.39:8080/players")));
