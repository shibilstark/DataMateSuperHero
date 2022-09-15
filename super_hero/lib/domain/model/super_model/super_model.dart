import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'super_model.g.dart';

@JsonSerializable()
class SuperModel {
  int code;
  List<Datas> data;

  SuperModel({required this.code, required this.data});

  factory SuperModel.fromJson(Map<String, dynamic> json) {
    return _$SuperModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SuperModelToJson(this);

  SuperModel copyWith({
    int? code,
    List<Datas>? data,
  }) {
    return SuperModel(
      code: code ?? this.code,
      data: data ?? this.data,
    );
  }
}
