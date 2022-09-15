// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DatasAdapter extends TypeAdapter<Datas> {
  @override
  final int typeId = 0;

  @override
  Datas read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Datas(
      id: fields[0] as String,
      superheroName: fields[1] as String,
      photo: fields[2] as String,
      name: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Datas obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.superheroName)
      ..writeByte(2)
      ..write(obj.photo)
      ..writeByte(3)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DatasAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datas _$DatasFromJson(Map<String, dynamic> json) => Datas(
      id: json['_id'] as String,
      superheroName: json['superhero_name'] as String,
      photo: json['photo'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
      '_id': instance.id,
      'superhero_name': instance.superheroName,
      'photo': instance.photo,
      'name': instance.name,
    };
