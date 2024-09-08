// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppointmentEntityAdapter extends TypeAdapter<AppointmentEntity> {
  @override
  final int typeId = 0;

  @override
  AppointmentEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppointmentEntity(
      id: fields[0] as String,
      name: fields[1] as String,
      price: fields[2] as double,
      number: fields[3] as String,
      image: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AppointmentEntity obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.number)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppointmentEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
