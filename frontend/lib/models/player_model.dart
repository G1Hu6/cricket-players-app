import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.g.dart';
part 'player_model.freezed.dart';


@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required int id,
    required String name,
    required String country,
    required String imageUrl,
    required String positions,
    required int runs,
    required double strikeRate,
    required DateTime updatedAt,
  }) = _PlayerModel;

  factory PlayerModel.fromJson(Map<String, Object?> json) =>
      _$PlayerModelFromJson(json);
}
