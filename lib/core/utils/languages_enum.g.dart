// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguagesEnumAdapter extends TypeAdapter<LanguagesEnum> {
  @override
  final int typeId = 1;

  @override
  LanguagesEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return LanguagesEnum.english;
      case 1:
        return LanguagesEnum.arabic;
      case 2:
        return LanguagesEnum.spanish;
      case 3:
        return LanguagesEnum.french;
      case 4:
        return LanguagesEnum.german;
      case 5:
        return LanguagesEnum.turkish;
      case 6:
        return LanguagesEnum.russian;
      default:
        return LanguagesEnum.english;
    }
  }

  @override
  void write(BinaryWriter writer, LanguagesEnum obj) {
    switch (obj) {
      case LanguagesEnum.english:
        writer.writeByte(0);
        break;
      case LanguagesEnum.arabic:
        writer.writeByte(1);
        break;
      case LanguagesEnum.spanish:
        writer.writeByte(2);
        break;
      case LanguagesEnum.french:
        writer.writeByte(3);
        break;
      case LanguagesEnum.german:
        writer.writeByte(4);
        break;
      case LanguagesEnum.turkish:
        writer.writeByte(5);
        break;
      case LanguagesEnum.russian:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguagesEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
