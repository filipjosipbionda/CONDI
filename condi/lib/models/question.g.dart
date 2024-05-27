// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionAdapter extends TypeAdapter<Question> {
  @override
  final int typeId = 2;

  @override
  Question read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Question(
      text: fields[0] as String,
      ifClauseCorrectAnswer: fields[1] as String,
      mainClauseCorrectAnswer: fields[2] as String,
      answersIfClause: (fields[3] as List).cast<String>(),
      answersMainClause: (fields[4] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Question obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.ifClauseCorrectAnswer)
      ..writeByte(2)
      ..write(obj.mainClauseCorrectAnswer)
      ..writeByte(3)
      ..write(obj.answersIfClause)
      ..writeByte(4)
      ..write(obj.answersMainClause);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
