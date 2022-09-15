import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'datum.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Datas {
  @JsonKey(name: '_id')
  @HiveField(0)
  String id;

  @JsonKey(name: 'superhero_name')
  @HiveField(1)
  String superheroName;

  @HiveField(2)
  String photo;

  @HiveField(3)
  String name;

  Datas(
      {required this.id,
      required this.superheroName,
      required this.photo,
      required this.name});

  factory Datas.fromJson(Map<String, dynamic> json) => _$DatasFromJson(json);

  Map<String, dynamic> toJson() => _$DatasToJson(this);

  Datas copyWith({
    String? id,
    String? superheroName,
    String? photo,
    String? name,
  }) {
    return Datas(
      id: id ?? this.id,
      superheroName: superheroName ?? this.superheroName,
      photo: photo ?? this.photo,
      name: name ?? this.name,
    );
  }
}
