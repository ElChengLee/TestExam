// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorModel _$ColorModelFromJson(Map<String, dynamic> json) => ColorModel(
      json['id'] as int,
      json['title'] as String,
      json['userName'] as String,
      json['numViews'] as int,
      json['numVotes'] as int,
      json['numComments'] as int,
      json['numHearts'] as int,
      json['rank'] as int,
      DateTime.parse(json['dateCreated'] as String),
      json['hex'] as String,
      json['description'] as String,
      json['url'] as String,
      json['imageUrl'] as String,
      json['badgeUrl'] as String,
      json['apiUrl'] as String,
    );

Map<String, dynamic> _$ColorModelToJson(ColorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'userName': instance.userName,
      'numViews': instance.numViews,
      'numVotes': instance.numVotes,
      'numComments': instance.numComments,
      'numHearts': instance.numHearts,
      'rank': instance.rank,
      'dateCreated': instance.dateCreated.toIso8601String(),
      'hex': instance.hex,
      'description': instance.description,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'badgeUrl': instance.badgeUrl,
      'apiUrl': instance.apiUrl,
    };
