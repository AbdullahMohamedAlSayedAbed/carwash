// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotions_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PromotionsEntityAdapter extends TypeAdapter<PromotionsEntity> {
  @override
  final int typeId = 1;

  @override
  PromotionsEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PromotionsEntity(
      id: fields[0] as String?,
      name: fields[1] as String?,
      newPrice: fields[2] as double?,
      number: fields[3] as String?,
      image: fields[4] as String?,
      oldPrice: fields[5] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, PromotionsEntity obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.newPrice)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.oldPrice);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PromotionsEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
