import 'package:freezed_annotation/freezed_annotation.dart';

part 'note.freezed.dart';
part 'note.g.dart';

@freezed
abstract class Note with _$Note {
  factory Note({
    //required String id,
    required String title,
    required String content,
    @Default(false) bool starred,
    @TimestampSerializer() required DateTime createdAt,
    @TimestampSerializer() required DateTime updatedAt,
  }) = _Note;

  factory Note.fromJson(Map<String, Object?> json) => _$NoteFromJson(json);
}

class TimestampSerializer implements JsonConverter<DateTime, String> {
  const TimestampSerializer();

  @override
  DateTime fromJson(String timestamp) => DateTime.parse(timestamp);

  @override
  String toJson(DateTime date) => date.toIso8601String();
}
