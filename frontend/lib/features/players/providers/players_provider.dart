 
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/player_model.dart';
import 'package:frontend/services/player_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'players_provider.g.dart';

@riverpod
FutureOr<List<PlayerModel>> players(Ref ref ) {
  return ref.read(playerServiceProvicer).getAllPlayers();
}