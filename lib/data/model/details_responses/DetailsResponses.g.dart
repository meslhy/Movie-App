// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DetailsResponses.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DetailsResponsesAdapter extends TypeAdapter<DetailsResponses> {
  @override
  final int typeId = 0;

  @override
  DetailsResponses read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DetailsResponses(
      backdropPath: fields[0] as String?,
      id: fields[1] as int?,
      originalTitle: fields[2] as String?,
      overview: fields[3] as String?,
      voteAverage: fields[4] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, DetailsResponses obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.backdropPath)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.originalTitle)
      ..writeByte(3)
      ..write(obj.overview)
      ..writeByte(4)
      ..write(obj.voteAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DetailsResponsesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
