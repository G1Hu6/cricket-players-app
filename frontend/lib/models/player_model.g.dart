// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlayerModelImpl _$$PlayerModelImplFromJson(Map<String, dynamic> json) =>
    _$PlayerModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      country: json['country'] as String,
      imageUrl: json['imageUrl'] as String,
      positions: json['positions'] as String,
      runs: (json['runs'] as num).toInt(),
      strikeRate: (json['strikeRate'] as num).toDouble(),
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$PlayerModelImplToJson(_$PlayerModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country,
      'imageUrl': instance.imageUrl,
      'positions': instance.positions,
      'runs': instance.runs,
      'strikeRate': instance.strikeRate,
      'updatedAt': instance.updatedAt,
    };
