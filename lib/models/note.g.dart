// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Note _$NoteFromJson(Map<String, dynamic> json) => _Note(
  title: json['title'] as String,
  content: json['content'] as String,
  starred: json['starred'] as bool? ?? false,
  createdAt: const TimestampSerializer().fromJson(json['createdAt'] as String),
  updatedAt: const TimestampSerializer().fromJson(json['updatedAt'] as String),
);

Map<String, dynamic> _$NoteToJson(_Note instance) => <String, dynamic>{
  'title': instance.title,
  'content': instance.content,
  'starred': instance.starred,
  'createdAt': const TimestampSerializer().toJson(instance.createdAt),
  'updatedAt': const TimestampSerializer().toJson(instance.updatedAt),
};
