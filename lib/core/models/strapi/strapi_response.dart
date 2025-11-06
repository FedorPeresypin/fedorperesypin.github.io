import 'package:json_annotation/json_annotation.dart';

part 'strapi_response.g.dart'; // Раскомментируйте после генерации кода

/// Базовая модель ответа Strapi
@JsonSerializable(genericArgumentFactories: true)
class StrapiResponse<T> {
  final T data;
  final StrapiMeta? meta;

  StrapiResponse({
    required this.data,
    this.meta,
  });

  // Временные методы до генерации кода
  factory StrapiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$StrapiResponseFromJson(json, fromJsonT);
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$StrapiResponseToJson(this, toJsonT);
}

/// Модель метаданных Strapi
@JsonSerializable()
class StrapiMeta {
  final StrapiPagination? pagination;

  StrapiMeta({this.pagination});

  // Временные методы до генерации кода
  factory StrapiMeta.fromJson(Map<String, dynamic> json) =>
      _$StrapiMetaFromJson(json);
  Map<String, dynamic> toJson() => _$StrapiMetaToJson(this);
}

/// Модель пагинации
@JsonSerializable()
class StrapiPagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  StrapiPagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  // Временные методы до генерации кода
  factory StrapiPagination.fromJson(Map<String, dynamic> json) =>
      _$StrapiPaginationFromJson(json);
  Map<String, dynamic> toJson() => _$StrapiPaginationToJson(this);
}
