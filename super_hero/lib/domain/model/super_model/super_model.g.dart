// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'super_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuperModel _$SuperModelFromJson(Map<String, dynamic> json) => SuperModel(
      code: json['code'] as int,
      data: (json['data'] as List<dynamic>)
          .map((e) => Datas.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SuperModelToJson(SuperModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
    };
