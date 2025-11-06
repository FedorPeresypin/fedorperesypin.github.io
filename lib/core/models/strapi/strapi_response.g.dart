// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'strapi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StrapiResponse<T> _$StrapiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => StrapiResponse<T>(
  data: fromJsonT(json['data']),
  meta: json['meta'] == null
      ? null
      : StrapiMeta.fromJson(json['meta'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StrapiResponseToJson<T>(
  StrapiResponse<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{'data': toJsonT(instance.data), 'meta': instance.meta};

StrapiMeta _$StrapiMetaFromJson(Map<String, dynamic> json) => StrapiMeta(
  pagination: json['pagination'] == null
      ? null
      : StrapiPagination.fromJson(json['pagination'] as Map<String, dynamic>),
);

Map<String, dynamic> _$StrapiMetaToJson(StrapiMeta instance) =>
    <String, dynamic>{'pagination': instance.pagination};

StrapiPagination _$StrapiPaginationFromJson(Map<String, dynamic> json) =>
    StrapiPagination(
      page: (json['page'] as num).toInt(),
      pageSize: (json['pageSize'] as num).toInt(),
      pageCount: (json['pageCount'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$StrapiPaginationToJson(StrapiPagination instance) =>
    <String, dynamic>{
      'page': instance.page,
      'pageSize': instance.pageSize,
      'pageCount': instance.pageCount,
      'total': instance.total,
    };
