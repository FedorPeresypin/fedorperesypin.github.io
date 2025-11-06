import 'package:json_annotation/json_annotation.dart';

part 'strapi_content_item.g.dart'; // Раскомментируйте после генерации кода

/// Базовая модель элемента контента Strapi
@JsonSerializable(genericArgumentFactories: true)
class StrapiContentItem<T> {
  final int id;
  final T attributes;
  final StrapiContentItemMeta? meta;

  StrapiContentItem({
    required this.id,
    required this.attributes,
    this.meta,
  });

  // Временные методы до генерации кода
  factory StrapiContentItem.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$StrapiContentItemFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$StrapiContentItemToJson(this, toJsonT);
}

/// Метаданные элемента контента
@JsonSerializable()
class StrapiContentItemMeta {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? publishedAt;

  StrapiContentItemMeta({
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
  });

  // Временные методы до генерации кода
  factory StrapiContentItemMeta.fromJson(Map<String, dynamic> json) =>
      _$StrapiContentItemMetaFromJson(json);
  Map<String, dynamic> toJson() => _$StrapiContentItemMetaToJson(this);
}
