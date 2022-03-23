import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'api.g.dart';

const version = '1.0';
const revision = '17';

class Uint8ListConverter implements JsonConverter<Uint8List?, List<int>?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(List<int>? json) {
    return json == null ? null : Uint8List.fromList(json);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    return object?.toList();
  }
}

@JsonSerializable(explicitToJson: true)
class Flow {
  Flow(
      {this.uuid,
      this.time,
      this.type,
      this.title,
      this.info,
      this.owner,
      this.users,
      this.message_start,
      this.message_end});
  String? uuid;
  int? time;
  String? type;
  String? title;
  String? info;
  String? owner;
  List<User>? users;
  int? message_start;
  int? message_end;

  factory Flow.fromJson(Map<String, dynamic> json) => _$FlowFromJson(json);
  Map<String, dynamic> toJson() => _$FlowToJson(this);
}

@JsonSerializable(explicitToJson: true)
class User {
  User(
      {this.uuid,
      this.login,
      this.username,
      this.bio,
      this.avatar,
      this.password,
      this.is_bot,
      this.auth_id,
      this.token_ttl,
      this.email,
      this.time_created});
  String? uuid;
  String? login;
  String? username;
  String? bio;
  @Uint8ListConverter() Uint8List? avatar;
  String? password;
  bool? is_bot;
  String? auth_id;
  int? token_ttl;
  String? email;
  int? time_created;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Message {
  Message(
      {required this.uuid,
      this.client_id,
      this.text,
      this.from_user,
      this.time,
      this.from_flow,
      this.file_picture,
      this.file_video,
      this.file_audio,
      this.file_document,
      this.emoji,
      this.edited_time,
      this.edited_status});
  late String uuid;
  int? client_id;
  String? text;
  String? from_user;
  int? time;
  String? from_flow;
  @Uint8ListConverter() Uint8List? file_picture;
  @Uint8ListConverter() Uint8List? file_video;
  @Uint8ListConverter() Uint8List? file_audio;
  @Uint8ListConverter() Uint8List? file_document;
  @Uint8ListConverter() Uint8List? emoji;
  int? edited_time;
  bool? edited_status;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data({this.time, this.user, this.flow, this.message, this.meta});
  int? time;
  List<User>? user;
  List<Flow>? flow;
  List<Message>? message;
  dynamic meta;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Errors {
  Errors({this.code, this.status, this.time, this.detail});
  int? code;
  String? status;
  int? time;
  String? detail;

  factory Errors.fromJson(Map<String, dynamic> json) => _$ErrorsFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Version {
  Version({required this.version, this.revision});
  late String version;
  String? revision;

  factory Version.fromJson(Map<String, dynamic> json) => _$VersionFromJson(json);
  Map<String, dynamic> toJson() => _$VersionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Validator {
  Validator({this.type, this.jsonapi, this.meta});
  String? type;
  Data? data;
  Errors? errors;
  Version? jsonapi;
  dynamic meta;

  factory Validator.fromJson(Map<String, dynamic> json) => _$ValidatorFromJson(json);
  Map<String, dynamic> toJson() => _$ValidatorToJson(this);
}
