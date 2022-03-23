// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Flow _$FlowFromJson(Map<String, dynamic> json) => Flow(
      uuid: json['uuid'] as String?,
      time: json['time'] as int?,
      type: json['type'] as String?,
      title: json['title'] as String?,
      info: json['info'] as String?,
      owner: json['owner'] as String?,
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      message_start: json['message_start'] as int?,
      message_end: json['message_end'] as int?,
    );

Map<String, dynamic> _$FlowToJson(Flow instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'time': instance.time,
      'type': instance.type,
      'title': instance.title,
      'info': instance.info,
      'owner': instance.owner,
      'users': instance.users,
      'message_start': instance.message_start,
      'message_end': instance.message_end,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      uuid: json['uuid'] as String?,
      login: json['login'] as String?,
      username: json['username'] as String?,
      bio: json['bio'] as String?,
      avatar: const Uint8ListConverter().fromJson(json['avatar'] as List<int>?),
      password: json['password'] as String?,
      is_bot: json['is_bot'] as bool?,
      auth_id: json['auth_id'] as String?,
      token_ttl: json['token_ttl'] as int?,
      email: json['email'] as String?,
      time_created: json['time_created'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'login': instance.login,
      'username': instance.username,
      'bio': instance.bio,
      'avatar': const Uint8ListConverter().toJson(instance.avatar),
      'password': instance.password,
      'is_bot': instance.is_bot,
      'auth_id': instance.auth_id,
      'token_ttl': instance.token_ttl,
      'email': instance.email,
      'time_created': instance.time_created,
    };

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      uuid: json['uuid'] as String,
      client_id: json['client_id'] as int?,
      text: json['text'] as String?,
      from_user: json['from_user'] as String?,
      time: json['time'] as int?,
      from_flow: json['from_flow'] as String?,
      file_picture: const Uint8ListConverter()
          .fromJson(json['file_picture'] as List<int>?),
      file_video:
          const Uint8ListConverter().fromJson(json['file_video'] as List<int>?),
      file_audio:
          const Uint8ListConverter().fromJson(json['file_audio'] as List<int>?),
      file_document: const Uint8ListConverter()
          .fromJson(json['file_document'] as List<int>?),
      emoji: const Uint8ListConverter().fromJson(json['emoji'] as List<int>?),
      edited_time: json['edited_time'] as int?,
      edited_status: json['edited_status'] as bool?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'client_id': instance.client_id,
      'text': instance.text,
      'from_user': instance.from_user,
      'time': instance.time,
      'from_flow': instance.from_flow,
      'file_picture': const Uint8ListConverter().toJson(instance.file_picture),
      'file_video': const Uint8ListConverter().toJson(instance.file_video),
      'file_audio': const Uint8ListConverter().toJson(instance.file_audio),
      'file_document':
          const Uint8ListConverter().toJson(instance.file_document),
      'emoji': const Uint8ListConverter().toJson(instance.emoji),
      'edited_time': instance.edited_time,
      'edited_status': instance.edited_status,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      time: json['time'] as int?,
      user: (json['user'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      flow: (json['flow'] as List<dynamic>?)
          ?.map((e) => Flow.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: (json['message'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'time': instance.time,
      'user': instance.user,
      'flow': instance.flow,
      'message': instance.message,
      'meta': instance.meta,
    };

Errors _$ErrorsFromJson(Map<String, dynamic> json) => Errors(
      code: json['code'] as int?,
      status: json['status'] as String?,
      time: json['time'] as int?,
      detail: json['detail'] as String?,
    );

Map<String, dynamic> _$ErrorsToJson(Errors instance) => <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'time': instance.time,
      'detail': instance.detail,
    };

Version _$VersionFromJson(Map<String, dynamic> json) => Version(
      version: json['version'] as String,
      revision: json['revision'] as String?,
    );

Map<String, dynamic> _$VersionToJson(Version instance) => <String, dynamic>{
      'version': instance.version,
      'revision': instance.revision,
    };

Validator _$ValidatorFromJson(Map<String, dynamic> json) => Validator(
      type: json['type'] as String?,
      jsonapi: json['jsonapi'] == null
          ? null
          : Version.fromJson(json['jsonapi'] as Map<String, dynamic>),
      meta: json['meta'],
    )
      ..data = json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>)
      ..errors = json['errors'] == null
          ? null
          : Errors.fromJson(json['errors'] as Map<String, dynamic>);

Map<String, dynamic> _$ValidatorToJson(Validator instance) => <String, dynamic>{
      'type': instance.type,
      'data': instance.data,
      'errors': instance.errors,
      'jsonapi': instance.jsonapi,
      'meta': instance.meta,
    };
