// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetUserConfigCollection on Isar {
  IsarCollection<UserConfig> get userConfigs => getCollection();
}

const UserConfigSchema = CollectionSchema(
  name: 'UserConfig',
  schema:
      '{"name":"UserConfig","idName":"id","properties":[{"name":"authId","type":"String"},{"name":"avatar","type":"String"},{"name":"bio","type":"String"},{"name":"email","type":"String"},{"name":"hashPassword","type":"String"},{"name":"isBot","type":"Bool"},{"name":"key","type":"String"},{"name":"login","type":"String"},{"name":"salt","type":"String"},{"name":"tokenTTL","type":"Long"},{"name":"username","type":"String"},{"name":"uuid","type":"String"}],"indexes":[{"name":"bio","unique":false,"properties":[{"name":"bio","type":"Hash","caseSensitive":true}]},{"name":"email","unique":false,"properties":[{"name":"email","type":"Hash","caseSensitive":true}]},{"name":"login","unique":false,"properties":[{"name":"login","type":"Hash","caseSensitive":true}]},{"name":"username","unique":false,"properties":[{"name":"username","type":"Hash","caseSensitive":true}]},{"name":"uuid","unique":true,"properties":[{"name":"uuid","type":"Hash","caseSensitive":true}]}],"links":[]}',
  idName: 'id',
  propertyIds: {
    'authId': 0,
    'avatar': 1,
    'bio': 2,
    'email': 3,
    'hashPassword': 4,
    'isBot': 5,
    'key': 6,
    'login': 7,
    'salt': 8,
    'tokenTTL': 9,
    'username': 10,
    'uuid': 11
  },
  listProperties: {},
  indexIds: {'bio': 0, 'email': 1, 'login': 2, 'username': 3, 'uuid': 4},
  indexValueTypes: {
    'bio': [
      IndexValueType.stringHash,
    ],
    'email': [
      IndexValueType.stringHash,
    ],
    'login': [
      IndexValueType.stringHash,
    ],
    'username': [
      IndexValueType.stringHash,
    ],
    'uuid': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {'userLinkedFlows': 0, 'userLinkedMessages': 1},
  backlinkLinkNames: {
    'userLinkedFlows': 'flowLinkedUsers',
    'userLinkedMessages': 'messageLinkedUser'
  },
  getId: _userConfigGetId,
  setId: _userConfigSetId,
  getLinks: _userConfigGetLinks,
  attachLinks: _userConfigAttachLinks,
  serializeNative: _userConfigSerializeNative,
  deserializeNative: _userConfigDeserializeNative,
  deserializePropNative: _userConfigDeserializePropNative,
  serializeWeb: _userConfigSerializeWeb,
  deserializeWeb: _userConfigDeserializeWeb,
  deserializePropWeb: _userConfigDeserializePropWeb,
  version: 3,
);

int? _userConfigGetId(UserConfig object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _userConfigSetId(UserConfig object, int id) {
  object.id = id;
}

List<IsarLinkBase> _userConfigGetLinks(UserConfig object) {
  return [object.userLinkedFlows, object.userLinkedMessages];
}

void _userConfigSerializeNative(
    IsarCollection<UserConfig> collection,
    IsarRawObject rawObj,
    UserConfig object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.authId;
  IsarUint8List? _authId;
  if (value0 != null) {
    _authId = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_authId?.length ?? 0) as int;
  final value1 = object.avatar;
  IsarUint8List? _avatar;
  if (value1 != null) {
    _avatar = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_avatar?.length ?? 0) as int;
  final value2 = object.bio;
  IsarUint8List? _bio;
  if (value2 != null) {
    _bio = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_bio?.length ?? 0) as int;
  final value3 = object.email;
  IsarUint8List? _email;
  if (value3 != null) {
    _email = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_email?.length ?? 0) as int;
  final value4 = object.hashPassword;
  final _hashPassword = IsarBinaryWriter.utf8Encoder.convert(value4);
  dynamicSize += (_hashPassword.length) as int;
  final value5 = object.isBot;
  final _isBot = value5;
  final value6 = object.key;
  IsarUint8List? _key;
  if (value6 != null) {
    _key = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_key?.length ?? 0) as int;
  final value7 = object.login;
  final _login = IsarBinaryWriter.utf8Encoder.convert(value7);
  dynamicSize += (_login.length) as int;
  final value8 = object.salt;
  IsarUint8List? _salt;
  if (value8 != null) {
    _salt = IsarBinaryWriter.utf8Encoder.convert(value8);
  }
  dynamicSize += (_salt?.length ?? 0) as int;
  final value9 = object.tokenTTL;
  final _tokenTTL = value9;
  final value10 = object.username;
  IsarUint8List? _username;
  if (value10 != null) {
    _username = IsarBinaryWriter.utf8Encoder.convert(value10);
  }
  dynamicSize += (_username?.length ?? 0) as int;
  final value11 = object.uuid;
  final _uuid = IsarBinaryWriter.utf8Encoder.convert(value11);
  dynamicSize += (_uuid.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _authId);
  writer.writeBytes(offsets[1], _avatar);
  writer.writeBytes(offsets[2], _bio);
  writer.writeBytes(offsets[3], _email);
  writer.writeBytes(offsets[4], _hashPassword);
  writer.writeBool(offsets[5], _isBot);
  writer.writeBytes(offsets[6], _key);
  writer.writeBytes(offsets[7], _login);
  writer.writeBytes(offsets[8], _salt);
  writer.writeLong(offsets[9], _tokenTTL);
  writer.writeBytes(offsets[10], _username);
  writer.writeBytes(offsets[11], _uuid);
}

UserConfig _userConfigDeserializeNative(IsarCollection<UserConfig> collection,
    int id, IsarBinaryReader reader, List<int> offsets) {
  final object = UserConfig();
  object.authId = reader.readStringOrNull(offsets[0]);
  object.avatar = reader.readStringOrNull(offsets[1]);
  object.bio = reader.readStringOrNull(offsets[2]);
  object.email = reader.readStringOrNull(offsets[3]);
  object.hashPassword = reader.readString(offsets[4]);
  object.id = id;
  object.isBot = reader.readBool(offsets[5]);
  object.key = reader.readStringOrNull(offsets[6]);
  object.login = reader.readString(offsets[7]);
  object.salt = reader.readStringOrNull(offsets[8]);
  object.tokenTTL = reader.readLongOrNull(offsets[9]);
  object.username = reader.readStringOrNull(offsets[10]);
  object.uuid = reader.readString(offsets[11]);
  _userConfigAttachLinks(collection, id, object);
  return object;
}

P _userConfigDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readBool(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readLongOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _userConfigSerializeWeb(
    IsarCollection<UserConfig> collection, UserConfig object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'authId', object.authId);
  IsarNative.jsObjectSet(jsObj, 'avatar', object.avatar);
  IsarNative.jsObjectSet(jsObj, 'bio', object.bio);
  IsarNative.jsObjectSet(jsObj, 'email', object.email);
  IsarNative.jsObjectSet(jsObj, 'hashPassword', object.hashPassword);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'isBot', object.isBot);
  IsarNative.jsObjectSet(jsObj, 'key', object.key);
  IsarNative.jsObjectSet(jsObj, 'login', object.login);
  IsarNative.jsObjectSet(jsObj, 'salt', object.salt);
  IsarNative.jsObjectSet(jsObj, 'tokenTTL', object.tokenTTL);
  IsarNative.jsObjectSet(jsObj, 'username', object.username);
  IsarNative.jsObjectSet(jsObj, 'uuid', object.uuid);
  return jsObj;
}

UserConfig _userConfigDeserializeWeb(
    IsarCollection<UserConfig> collection, dynamic jsObj) {
  final object = UserConfig();
  object.authId = IsarNative.jsObjectGet(jsObj, 'authId');
  object.avatar = IsarNative.jsObjectGet(jsObj, 'avatar');
  object.bio = IsarNative.jsObjectGet(jsObj, 'bio');
  object.email = IsarNative.jsObjectGet(jsObj, 'email');
  object.hashPassword = IsarNative.jsObjectGet(jsObj, 'hashPassword') ?? '';
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.isBot = IsarNative.jsObjectGet(jsObj, 'isBot') ?? false;
  object.key = IsarNative.jsObjectGet(jsObj, 'key');
  object.login = IsarNative.jsObjectGet(jsObj, 'login') ?? '';
  object.salt = IsarNative.jsObjectGet(jsObj, 'salt');
  object.tokenTTL = IsarNative.jsObjectGet(jsObj, 'tokenTTL');
  object.username = IsarNative.jsObjectGet(jsObj, 'username');
  object.uuid = IsarNative.jsObjectGet(jsObj, 'uuid') ?? '';
  _userConfigAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _userConfigDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'authId':
      return (IsarNative.jsObjectGet(jsObj, 'authId')) as P;
    case 'avatar':
      return (IsarNative.jsObjectGet(jsObj, 'avatar')) as P;
    case 'bio':
      return (IsarNative.jsObjectGet(jsObj, 'bio')) as P;
    case 'email':
      return (IsarNative.jsObjectGet(jsObj, 'email')) as P;
    case 'hashPassword':
      return (IsarNative.jsObjectGet(jsObj, 'hashPassword') ?? '') as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'isBot':
      return (IsarNative.jsObjectGet(jsObj, 'isBot') ?? false) as P;
    case 'key':
      return (IsarNative.jsObjectGet(jsObj, 'key')) as P;
    case 'login':
      return (IsarNative.jsObjectGet(jsObj, 'login') ?? '') as P;
    case 'salt':
      return (IsarNative.jsObjectGet(jsObj, 'salt')) as P;
    case 'tokenTTL':
      return (IsarNative.jsObjectGet(jsObj, 'tokenTTL')) as P;
    case 'username':
      return (IsarNative.jsObjectGet(jsObj, 'username')) as P;
    case 'uuid':
      return (IsarNative.jsObjectGet(jsObj, 'uuid') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _userConfigAttachLinks(IsarCollection col, int id, UserConfig object) {
  object.userLinkedFlows.attach(col, col.isar.flows, 'userLinkedFlows', id);
  object.userLinkedMessages
      .attach(col, col.isar.messages, 'userLinkedMessages', id);
}

extension UserConfigByIndex on IsarCollection<UserConfig> {
  Future<UserConfig?> getByUuid(String uuid) {
    return getByIndex('uuid', [uuid]);
  }

  UserConfig? getByUuidSync(String uuid) {
    return getByIndexSync('uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex('uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync('uuid', [uuid]);
  }

  Future<List<UserConfig?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex('uuid', values);
  }

  List<UserConfig?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync('uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex('uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('uuid', values);
  }
}

extension UserConfigQueryWhereSort
    on QueryBuilder<UserConfig, UserConfig, QWhere> {
  QueryBuilder<UserConfig, UserConfig, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhere> anyBio() {
    return addWhereClauseInternal(const IndexWhereClause.any(indexName: 'bio'));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhere> anyEmail() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'email'));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhere> anyLogin() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'login'));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhere> anyUsername() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'username'));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhere> anyUuid() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'uuid'));
  }
}

