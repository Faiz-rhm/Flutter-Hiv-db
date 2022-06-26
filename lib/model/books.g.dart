// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksAdapter extends TypeAdapter<Books> {
  @override
  final int typeId = 1;

  @override
  Books read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Books(
      id: fields[0] as int?,
      title: fields[1] as String?,
      author: fields[2] as String?,
      description: fields[3] as String?,
      imageUrl: fields[4] as String?,
      link: fields[5] as String?,
      category: fields[6] as String?,
      language: fields[7] as String?,
      publishedDate: fields[8] as String?,
      publisher: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Books obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.author)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.link)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.language)
      ..writeByte(8)
      ..write(obj.publishedDate)
      ..writeByte(9)
      ..write(obj.publisher);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
