// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strapi_content_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrapiContentItem<T> _$StrapiContentItemFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => StrapiContentItem<T>(
  id: (json['id'] as num).toInt(),
  attributes: fromJsonT(json['attributes']),
  meta: json['meta'] == null
      ? null
      : StrapiContentItemMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StrapiContentItemToJson<T>(
  StrapiContentItem<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'id': instance.id,
  'attributes': toJsonT(instance.attributes),
  'meta': instance.meta,
};

StrapiContentItemMeta _$StrapiContentItemMetaFromJson(
  Map<String, dynamic> json,
) => StrapiContentItemMeta(
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  publishedAt: json['publishedAt'] == null
      ? null
      : DateTime.parse(json['publishedAt'] as String),
);

Map<String, dynamic> _$StrapiContentItemMetaToJson(
  StrapiContentItemMeta instance,
) => <String, dynamic>{
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'publishedAt': instance.publishedAt?.toIso8601String(),
};