extension UserConfigQueryWhere
    on QueryBuilder<UserConfig, UserConfig, QWhereClause> {
  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> bioEqualTo(
      String? bio) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'bio',
      value: [bio],
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> bioNotEqualTo(
      String? bio) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'bio',
        upper: [bio],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'bio',
        lower: [bio],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'bio',
        lower: [bio],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'bio',
        upper: [bio],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> bioIsNull() {
    return addWhereClauseInternal(const IndexWhereClause.equalTo(
      indexName: 'bio',
      value: [null],
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> bioIsNotNull() {
    return addWhereClauseInternal(const IndexWhereClause.greaterThan(
      indexName: 'bio',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> emailEqualTo(
      String? email) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'email',
      value: [email],
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> emailNotEqualTo(
      String? email) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'email',
        upper: [email],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'email',
        lower: [email],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'email',
        lower: [email],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'email',
        upper: [email],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> emailIsNull() {
    return addWhereClauseInternal(const IndexWhereClause.equalTo(
      indexName: 'email',
      value: [null],
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> emailIsNotNull() {
    return addWhereClauseInternal(const IndexWhereClause.greaterThan(
      indexName: 'email',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> loginEqualTo(
      String login) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'login',
      value: [login],
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> loginNotEqualTo(
      String login) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'login',
        upper: [login],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'login',
        lower: [login],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'login',
        lower: [login],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'login',
        upper: [login],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> usernameEqualTo(
      String? username) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'username',
      value: [username],
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> usernameNotEqualTo(
      String? username) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'username',
        upper: [username],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'username',
        lower: [username],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'username',
        lower: [username],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'username',
        upper: [username],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> usernameIsNull() {
    return addWhereClauseInternal(const IndexWhereClause.equalTo(
      indexName: 'username',
      value: [null],
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> usernameIsNotNull() {
    return addWhereClauseInternal(const IndexWhereClause.greaterThan(
      indexName: 'username',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> uuidEqualTo(
      String uuid) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'uuid',
      value: [uuid],
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> uuidNotEqualTo(
      String uuid) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uuid',
        upper: [uuid],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uuid',
        lower: [uuid],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uuid',
        lower: [uuid],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uuid',
        upper: [uuid],
        includeUpper: false,
      ));
    }
  }
}

extension UserConfigQueryFilter
    on QueryBuilder<UserConfig, UserConfig, QFilterCondition> {
  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'authId',
      value: null,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'authId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'authId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'authId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'authId',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'authId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'authId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'authId',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'authId',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> avatarIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'avatar',
      value: null,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> avatarEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'avatar',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> avatarGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'avatar',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> avatarLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'avatar',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> avatarBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'avatar',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> avatarStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'avatar',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> avatarEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'avatar',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> avatarContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'avatar',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> avatarMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'avatar',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'bio',
      value: null,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'bio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'bio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'bio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'bio',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'bio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'bio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'bio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'bio',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'email',
      value: null,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'email',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'email',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'email',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      hashPasswordEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashPassword',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      hashPasswordGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashPassword',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      hashPasswordLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashPassword',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      hashPasswordBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashPassword',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      hashPasswordStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'hashPassword',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      hashPasswordEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'hashPassword',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      hashPasswordContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'hashPassword',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      hashPasswordMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'hashPassword',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> isBotEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'isBot',
      value: value,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> keyIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'key',
      value: null,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> keyEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> keyGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> keyLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> keyBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'key',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> keyStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> keyEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> keyContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'key',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> keyMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'key',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> loginEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'login',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> loginGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'login',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> loginLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'login',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> loginBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'login',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> loginStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'login',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> loginEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'login',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> loginContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'login',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> loginMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'login',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> saltIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'salt',
      value: null,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> saltEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'salt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> saltGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'salt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> saltLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'salt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> saltBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'salt',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> saltStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'salt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> saltEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'salt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> saltContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'salt',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> saltMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'salt',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> tokenTTLIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'tokenTTL',
      value: null,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> tokenTTLEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tokenTTL',
      value: value,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      tokenTTLGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'tokenTTL',
      value: value,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> tokenTTLLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'tokenTTL',
      value: value,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> tokenTTLBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'tokenTTL',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> usernameIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'username',
      value: null,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> usernameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      usernameGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> usernameLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> usernameBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'username',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> usernameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> usernameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'username',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> uuidLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'uuid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'uuid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension UserConfigQueryLinks
    on QueryBuilder<UserConfig, UserConfig, QFilterCondition> {
  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> userLinkedFlows(
      FilterQuery<Flow> q) {
    return linkInternal(
      isar.flows,
      q,
      'userLinkedFlows',
    );
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      userLinkedMessages(FilterQuery<Message> q) {
    return linkInternal(
      isar.messages,
      q,
      'userLinkedMessages',
    );
  }
}

extension UserConfigQueryWhereSortBy
    on QueryBuilder<UserConfig, UserConfig, QSortBy> {
  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByAuthId() {
    return addSortByInternal('authId', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByAuthIdDesc() {
    return addSortByInternal('authId', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByAvatar() {
    return addSortByInternal('avatar', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByAvatarDesc() {
    return addSortByInternal('avatar', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByBio() {
    return addSortByInternal('bio', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByBioDesc() {
    return addSortByInternal('bio', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByHashPassword() {
    return addSortByInternal('hashPassword', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByHashPasswordDesc() {
    return addSortByInternal('hashPassword', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByIsBot() {
    return addSortByInternal('isBot', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByIsBotDesc() {
    return addSortByInternal('isBot', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByLogin() {
    return addSortByInternal('login', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByLoginDesc() {
    return addSortByInternal('login', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortBySalt() {
    return addSortByInternal('salt', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortBySaltDesc() {
    return addSortByInternal('salt', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByTokenTTL() {
    return addSortByInternal('tokenTTL', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByTokenTTLDesc() {
    return addSortByInternal('tokenTTL', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByUuid() {
    return addSortByInternal('uuid', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByUuidDesc() {
    return addSortByInternal('uuid', Sort.desc);
  }
}

extension UserConfigQueryWhereSortThenBy
    on QueryBuilder<UserConfig, UserConfig, QSortThenBy> {
  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByAuthId() {
    return addSortByInternal('authId', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByAuthIdDesc() {
    return addSortByInternal('authId', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByAvatar() {
    return addSortByInternal('avatar', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByAvatarDesc() {
    return addSortByInternal('avatar', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByBio() {
    return addSortByInternal('bio', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByBioDesc() {
    return addSortByInternal('bio', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByEmail() {
    return addSortByInternal('email', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByEmailDesc() {
    return addSortByInternal('email', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByHashPassword() {
    return addSortByInternal('hashPassword', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByHashPasswordDesc() {
    return addSortByInternal('hashPassword', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByIsBot() {
    return addSortByInternal('isBot', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByIsBotDesc() {
    return addSortByInternal('isBot', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByKey() {
    return addSortByInternal('key', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByKeyDesc() {
    return addSortByInternal('key', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByLogin() {
    return addSortByInternal('login', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByLoginDesc() {
    return addSortByInternal('login', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenBySalt() {
    return addSortByInternal('salt', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenBySaltDesc() {
    return addSortByInternal('salt', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByTokenTTL() {
    return addSortByInternal('tokenTTL', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByTokenTTLDesc() {
    return addSortByInternal('tokenTTL', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByUuid() {
    return addSortByInternal('uuid', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByUuidDesc() {
    return addSortByInternal('uuid', Sort.desc);
  }
}

extension UserConfigQueryWhereDistinct
    on QueryBuilder<UserConfig, UserConfig, QDistinct> {
  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByAuthId(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('authId', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByAvatar(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('avatar', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByBio(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('bio', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByEmail(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('email', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByHashPassword(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('hashPassword', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByIsBot() {
    return addDistinctByInternal('isBot');
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByKey(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('key', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByLogin(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('login', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctBySalt(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('salt', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByTokenTTL() {
    return addDistinctByInternal('tokenTTL');
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('username', caseSensitive: caseSensitive);
  }

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('uuid', caseSensitive: caseSensitive);
  }
}

extension UserConfigQueryProperty
    on QueryBuilder<UserConfig, UserConfig, QQueryProperty> {
  QueryBuilder<UserConfig, String?, QQueryOperations> authIdProperty() {
    return addPropertyNameInternal('authId');
  }

  QueryBuilder<UserConfig, String?, QQueryOperations> avatarProperty() {
    return addPropertyNameInternal('avatar');
  }

  QueryBuilder<UserConfig, String?, QQueryOperations> bioProperty() {
    return addPropertyNameInternal('bio');
  }

  QueryBuilder<UserConfig, String?, QQueryOperations> emailProperty() {
    return addPropertyNameInternal('email');
  }

  QueryBuilder<UserConfig, String, QQueryOperations> hashPasswordProperty() {
    return addPropertyNameInternal('hashPassword');
  }

  QueryBuilder<UserConfig, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<UserConfig, bool, QQueryOperations> isBotProperty() {
    return addPropertyNameInternal('isBot');
  }

  QueryBuilder<UserConfig, String?, QQueryOperations> keyProperty() {
    return addPropertyNameInternal('key');
  }

  QueryBuilder<UserConfig, String, QQueryOperations> loginProperty() {
    return addPropertyNameInternal('login');
  }

  QueryBuilder<UserConfig, String?, QQueryOperations> saltProperty() {
    return addPropertyNameInternal('salt');
  }

  QueryBuilder<UserConfig, int?, QQueryOperations> tokenTTLProperty() {
    return addPropertyNameInternal('tokenTTL');
  }

  QueryBuilder<UserConfig, String?, QQueryOperations> usernameProperty() {
    return addPropertyNameInternal('username');
  }

  QueryBuilder<UserConfig, String, QQueryOperations> uuidProperty() {
    return addPropertyNameInternal('uuid');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetFlowCollection on Isar {
  IsarCollection<Flow> get flows => getCollection();
}

const FlowSchema = CollectionSchema(
  name: 'Flow',
  schema:
      '{"name":"Flow","idName":"id","properties":[{"name":"flowType","type":"String"},{"name":"info","type":"String"},{"name":"owner","type":"String"},{"name":"timeCreated","type":"Long"},{"name":"title","type":"String"},{"name":"uuid","type":"String"}],"indexes":[{"name":"info","unique":false,"properties":[{"name":"info","type":"Hash","caseSensitive":true}]},{"name":"title","unique":false,"properties":[{"name":"title","type":"Hash","caseSensitive":true}]},{"name":"uuid","unique":true,"properties":[{"name":"uuid","type":"Hash","caseSensitive":true}]}],"links":[{"name":"flowLinkedUsers","target":"UserConfig"}]}',
  idName: 'id',
  propertyIds: {
    'flowType': 0,
    'info': 1,
    'owner': 2,
    'timeCreated': 3,
    'title': 4,
    'uuid': 5
  },
  listProperties: {},
  indexIds: {'info': 0, 'title': 1, 'uuid': 2},
  indexValueTypes: {
    'info': [
      IndexValueType.stringHash,
    ],
    'title': [
      IndexValueType.stringHash,
    ],
    'uuid': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {'flowLinkedUsers': 0, 'flowLinkedMessages': 1},
  backlinkLinkNames: {'flowLinkedMessages': 'messageLinkedFlow'},
  getId: _flowGetId,
  setId: _flowSetId,
  getLinks: _flowGetLinks,
  attachLinks: _flowAttachLinks,
  serializeNative: _flowSerializeNative,
  deserializeNative: _flowDeserializeNative,
  deserializePropNative: _flowDeserializePropNative,
  serializeWeb: _flowSerializeWeb,
  deserializeWeb: _flowDeserializeWeb,
  deserializePropWeb: _flowDeserializePropWeb,
  version: 3,
);

int? _flowGetId(Flow object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _flowSetId(Flow object, int id) {
  object.id = id;
}

List<IsarLinkBase> _flowGetLinks(Flow object) {
  return [object.flowLinkedUsers, object.flowLinkedMessages];
}

void _flowSerializeNative(IsarCollection<Flow> collection, IsarRawObject rawObj,
    Flow object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.flowType;
  IsarUint8List? _flowType;
  if (value0 != null) {
    _flowType = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_flowType?.length ?? 0) as int;
  final value1 = object.info;
  IsarUint8List? _info;
  if (value1 != null) {
    _info = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_info?.length ?? 0) as int;
  final value2 = object.owner;
  IsarUint8List? _owner;
  if (value2 != null) {
    _owner = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_owner?.length ?? 0) as int;
  final value3 = object.timeCreated;
  final _timeCreated = value3;
  final value4 = object.title;
  IsarUint8List? _title;
  if (value4 != null) {
    _title = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_title?.length ?? 0) as int;
  final value5 = object.uuid;
  final _uuid = IsarBinaryWriter.utf8Encoder.convert(value5);
  dynamicSize += (_uuid.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _flowType);
  writer.writeBytes(offsets[1], _info);
  writer.writeBytes(offsets[2], _owner);
  writer.writeLong(offsets[3], _timeCreated);
  writer.writeBytes(offsets[4], _title);
  writer.writeBytes(offsets[5], _uuid);
}

Flow _flowDeserializeNative(IsarCollection<Flow> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Flow();
  object.flowType = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.info = reader.readStringOrNull(offsets[1]);
  object.owner = reader.readStringOrNull(offsets[2]);
  object.timeCreated = reader.readLongOrNull(offsets[3]);
  object.title = reader.readStringOrNull(offsets[4]);
  object.uuid = reader.readString(offsets[5]);
  _flowAttachLinks(collection, id, object);
  return object;
}

P _flowDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _flowSerializeWeb(IsarCollection<Flow> collection, Flow object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'flowType', object.flowType);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'info', object.info);
  IsarNative.jsObjectSet(jsObj, 'owner', object.owner);
  IsarNative.jsObjectSet(jsObj, 'timeCreated', object.timeCreated);
  IsarNative.jsObjectSet(jsObj, 'title', object.title);
  IsarNative.jsObjectSet(jsObj, 'uuid', object.uuid);
  return jsObj;
}

Flow _flowDeserializeWeb(IsarCollection<Flow> collection, dynamic jsObj) {
  final object = Flow();
  object.flowType = IsarNative.jsObjectGet(jsObj, 'flowType');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.info = IsarNative.jsObjectGet(jsObj, 'info');
  object.owner = IsarNative.jsObjectGet(jsObj, 'owner');
  object.timeCreated = IsarNative.jsObjectGet(jsObj, 'timeCreated');
  object.title = IsarNative.jsObjectGet(jsObj, 'title');
  object.uuid = IsarNative.jsObjectGet(jsObj, 'uuid') ?? '';
  _flowAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _flowDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'flowType':
      return (IsarNative.jsObjectGet(jsObj, 'flowType')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'info':
      return (IsarNative.jsObjectGet(jsObj, 'info')) as P;
    case 'owner':
      return (IsarNative.jsObjectGet(jsObj, 'owner')) as P;
    case 'timeCreated':
      return (IsarNative.jsObjectGet(jsObj, 'timeCreated')) as P;
    case 'title':
      return (IsarNative.jsObjectGet(jsObj, 'title')) as P;
    case 'uuid':
      return (IsarNative.jsObjectGet(jsObj, 'uuid') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _flowAttachLinks(IsarCollection col, int id, Flow object) {
  object.flowLinkedUsers
      .attach(col, col.isar.userConfigs, 'flowLinkedUsers', id);
  object.flowLinkedMessages
      .attach(col, col.isar.messages, 'flowLinkedMessages', id);
}

extension FlowByIndex on IsarCollection<Flow> {
  Future<Flow?> getByUuid(String uuid) {
    return getByIndex('uuid', [uuid]);
  }

  Flow? getByUuidSync(String uuid) {
    return getByIndexSync('uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex('uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync('uuid', [uuid]);
  }

  Future<List<Flow?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex('uuid', values);
  }

  List<Flow?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync('uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex('uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('uuid', values);
  }
}

extension FlowQueryWhereSort on QueryBuilder<Flow, Flow, QWhere> {
  QueryBuilder<Flow, Flow, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Flow, Flow, QAfterWhere> anyInfo() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'info'));
  }

  QueryBuilder<Flow, Flow, QAfterWhere> anyTitle() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'title'));
  }

  QueryBuilder<Flow, Flow, QAfterWhere> anyUuid() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'uuid'));
  }
}

extension FlowQueryWhere on QueryBuilder<Flow, Flow, QWhereClause> {
  QueryBuilder<Flow, Flow, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> infoEqualTo(String? info) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'info',
      value: [info],
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> infoNotEqualTo(String? info) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'info',
        upper: [info],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'info',
        lower: [info],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'info',
        lower: [info],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'info',
        upper: [info],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> infoIsNull() {
    return addWhereClauseInternal(const IndexWhereClause.equalTo(
      indexName: 'info',
      value: [null],
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> infoIsNotNull() {
    return addWhereClauseInternal(const IndexWhereClause.greaterThan(
      indexName: 'info',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> titleEqualTo(String? title) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'title',
      value: [title],
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> titleNotEqualTo(String? title) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'title',
        upper: [title],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'title',
        lower: [title],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'title',
        lower: [title],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'title',
        upper: [title],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> titleIsNull() {
    return addWhereClauseInternal(const IndexWhereClause.equalTo(
      indexName: 'title',
      value: [null],
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> titleIsNotNull() {
    return addWhereClauseInternal(const IndexWhereClause.greaterThan(
      indexName: 'title',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> uuidEqualTo(String uuid) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'uuid',
      value: [uuid],
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> uuidNotEqualTo(String uuid) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uuid',
        upper: [uuid],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uuid',
        lower: [uuid],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uuid',
        lower: [uuid],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uuid',
        upper: [uuid],
        includeUpper: false,
      ));
    }
  }
}

extension FlowQueryFilter on QueryBuilder<Flow, Flow, QFilterCondition> {
  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'flowType',
      value: null,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'flowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'flowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'flowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'flowType',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'flowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'flowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'flowType',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'flowType',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'info',
      value: null,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'info',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'info',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'info',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'info',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'info',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'info',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'info',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'info',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'owner',
      value: null,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'owner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'owner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'owner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'owner',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'owner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'owner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'owner',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'owner',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> timeCreatedIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'timeCreated',
      value: null,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> timeCreatedEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'timeCreated',
      value: value,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> timeCreatedGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'timeCreated',
      value: value,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> timeCreatedLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'timeCreated',
      value: value,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> timeCreatedBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'timeCreated',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'title',
      value: null,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'title',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'title',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'title',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> uuidLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'uuid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> uuidContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> uuidMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'uuid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension FlowQueryLinks on QueryBuilder<Flow, Flow, QFilterCondition> {
  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowLinkedUsers(
      FilterQuery<UserConfig> q) {
    return linkInternal(
      isar.userConfigs,
      q,
      'flowLinkedUsers',
    );
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowLinkedMessages(
      FilterQuery<Message> q) {
    return linkInternal(
      isar.messages,
      q,
      'flowLinkedMessages',
    );
  }
}

extension FlowQueryWhereSortBy on QueryBuilder<Flow, Flow, QSortBy> {
  QueryBuilder<Flow, Flow, QAfterSortBy> sortByFlowType() {
    return addSortByInternal('flowType', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByFlowTypeDesc() {
    return addSortByInternal('flowType', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByInfo() {
    return addSortByInternal('info', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByInfoDesc() {
    return addSortByInternal('info', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByOwner() {
    return addSortByInternal('owner', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByOwnerDesc() {
    return addSortByInternal('owner', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByTimeCreated() {
    return addSortByInternal('timeCreated', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByTimeCreatedDesc() {
    return addSortByInternal('timeCreated', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByUuid() {
    return addSortByInternal('uuid', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> sortByUuidDesc() {
    return addSortByInternal('uuid', Sort.desc);
  }
}

extension FlowQueryWhereSortThenBy on QueryBuilder<Flow, Flow, QSortThenBy> {
  QueryBuilder<Flow, Flow, QAfterSortBy> thenByFlowType() {
    return addSortByInternal('flowType', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByFlowTypeDesc() {
    return addSortByInternal('flowType', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByInfo() {
    return addSortByInternal('info', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByInfoDesc() {
    return addSortByInternal('info', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByOwner() {
    return addSortByInternal('owner', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByOwnerDesc() {
    return addSortByInternal('owner', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByTimeCreated() {
    return addSortByInternal('timeCreated', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByTimeCreatedDesc() {
    return addSortByInternal('timeCreated', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByTitle() {
    return addSortByInternal('title', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByTitleDesc() {
    return addSortByInternal('title', Sort.desc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByUuid() {
    return addSortByInternal('uuid', Sort.asc);
  }

  QueryBuilder<Flow, Flow, QAfterSortBy> thenByUuidDesc() {
    return addSortByInternal('uuid', Sort.desc);
  }
}

extension FlowQueryWhereDistinct on QueryBuilder<Flow, Flow, QDistinct> {
  QueryBuilder<Flow, Flow, QDistinct> distinctByFlowType(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('flowType', caseSensitive: caseSensitive);
  }

  QueryBuilder<Flow, Flow, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Flow, Flow, QDistinct> distinctByInfo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('info', caseSensitive: caseSensitive);
  }

  QueryBuilder<Flow, Flow, QDistinct> distinctByOwner(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('owner', caseSensitive: caseSensitive);
  }

  QueryBuilder<Flow, Flow, QDistinct> distinctByTimeCreated() {
    return addDistinctByInternal('timeCreated');
  }

  QueryBuilder<Flow, Flow, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('title', caseSensitive: caseSensitive);
  }

  QueryBuilder<Flow, Flow, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('uuid', caseSensitive: caseSensitive);
  }
}

extension FlowQueryProperty on QueryBuilder<Flow, Flow, QQueryProperty> {
  QueryBuilder<Flow, String?, QQueryOperations> flowTypeProperty() {
    return addPropertyNameInternal('flowType');
  }

  QueryBuilder<Flow, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Flow, String?, QQueryOperations> infoProperty() {
    return addPropertyNameInternal('info');
  }

  QueryBuilder<Flow, String?, QQueryOperations> ownerProperty() {
    return addPropertyNameInternal('owner');
  }

  QueryBuilder<Flow, int?, QQueryOperations> timeCreatedProperty() {
    return addPropertyNameInternal('timeCreated');
  }

  QueryBuilder<Flow, String?, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<Flow, String, QQueryOperations> uuidProperty() {
    return addPropertyNameInternal('uuid');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetMessageCollection on Isar {
  IsarCollection<Message> get messages => getCollection();
}

const MessageSchema = CollectionSchema(
  name: 'Message',
  schema:
      '{"name":"Message","idName":"id","properties":[{"name":"editedStatus","type":"Bool"},{"name":"editedTime","type":"Long"},{"name":"emoji","type":"String"},{"name":"fileAudio","type":"String"},{"name":"fileDocument","type":"String"},{"name":"filePicture","type":"String"},{"name":"fileVideo","type":"String"},{"name":"text","type":"String"},{"name":"time","type":"Long"},{"name":"uuid","type":"String"}],"indexes":[{"name":"text","unique":false,"properties":[{"name":"text","type":"Hash","caseSensitive":true}]},{"name":"uuid","unique":true,"properties":[{"name":"uuid","type":"Hash","caseSensitive":true}]}],"links":[{"name":"messageLinkedFlow","target":"Flow"},{"name":"messageLinkedUser","target":"UserConfig"}]}',
  idName: 'id',
  propertyIds: {
    'editedStatus': 0,
    'editedTime': 1,
    'emoji': 2,
    'fileAudio': 3,
    'fileDocument': 4,
    'filePicture': 5,
    'fileVideo': 6,
    'text': 7,
    'time': 8,
    'uuid': 9
  },
  listProperties: {},
  indexIds: {'text': 0, 'uuid': 1},
  indexValueTypes: {
    'text': [
      IndexValueType.stringHash,
    ],
    'uuid': [
      IndexValueType.stringHash,
    ]
  },
  linkIds: {'messageLinkedFlow': 0, 'messageLinkedUser': 1},
  backlinkLinkNames: {},
  getId: _messageGetId,
  setId: _messageSetId,
  getLinks: _messageGetLinks,
  attachLinks: _messageAttachLinks,
  serializeNative: _messageSerializeNative,
  deserializeNative: _messageDeserializeNative,
  deserializePropNative: _messageDeserializePropNative,
  serializeWeb: _messageSerializeWeb,
  deserializeWeb: _messageDeserializeWeb,
  deserializePropWeb: _messageDeserializePropWeb,
  version: 3,
);

int? _messageGetId(Message object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _messageSetId(Message object, int id) {
  object.id = id;
}

List<IsarLinkBase> _messageGetLinks(Message object) {
  return [object.messageLinkedFlow, object.messageLinkedUser];
}

void _messageSerializeNative(
    IsarCollection<Message> collection,
    IsarRawObject rawObj,
    Message object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.editedStatus;
  final _editedStatus = value0;
  final value1 = object.editedTime;
  final _editedTime = value1;
  final value2 = object.emoji;
  IsarUint8List? _emoji;
  if (value2 != null) {
    _emoji = IsarBinaryWriter.utf8Encoder.convert(value2);
  }
  dynamicSize += (_emoji?.length ?? 0) as int;
  final value3 = object.fileAudio;
  IsarUint8List? _fileAudio;
  if (value3 != null) {
    _fileAudio = IsarBinaryWriter.utf8Encoder.convert(value3);
  }
  dynamicSize += (_fileAudio?.length ?? 0) as int;
  final value4 = object.fileDocument;
  IsarUint8List? _fileDocument;
  if (value4 != null) {
    _fileDocument = IsarBinaryWriter.utf8Encoder.convert(value4);
  }
  dynamicSize += (_fileDocument?.length ?? 0) as int;
  final value5 = object.filePicture;
  IsarUint8List? _filePicture;
  if (value5 != null) {
    _filePicture = IsarBinaryWriter.utf8Encoder.convert(value5);
  }
  dynamicSize += (_filePicture?.length ?? 0) as int;
  final value6 = object.fileVideo;
  IsarUint8List? _fileVideo;
  if (value6 != null) {
    _fileVideo = IsarBinaryWriter.utf8Encoder.convert(value6);
  }
  dynamicSize += (_fileVideo?.length ?? 0) as int;
  final value7 = object.text;
  IsarUint8List? _text;
  if (value7 != null) {
    _text = IsarBinaryWriter.utf8Encoder.convert(value7);
  }
  dynamicSize += (_text?.length ?? 0) as int;
  final value8 = object.time;
  final _time = value8;
  final value9 = object.uuid;
  final _uuid = IsarBinaryWriter.utf8Encoder.convert(value9);
  dynamicSize += (_uuid.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBool(offsets[0], _editedStatus);
  writer.writeLong(offsets[1], _editedTime);
  writer.writeBytes(offsets[2], _emoji);
  writer.writeBytes(offsets[3], _fileAudio);
  writer.writeBytes(offsets[4], _fileDocument);
  writer.writeBytes(offsets[5], _filePicture);
  writer.writeBytes(offsets[6], _fileVideo);
  writer.writeBytes(offsets[7], _text);
  writer.writeLong(offsets[8], _time);
  writer.writeBytes(offsets[9], _uuid);
}

Message _messageDeserializeNative(IsarCollection<Message> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Message();
  object.editedStatus = reader.readBool(offsets[0]);
  object.editedTime = reader.readLongOrNull(offsets[1]);
  object.emoji = reader.readStringOrNull(offsets[2]);
  object.fileAudio = reader.readStringOrNull(offsets[3]);
  object.fileDocument = reader.readStringOrNull(offsets[4]);
  object.filePicture = reader.readStringOrNull(offsets[5]);
  object.fileVideo = reader.readStringOrNull(offsets[6]);
  object.id = id;
  object.text = reader.readStringOrNull(offsets[7]);
  object.time = reader.readLongOrNull(offsets[8]);
  object.uuid = reader.readString(offsets[9]);
  _messageAttachLinks(collection, id, object);
  return object;
}

P _messageDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readLongOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _messageSerializeWeb(
    IsarCollection<Message> collection, Message object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'editedStatus', object.editedStatus);
  IsarNative.jsObjectSet(jsObj, 'editedTime', object.editedTime);
  IsarNative.jsObjectSet(jsObj, 'emoji', object.emoji);
  IsarNative.jsObjectSet(jsObj, 'fileAudio', object.fileAudio);
  IsarNative.jsObjectSet(jsObj, 'fileDocument', object.fileDocument);
  IsarNative.jsObjectSet(jsObj, 'filePicture', object.filePicture);
  IsarNative.jsObjectSet(jsObj, 'fileVideo', object.fileVideo);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'text', object.text);
  IsarNative.jsObjectSet(jsObj, 'time', object.time);
  IsarNative.jsObjectSet(jsObj, 'uuid', object.uuid);
  return jsObj;
}

Message _messageDeserializeWeb(
    IsarCollection<Message> collection, dynamic jsObj) {
  final object = Message();
  object.editedStatus = IsarNative.jsObjectGet(jsObj, 'editedStatus') ?? false;
  object.editedTime = IsarNative.jsObjectGet(jsObj, 'editedTime');
  object.emoji = IsarNative.jsObjectGet(jsObj, 'emoji');
  object.fileAudio = IsarNative.jsObjectGet(jsObj, 'fileAudio');
  object.fileDocument = IsarNative.jsObjectGet(jsObj, 'fileDocument');
  object.filePicture = IsarNative.jsObjectGet(jsObj, 'filePicture');
  object.fileVideo = IsarNative.jsObjectGet(jsObj, 'fileVideo');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.text = IsarNative.jsObjectGet(jsObj, 'text');
  object.time = IsarNative.jsObjectGet(jsObj, 'time');
  object.uuid = IsarNative.jsObjectGet(jsObj, 'uuid') ?? '';
  _messageAttachLinks(collection,
      IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity, object);
  return object;
}

P _messageDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'editedStatus':
      return (IsarNative.jsObjectGet(jsObj, 'editedStatus') ?? false) as P;
    case 'editedTime':
      return (IsarNative.jsObjectGet(jsObj, 'editedTime')) as P;
    case 'emoji':
      return (IsarNative.jsObjectGet(jsObj, 'emoji')) as P;
    case 'fileAudio':
      return (IsarNative.jsObjectGet(jsObj, 'fileAudio')) as P;
    case 'fileDocument':
      return (IsarNative.jsObjectGet(jsObj, 'fileDocument')) as P;
    case 'filePicture':
      return (IsarNative.jsObjectGet(jsObj, 'filePicture')) as P;
    case 'fileVideo':
      return (IsarNative.jsObjectGet(jsObj, 'fileVideo')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'text':
      return (IsarNative.jsObjectGet(jsObj, 'text')) as P;
    case 'time':
      return (IsarNative.jsObjectGet(jsObj, 'time')) as P;
    case 'uuid':
      return (IsarNative.jsObjectGet(jsObj, 'uuid') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _messageAttachLinks(IsarCollection col, int id, Message object) {
  object.messageLinkedFlow.attach(col, col.isar.flows, 'messageLinkedFlow', id);
  object.messageLinkedUser
      .attach(col, col.isar.userConfigs, 'messageLinkedUser', id);
}

extension MessageByIndex on IsarCollection<Message> {
  Future<Message?> getByUuid(String uuid) {
    return getByIndex('uuid', [uuid]);
  }

  Message? getByUuidSync(String uuid) {
    return getByIndexSync('uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex('uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync('uuid', [uuid]);
  }

  Future<List<Message?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex('uuid', values);
  }

  List<Message?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync('uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex('uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync('uuid', values);
  }
}

extension MessageQueryWhereSort on QueryBuilder<Message, Message, QWhere> {
  QueryBuilder<Message, Message, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }

  QueryBuilder<Message, Message, QAfterWhere> anyText() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'text'));
  }

  QueryBuilder<Message, Message, QAfterWhere> anyUuid() {
    return addWhereClauseInternal(
        const IndexWhereClause.any(indexName: 'uuid'));
  }
}

extension MessageQueryWhere on QueryBuilder<Message, Message, QWhereClause> {
  QueryBuilder<Message, Message, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Message, Message, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Message, Message, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Message, Message, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Message, Message, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Message, Message, QAfterWhereClause> textEqualTo(String? text) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'text',
      value: [text],
    ));
  }

  QueryBuilder<Message, Message, QAfterWhereClause> textNotEqualTo(
      String? text) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'text',
        upper: [text],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'text',
        lower: [text],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'text',
        lower: [text],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'text',
        upper: [text],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Message, Message, QAfterWhereClause> textIsNull() {
    return addWhereClauseInternal(const IndexWhereClause.equalTo(
      indexName: 'text',
      value: [null],
    ));
  }

  QueryBuilder<Message, Message, QAfterWhereClause> textIsNotNull() {
    return addWhereClauseInternal(const IndexWhereClause.greaterThan(
      indexName: 'text',
      lower: [null],
      includeLower: false,
    ));
  }

  QueryBuilder<Message, Message, QAfterWhereClause> uuidEqualTo(String uuid) {
    return addWhereClauseInternal(IndexWhereClause.equalTo(
      indexName: 'uuid',
      value: [uuid],
    ));
  }

  QueryBuilder<Message, Message, QAfterWhereClause> uuidNotEqualTo(
      String uuid) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uuid',
        upper: [uuid],
        includeUpper: false,
      )).addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uuid',
        lower: [uuid],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(IndexWhereClause.greaterThan(
        indexName: 'uuid',
        lower: [uuid],
        includeLower: false,
      )).addWhereClauseInternal(IndexWhereClause.lessThan(
        indexName: 'uuid',
        upper: [uuid],
        includeUpper: false,
      ));
    }
  }
}

extension MessageQueryFilter
    on QueryBuilder<Message, Message, QFilterCondition> {
  QueryBuilder<Message, Message, QAfterFilterCondition> editedStatusEqualTo(
      bool value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'editedStatus',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> editedTimeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'editedTime',
      value: null,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> editedTimeEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'editedTime',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> editedTimeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'editedTime',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> editedTimeLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'editedTime',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> editedTimeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'editedTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> emojiIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'emoji',
      value: null,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> emojiEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> emojiGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> emojiLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> emojiBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'emoji',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> emojiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> emojiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> emojiContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> emojiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'emoji',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileAudioIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'fileAudio',
      value: null,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileAudioEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fileAudio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileAudioGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fileAudio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileAudioLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fileAudio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileAudioBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fileAudio',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileAudioStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fileAudio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileAudioEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fileAudio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileAudioContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileAudio',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileAudioMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileAudio',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileDocumentIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'fileDocument',
      value: null,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileDocumentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fileDocument',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileDocumentGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fileDocument',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileDocumentLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fileDocument',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileDocumentBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fileDocument',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileDocumentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fileDocument',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileDocumentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fileDocument',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileDocumentContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileDocument',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileDocumentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileDocument',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> filePictureIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'filePicture',
      value: null,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> filePictureEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'filePicture',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> filePictureGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'filePicture',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> filePictureLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'filePicture',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> filePictureBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'filePicture',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> filePictureStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'filePicture',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> filePictureEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'filePicture',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> filePictureContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'filePicture',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> filePictureMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'filePicture',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileVideoIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'fileVideo',
      value: null,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileVideoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'fileVideo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileVideoGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'fileVideo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileVideoLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'fileVideo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileVideoBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'fileVideo',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileVideoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'fileVideo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileVideoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'fileVideo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileVideoContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'fileVideo',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> fileVideoMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'fileVideo',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> textIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'text',
      value: null,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> textEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> textGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> textLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> textBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'text',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> textContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'text',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> textMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'text',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> timeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'time',
      value: null,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> timeEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> timeGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> timeLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> timeBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'time',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> uuidLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'uuid',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'uuid',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'uuid',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension MessageQueryLinks
    on QueryBuilder<Message, Message, QFilterCondition> {
  QueryBuilder<Message, Message, QAfterFilterCondition> messageLinkedFlow(
      FilterQuery<Flow> q) {
    return linkInternal(
      isar.flows,
      q,
      'messageLinkedFlow',
    );
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> messageLinkedUser(
      FilterQuery<UserConfig> q) {
    return linkInternal(
      isar.userConfigs,
      q,
      'messageLinkedUser',
    );
  }
}

extension MessageQueryWhereSortBy on QueryBuilder<Message, Message, QSortBy> {
  QueryBuilder<Message, Message, QAfterSortBy> sortByEditedStatus() {
    return addSortByInternal('editedStatus', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByEditedStatusDesc() {
    return addSortByInternal('editedStatus', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByEditedTime() {
    return addSortByInternal('editedTime', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByEditedTimeDesc() {
    return addSortByInternal('editedTime', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByEmoji() {
    return addSortByInternal('emoji', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByEmojiDesc() {
    return addSortByInternal('emoji', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByFileAudio() {
    return addSortByInternal('fileAudio', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByFileAudioDesc() {
    return addSortByInternal('fileAudio', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByFileDocument() {
    return addSortByInternal('fileDocument', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByFileDocumentDesc() {
    return addSortByInternal('fileDocument', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByFilePicture() {
    return addSortByInternal('filePicture', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByFilePictureDesc() {
    return addSortByInternal('filePicture', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByFileVideo() {
    return addSortByInternal('fileVideo', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByFileVideoDesc() {
    return addSortByInternal('fileVideo', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByText() {
    return addSortByInternal('text', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByTextDesc() {
    return addSortByInternal('text', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByUuid() {
    return addSortByInternal('uuid', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> sortByUuidDesc() {
    return addSortByInternal('uuid', Sort.desc);
  }
}

extension MessageQueryWhereSortThenBy
    on QueryBuilder<Message, Message, QSortThenBy> {
  QueryBuilder<Message, Message, QAfterSortBy> thenByEditedStatus() {
    return addSortByInternal('editedStatus', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByEditedStatusDesc() {
    return addSortByInternal('editedStatus', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByEditedTime() {
    return addSortByInternal('editedTime', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByEditedTimeDesc() {
    return addSortByInternal('editedTime', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByEmoji() {
    return addSortByInternal('emoji', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByEmojiDesc() {
    return addSortByInternal('emoji', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByFileAudio() {
    return addSortByInternal('fileAudio', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByFileAudioDesc() {
    return addSortByInternal('fileAudio', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByFileDocument() {
    return addSortByInternal('fileDocument', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByFileDocumentDesc() {
    return addSortByInternal('fileDocument', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByFilePicture() {
    return addSortByInternal('filePicture', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByFilePictureDesc() {
    return addSortByInternal('filePicture', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByFileVideo() {
    return addSortByInternal('fileVideo', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByFileVideoDesc() {
    return addSortByInternal('fileVideo', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByText() {
    return addSortByInternal('text', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByTextDesc() {
    return addSortByInternal('text', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByTime() {
    return addSortByInternal('time', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByTimeDesc() {
    return addSortByInternal('time', Sort.desc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByUuid() {
    return addSortByInternal('uuid', Sort.asc);
  }

  QueryBuilder<Message, Message, QAfterSortBy> thenByUuidDesc() {
    return addSortByInternal('uuid', Sort.desc);
  }
}

extension MessageQueryWhereDistinct
    on QueryBuilder<Message, Message, QDistinct> {
  QueryBuilder<Message, Message, QDistinct> distinctByEditedStatus() {
    return addDistinctByInternal('editedStatus');
  }

  QueryBuilder<Message, Message, QDistinct> distinctByEditedTime() {
    return addDistinctByInternal('editedTime');
  }

  QueryBuilder<Message, Message, QDistinct> distinctByEmoji(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('emoji', caseSensitive: caseSensitive);
  }

  QueryBuilder<Message, Message, QDistinct> distinctByFileAudio(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileAudio', caseSensitive: caseSensitive);
  }

  QueryBuilder<Message, Message, QDistinct> distinctByFileDocument(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileDocument', caseSensitive: caseSensitive);
  }

  QueryBuilder<Message, Message, QDistinct> distinctByFilePicture(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('filePicture', caseSensitive: caseSensitive);
  }

  QueryBuilder<Message, Message, QDistinct> distinctByFileVideo(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('fileVideo', caseSensitive: caseSensitive);
  }

  QueryBuilder<Message, Message, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Message, Message, QDistinct> distinctByText(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('text', caseSensitive: caseSensitive);
  }

  QueryBuilder<Message, Message, QDistinct> distinctByTime() {
    return addDistinctByInternal('time');
  }

  QueryBuilder<Message, Message, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('uuid', caseSensitive: caseSensitive);
  }
}

extension MessageQueryProperty
    on QueryBuilder<Message, Message, QQueryProperty> {
  QueryBuilder<Message, bool, QQueryOperations> editedStatusProperty() {
    return addPropertyNameInternal('editedStatus');
  }

  QueryBuilder<Message, int?, QQueryOperations> editedTimeProperty() {
    return addPropertyNameInternal('editedTime');
  }

  QueryBuilder<Message, String?, QQueryOperations> emojiProperty() {
    return addPropertyNameInternal('emoji');
  }

  QueryBuilder<Message, String?, QQueryOperations> fileAudioProperty() {
    return addPropertyNameInternal('fileAudio');
  }

  QueryBuilder<Message, String?, QQueryOperations> fileDocumentProperty() {
    return addPropertyNameInternal('fileDocument');
  }

  QueryBuilder<Message, String?, QQueryOperations> filePictureProperty() {
    return addPropertyNameInternal('filePicture');
  }

  QueryBuilder<Message, String?, QQueryOperations> fileVideoProperty() {
    return addPropertyNameInternal('fileVideo');
  }

  QueryBuilder<Message, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Message, String?, QQueryOperations> textProperty() {
    return addPropertyNameInternal('text');
  }

  QueryBuilder<Message, int?, QQueryOperations> timeProperty() {
    return addPropertyNameInternal('time');
  }

  QueryBuilder<Message, String, QQueryOperations> uuidProperty() {
    return addPropertyNameInternal('uuid');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetApplicationSettingCollection on Isar {
  IsarCollection<ApplicationSetting> get applicationSettings => getCollection();
}

const ApplicationSettingSchema = CollectionSchema(
  name: 'ApplicationSetting',
  schema:
      '{"name":"ApplicationSetting","idName":"id","properties":[{"name":"appMode","type":"String"},{"name":"theme","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'appMode': 0, 'theme': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _applicationSettingGetId,
  setId: _applicationSettingSetId,
  getLinks: _applicationSettingGetLinks,
  attachLinks: _applicationSettingAttachLinks,
  serializeNative: _applicationSettingSerializeNative,
  deserializeNative: _applicationSettingDeserializeNative,
  deserializePropNative: _applicationSettingDeserializePropNative,
  serializeWeb: _applicationSettingSerializeWeb,
  deserializeWeb: _applicationSettingDeserializeWeb,
  deserializePropWeb: _applicationSettingDeserializePropWeb,
  version: 3,
);

int? _applicationSettingGetId(ApplicationSetting object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _applicationSettingSetId(ApplicationSetting object, int id) {
  object.id = id;
}

List<IsarLinkBase> _applicationSettingGetLinks(ApplicationSetting object) {
  return [];
}

void _applicationSettingSerializeNative(
    IsarCollection<ApplicationSetting> collection,
    IsarRawObject rawObj,
    ApplicationSetting object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.appMode;
  IsarUint8List? _appMode;
  if (value0 != null) {
    _appMode = IsarBinaryWriter.utf8Encoder.convert(value0);
  }
  dynamicSize += (_appMode?.length ?? 0) as int;
  final value1 = object.theme;
  IsarUint8List? _theme;
  if (value1 != null) {
    _theme = IsarBinaryWriter.utf8Encoder.convert(value1);
  }
  dynamicSize += (_theme?.length ?? 0) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _appMode);
  writer.writeBytes(offsets[1], _theme);
}

ApplicationSetting _applicationSettingDeserializeNative(
    IsarCollection<ApplicationSetting> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = ApplicationSetting();
  object.appMode = reader.readStringOrNull(offsets[0]);
  object.id = id;
  object.theme = reader.readStringOrNull(offsets[1]);
  return object;
}

P _applicationSettingDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _applicationSettingSerializeWeb(
    IsarCollection<ApplicationSetting> collection, ApplicationSetting object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'appMode', object.appMode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'theme', object.theme);
  return jsObj;
}

ApplicationSetting _applicationSettingDeserializeWeb(
    IsarCollection<ApplicationSetting> collection, dynamic jsObj) {
  final object = ApplicationSetting();
  object.appMode = IsarNative.jsObjectGet(jsObj, 'appMode');
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  object.theme = IsarNative.jsObjectGet(jsObj, 'theme');
  return object;
}

P _applicationSettingDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'appMode':
      return (IsarNative.jsObjectGet(jsObj, 'appMode')) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'theme':
      return (IsarNative.jsObjectGet(jsObj, 'theme')) as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _applicationSettingAttachLinks(
    IsarCollection col, int id, ApplicationSetting object) {}

extension ApplicationSettingQueryWhereSort
    on QueryBuilder<ApplicationSetting, ApplicationSetting, QWhere> {
  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension ApplicationSettingQueryWhere
    on QueryBuilder<ApplicationSetting, ApplicationSetting, QWhereClause> {
  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterWhereClause>
      idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterWhereClause>
      idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterWhereClause>
      idGreaterThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterWhereClause>
      idLessThan(int id, {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterWhereClause>
      idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension ApplicationSettingQueryFilter
    on QueryBuilder<ApplicationSetting, ApplicationSetting, QFilterCondition> {
  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      appModeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'appMode',
      value: null,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      appModeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'appMode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      appModeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'appMode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      appModeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'appMode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      appModeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'appMode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      appModeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'appMode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      appModeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'appMode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      appModeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'appMode',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      appModeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'appMode',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      themeIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'theme',
      value: null,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      themeEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'theme',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      themeGreaterThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'theme',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      themeLessThan(
    String? value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'theme',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      themeBetween(
    String? lower,
    String? upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'theme',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      themeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'theme',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      themeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'theme',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      themeContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'theme',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterFilterCondition>
      themeMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'theme',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension ApplicationSettingQueryLinks
    on QueryBuilder<ApplicationSetting, ApplicationSetting, QFilterCondition> {}

extension ApplicationSettingQueryWhereSortBy
    on QueryBuilder<ApplicationSetting, ApplicationSetting, QSortBy> {
  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      sortByAppMode() {
    return addSortByInternal('appMode', Sort.asc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      sortByAppModeDesc() {
    return addSortByInternal('appMode', Sort.desc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      sortByTheme() {
    return addSortByInternal('theme', Sort.asc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      sortByThemeDesc() {
    return addSortByInternal('theme', Sort.desc);
  }
}

extension ApplicationSettingQueryWhereSortThenBy
    on QueryBuilder<ApplicationSetting, ApplicationSetting, QSortThenBy> {
  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      thenByAppMode() {
    return addSortByInternal('appMode', Sort.asc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      thenByAppModeDesc() {
    return addSortByInternal('appMode', Sort.desc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      thenByTheme() {
    return addSortByInternal('theme', Sort.asc);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QAfterSortBy>
      thenByThemeDesc() {
    return addSortByInternal('theme', Sort.desc);
  }
}

extension ApplicationSettingQueryWhereDistinct
    on QueryBuilder<ApplicationSetting, ApplicationSetting, QDistinct> {
  QueryBuilder<ApplicationSetting, ApplicationSetting, QDistinct>
      distinctByAppMode({bool caseSensitive = true}) {
    return addDistinctByInternal('appMode', caseSensitive: caseSensitive);
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QDistinct>
      distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<ApplicationSetting, ApplicationSetting, QDistinct>
      distinctByTheme({bool caseSensitive = true}) {
    return addDistinctByInternal('theme', caseSensitive: caseSensitive);
  }
}

extension ApplicationSettingQueryProperty
    on QueryBuilder<ApplicationSetting, ApplicationSetting, QQueryProperty> {
  QueryBuilder<ApplicationSetting, String?, QQueryOperations>
      appModeProperty() {
    return addPropertyNameInternal('appMode');
  }

  QueryBuilder<ApplicationSetting, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<ApplicationSetting, String?, QQueryOperations> themeProperty() {
    return addPropertyNameInternal('theme');
  }
}
