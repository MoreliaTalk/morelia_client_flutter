// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetUserConfigCollection on Isar {
  IsarCollection<UserConfig> get userConfigs {
    return getCollection('UserConfig');
  }
}

final UserConfigSchema = CollectionSchema(
  name: 'UserConfig',
  schema:
      '{"name":"UserConfig","idName":"id","properties":[{"name":"authId","type":"String"},{"name":"bio","type":"String"},{"name":"email","type":"String"},{"name":"hashPassword","type":"String"},{"name":"isBot","type":"Bool"},{"name":"login","type":"String"},{"name":"tokenTTL","type":"Long"},{"name":"username","type":"String"},{"name":"uuid","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _UserConfigNativeAdapter(),
  webAdapter: const _UserConfigWebAdapter(),
  idName: 'id',
  propertyIds: {
    'authId': 0,
    'bio': 1,
    'email': 2,
    'hashPassword': 3,
    'isBot': 4,
    'login': 5,
    'tokenTTL': 6,
    'username': 7,
    'uuid': 8
  },
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _UserConfigWebAdapter extends IsarWebTypeAdapter<UserConfig> {
  const _UserConfigWebAdapter();

  @override
  Object serialize(IsarCollection<UserConfig> collection, UserConfig object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'authId', object.authId);
    IsarNative.jsObjectSet(jsObj, 'bio', object.bio);
    IsarNative.jsObjectSet(jsObj, 'email', object.email);
    IsarNative.jsObjectSet(jsObj, 'hashPassword', object.hashPassword);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'isBot', object.isBot);
    IsarNative.jsObjectSet(jsObj, 'login', object.login);
    IsarNative.jsObjectSet(jsObj, 'tokenTTL', object.tokenTTL);
    IsarNative.jsObjectSet(jsObj, 'username', object.username);
    IsarNative.jsObjectSet(jsObj, 'uuid', object.uuid);
    return jsObj;
  }

  @override
  UserConfig deserialize(IsarCollection<UserConfig> collection, dynamic jsObj) {
    final object = UserConfig();
    object.authId = IsarNative.jsObjectGet(jsObj, 'authId') ?? '';
    object.bio = IsarNative.jsObjectGet(jsObj, 'bio') ?? '';
    object.email = IsarNative.jsObjectGet(jsObj, 'email') ?? '';
    object.hashPassword = IsarNative.jsObjectGet(jsObj, 'hashPassword') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.isBot = IsarNative.jsObjectGet(jsObj, 'isBot') ?? false;
    object.login = IsarNative.jsObjectGet(jsObj, 'login') ?? '';
    object.tokenTTL =
        IsarNative.jsObjectGet(jsObj, 'tokenTTL') ?? double.negativeInfinity;
    object.username = IsarNative.jsObjectGet(jsObj, 'username') ?? '';
    object.uuid = IsarNative.jsObjectGet(jsObj, 'uuid') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'authId':
        return (IsarNative.jsObjectGet(jsObj, 'authId') ?? '') as P;
      case 'bio':
        return (IsarNative.jsObjectGet(jsObj, 'bio') ?? '') as P;
      case 'email':
        return (IsarNative.jsObjectGet(jsObj, 'email') ?? '') as P;
      case 'hashPassword':
        return (IsarNative.jsObjectGet(jsObj, 'hashPassword') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'isBot':
        return (IsarNative.jsObjectGet(jsObj, 'isBot') ?? false) as P;
      case 'login':
        return (IsarNative.jsObjectGet(jsObj, 'login') ?? '') as P;
      case 'tokenTTL':
        return (IsarNative.jsObjectGet(jsObj, 'tokenTTL') ??
            double.negativeInfinity) as P;
      case 'username':
        return (IsarNative.jsObjectGet(jsObj, 'username') ?? '') as P;
      case 'uuid':
        return (IsarNative.jsObjectGet(jsObj, 'uuid') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, UserConfig object) {}
}

class _UserConfigNativeAdapter extends IsarNativeTypeAdapter<UserConfig> {
  const _UserConfigNativeAdapter();

  @override
  void serialize(
      IsarCollection<UserConfig> collection,
      IsarRawObject rawObj,
      UserConfig object,
      int staticSize,
      List<int> offsets,
      AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.authId;
    final _authId = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_authId.length) as int;
    final value1 = object.bio;
    final _bio = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_bio.length) as int;
    final value2 = object.email;
    final _email = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_email.length) as int;
    final value3 = object.hashPassword;
    final _hashPassword = IsarBinaryWriter.utf8Encoder.convert(value3);
    dynamicSize += (_hashPassword.length) as int;
    final value4 = object.isBot;
    final _isBot = value4;
    final value5 = object.login;
    final _login = IsarBinaryWriter.utf8Encoder.convert(value5);
    dynamicSize += (_login.length) as int;
    final value6 = object.tokenTTL;
    final _tokenTTL = value6;
    final value7 = object.username;
    final _username = IsarBinaryWriter.utf8Encoder.convert(value7);
    dynamicSize += (_username.length) as int;
    final value8 = object.uuid;
    final _uuid = IsarBinaryWriter.utf8Encoder.convert(value8);
    dynamicSize += (_uuid.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _authId);
    writer.writeBytes(offsets[1], _bio);
    writer.writeBytes(offsets[2], _email);
    writer.writeBytes(offsets[3], _hashPassword);
    writer.writeBool(offsets[4], _isBot);
    writer.writeBytes(offsets[5], _login);
    writer.writeLong(offsets[6], _tokenTTL);
    writer.writeBytes(offsets[7], _username);
    writer.writeBytes(offsets[8], _uuid);
  }

  @override
  UserConfig deserialize(IsarCollection<UserConfig> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = UserConfig();
    object.authId = reader.readString(offsets[0]);
    object.bio = reader.readString(offsets[1]);
    object.email = reader.readString(offsets[2]);
    object.hashPassword = reader.readString(offsets[3]);
    object.id = id;
    object.isBot = reader.readBool(offsets[4]);
    object.login = reader.readString(offsets[5]);
    object.tokenTTL = reader.readLong(offsets[6]);
    object.username = reader.readString(offsets[7]);
    object.uuid = reader.readString(offsets[8]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readString(offset)) as P;
      case 4:
        return (reader.readBool(offset)) as P;
      case 5:
        return (reader.readString(offset)) as P;
      case 6:
        return (reader.readLong(offset)) as P;
      case 7:
        return (reader.readString(offset)) as P;
      case 8:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, UserConfig object) {}
}

extension UserConfigQueryWhereSort
    on QueryBuilder<UserConfig, UserConfig, QWhere> {
  QueryBuilder<UserConfig, UserConfig, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension UserConfigQueryWhere
    on QueryBuilder<UserConfig, UserConfig, QWhereClause> {
  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idNotEqualTo(
      int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension UserConfigQueryFilter
    on QueryBuilder<UserConfig, UserConfig, QFilterCondition> {
  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> authIdEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> bioEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> emailEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> idEqualTo(
      int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> idGreaterThan(
    int? value, {
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
    int? value, {
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
    int? lower,
    int? upper, {
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

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> tokenTTLEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'tokenTTL',
      value: value,
    ));
  }

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition>
      tokenTTLGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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

  QueryBuilder<UserConfig, UserConfig, QAfterFilterCondition> usernameEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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
    on QueryBuilder<UserConfig, UserConfig, QFilterCondition> {}

extension UserConfigQueryWhereSortBy
    on QueryBuilder<UserConfig, UserConfig, QSortBy> {
  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByAuthId() {
    return addSortByInternal('authId', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByAuthIdDesc() {
    return addSortByInternal('authId', Sort.desc);
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

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByLogin() {
    return addSortByInternal('login', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> sortByLoginDesc() {
    return addSortByInternal('login', Sort.desc);
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

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByLogin() {
    return addSortByInternal('login', Sort.asc);
  }

  QueryBuilder<UserConfig, UserConfig, QAfterSortBy> thenByLoginDesc() {
    return addSortByInternal('login', Sort.desc);
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

  QueryBuilder<UserConfig, UserConfig, QDistinct> distinctByLogin(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('login', caseSensitive: caseSensitive);
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
  QueryBuilder<UserConfig, String, QQueryOperations> authIdProperty() {
    return addPropertyNameInternal('authId');
  }

  QueryBuilder<UserConfig, String, QQueryOperations> bioProperty() {
    return addPropertyNameInternal('bio');
  }

  QueryBuilder<UserConfig, String, QQueryOperations> emailProperty() {
    return addPropertyNameInternal('email');
  }

  QueryBuilder<UserConfig, String, QQueryOperations> hashPasswordProperty() {
    return addPropertyNameInternal('hashPassword');
  }

  QueryBuilder<UserConfig, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<UserConfig, bool, QQueryOperations> isBotProperty() {
    return addPropertyNameInternal('isBot');
  }

  QueryBuilder<UserConfig, String, QQueryOperations> loginProperty() {
    return addPropertyNameInternal('login');
  }

  QueryBuilder<UserConfig, int, QQueryOperations> tokenTTLProperty() {
    return addPropertyNameInternal('tokenTTL');
  }

  QueryBuilder<UserConfig, String, QQueryOperations> usernameProperty() {
    return addPropertyNameInternal('username');
  }

  QueryBuilder<UserConfig, String, QQueryOperations> uuidProperty() {
    return addPropertyNameInternal('uuid');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetFlowCollection on Isar {
  IsarCollection<Flow> get flows {
    return getCollection('Flow');
  }
}

final FlowSchema = CollectionSchema(
  name: 'Flow',
  schema:
      '{"name":"Flow","idName":"id","properties":[{"name":"flowType","type":"String"},{"name":"info","type":"String"},{"name":"owner","type":"String"},{"name":"timeCreated","type":"Long"},{"name":"title","type":"String"},{"name":"uuid","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _FlowNativeAdapter(),
  webAdapter: const _FlowWebAdapter(),
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
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _FlowWebAdapter extends IsarWebTypeAdapter<Flow> {
  const _FlowWebAdapter();

  @override
  Object serialize(IsarCollection<Flow> collection, Flow object) {
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

  @override
  Flow deserialize(IsarCollection<Flow> collection, dynamic jsObj) {
    final object = Flow();
    object.flowType = IsarNative.jsObjectGet(jsObj, 'flowType') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.info = IsarNative.jsObjectGet(jsObj, 'info') ?? '';
    object.owner = IsarNative.jsObjectGet(jsObj, 'owner') ?? '';
    object.timeCreated =
        IsarNative.jsObjectGet(jsObj, 'timeCreated') ?? double.negativeInfinity;
    object.title = IsarNative.jsObjectGet(jsObj, 'title') ?? '';
    object.uuid = IsarNative.jsObjectGet(jsObj, 'uuid') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'flowType':
        return (IsarNative.jsObjectGet(jsObj, 'flowType') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'info':
        return (IsarNative.jsObjectGet(jsObj, 'info') ?? '') as P;
      case 'owner':
        return (IsarNative.jsObjectGet(jsObj, 'owner') ?? '') as P;
      case 'timeCreated':
        return (IsarNative.jsObjectGet(jsObj, 'timeCreated') ??
            double.negativeInfinity) as P;
      case 'title':
        return (IsarNative.jsObjectGet(jsObj, 'title') ?? '') as P;
      case 'uuid':
        return (IsarNative.jsObjectGet(jsObj, 'uuid') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Flow object) {}
}

class _FlowNativeAdapter extends IsarNativeTypeAdapter<Flow> {
  const _FlowNativeAdapter();

  @override
  void serialize(IsarCollection<Flow> collection, IsarRawObject rawObj,
      Flow object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.flowType;
    final _flowType = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_flowType.length) as int;
    final value1 = object.info;
    final _info = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_info.length) as int;
    final value2 = object.owner;
    final _owner = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_owner.length) as int;
    final value3 = object.timeCreated;
    final _timeCreated = value3;
    final value4 = object.title;
    final _title = IsarBinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += (_title.length) as int;
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

  @override
  Flow deserialize(IsarCollection<Flow> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Flow();
    object.flowType = reader.readString(offsets[0]);
    object.id = id;
    object.info = reader.readString(offsets[1]);
    object.owner = reader.readString(offsets[2]);
    object.timeCreated = reader.readLong(offsets[3]);
    object.title = reader.readString(offsets[4]);
    object.uuid = reader.readString(offsets[5]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readLong(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      case 5:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Flow object) {}
}

extension FlowQueryWhereSort on QueryBuilder<Flow, Flow, QWhere> {
  QueryBuilder<Flow, Flow, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension FlowQueryWhere on QueryBuilder<Flow, Flow, QWhereClause> {
  QueryBuilder<Flow, Flow, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension FlowQueryFilter on QueryBuilder<Flow, Flow, QFilterCondition> {
  QueryBuilder<Flow, Flow, QAfterFilterCondition> flowTypeEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<Flow, Flow, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> idGreaterThan(
    int? value, {
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
    int? value, {
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
    int? lower,
    int? upper, {
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

  QueryBuilder<Flow, Flow, QAfterFilterCondition> infoEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<Flow, Flow, QAfterFilterCondition> ownerEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<Flow, Flow, QAfterFilterCondition> timeCreatedEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'timeCreated',
      value: value,
    ));
  }

  QueryBuilder<Flow, Flow, QAfterFilterCondition> timeCreatedGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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

  QueryBuilder<Flow, Flow, QAfterFilterCondition> titleEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

extension FlowQueryLinks on QueryBuilder<Flow, Flow, QFilterCondition> {}

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
  QueryBuilder<Flow, String, QQueryOperations> flowTypeProperty() {
    return addPropertyNameInternal('flowType');
  }

  QueryBuilder<Flow, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Flow, String, QQueryOperations> infoProperty() {
    return addPropertyNameInternal('info');
  }

  QueryBuilder<Flow, String, QQueryOperations> ownerProperty() {
    return addPropertyNameInternal('owner');
  }

  QueryBuilder<Flow, int, QQueryOperations> timeCreatedProperty() {
    return addPropertyNameInternal('timeCreated');
  }

  QueryBuilder<Flow, String, QQueryOperations> titleProperty() {
    return addPropertyNameInternal('title');
  }

  QueryBuilder<Flow, String, QQueryOperations> uuidProperty() {
    return addPropertyNameInternal('uuid');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetMessageCollection on Isar {
  IsarCollection<Message> get messages {
    return getCollection('Message');
  }
}

final MessageSchema = CollectionSchema(
  name: 'Message',
  schema:
      '{"name":"Message","idName":"id","properties":[{"name":"editedStatus","type":"Bool"},{"name":"editedTime","type":"Long"},{"name":"text","type":"String"},{"name":"time","type":"Long"},{"name":"uuid","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _MessageNativeAdapter(),
  webAdapter: const _MessageWebAdapter(),
  idName: 'id',
  propertyIds: {
    'editedStatus': 0,
    'editedTime': 1,
    'text': 2,
    'time': 3,
    'uuid': 4
  },
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _MessageWebAdapter extends IsarWebTypeAdapter<Message> {
  const _MessageWebAdapter();

  @override
  Object serialize(IsarCollection<Message> collection, Message object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'editedStatus', object.editedStatus);
    IsarNative.jsObjectSet(jsObj, 'editedTime', object.editedTime);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'text', object.text);
    IsarNative.jsObjectSet(jsObj, 'time', object.time);
    IsarNative.jsObjectSet(jsObj, 'uuid', object.uuid);
    return jsObj;
  }

  @override
  Message deserialize(IsarCollection<Message> collection, dynamic jsObj) {
    final object = Message();
    object.editedStatus =
        IsarNative.jsObjectGet(jsObj, 'editedStatus') ?? false;
    object.editedTime =
        IsarNative.jsObjectGet(jsObj, 'editedTime') ?? double.negativeInfinity;
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.text = IsarNative.jsObjectGet(jsObj, 'text') ?? '';
    object.time =
        IsarNative.jsObjectGet(jsObj, 'time') ?? double.negativeInfinity;
    object.uuid = IsarNative.jsObjectGet(jsObj, 'uuid') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'editedStatus':
        return (IsarNative.jsObjectGet(jsObj, 'editedStatus') ?? false) as P;
      case 'editedTime':
        return (IsarNative.jsObjectGet(jsObj, 'editedTime') ??
            double.negativeInfinity) as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'text':
        return (IsarNative.jsObjectGet(jsObj, 'text') ?? '') as P;
      case 'time':
        return (IsarNative.jsObjectGet(jsObj, 'time') ??
            double.negativeInfinity) as P;
      case 'uuid':
        return (IsarNative.jsObjectGet(jsObj, 'uuid') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Message object) {}
}

class _MessageNativeAdapter extends IsarNativeTypeAdapter<Message> {
  const _MessageNativeAdapter();

  @override
  void serialize(IsarCollection<Message> collection, IsarRawObject rawObj,
      Message object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.editedStatus;
    final _editedStatus = value0;
    final value1 = object.editedTime;
    final _editedTime = value1;
    final value2 = object.text;
    final _text = IsarBinaryWriter.utf8Encoder.convert(value2);
    dynamicSize += (_text.length) as int;
    final value3 = object.time;
    final _time = value3;
    final value4 = object.uuid;
    final _uuid = IsarBinaryWriter.utf8Encoder.convert(value4);
    dynamicSize += (_uuid.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBool(offsets[0], _editedStatus);
    writer.writeLong(offsets[1], _editedTime);
    writer.writeBytes(offsets[2], _text);
    writer.writeLong(offsets[3], _time);
    writer.writeBytes(offsets[4], _uuid);
  }

  @override
  Message deserialize(IsarCollection<Message> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Message();
    object.editedStatus = reader.readBool(offsets[0]);
    object.editedTime = reader.readLong(offsets[1]);
    object.id = id;
    object.text = reader.readString(offsets[2]);
    object.time = reader.readLong(offsets[3]);
    object.uuid = reader.readString(offsets[4]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readBool(offset)) as P;
      case 1:
        return (reader.readLong(offset)) as P;
      case 2:
        return (reader.readString(offset)) as P;
      case 3:
        return (reader.readLong(offset)) as P;
      case 4:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Message object) {}
}

extension MessageQueryWhereSort on QueryBuilder<Message, Message, QWhere> {
  QueryBuilder<Message, Message, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension MessageQueryWhere on QueryBuilder<Message, Message, QWhereClause> {
  QueryBuilder<Message, Message, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Message, Message, QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Message, Message, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Message, Message, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Message, Message, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
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

  QueryBuilder<Message, Message, QAfterFilterCondition> editedTimeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'editedTime',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> editedTimeGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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

  QueryBuilder<Message, Message, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> idGreaterThan(
    int? value, {
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
    int? value, {
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
    int? lower,
    int? upper, {
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

  QueryBuilder<Message, Message, QAfterFilterCondition> textEqualTo(
    String value, {
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
    String value, {
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
    String value, {
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
    String lower,
    String upper, {
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

  QueryBuilder<Message, Message, QAfterFilterCondition> timeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'time',
      value: value,
    ));
  }

  QueryBuilder<Message, Message, QAfterFilterCondition> timeGreaterThan(
    int value, {
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
    int value, {
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
    int lower,
    int upper, {
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
    on QueryBuilder<Message, Message, QFilterCondition> {}

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

  QueryBuilder<Message, int, QQueryOperations> editedTimeProperty() {
    return addPropertyNameInternal('editedTime');
  }

  QueryBuilder<Message, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Message, String, QQueryOperations> textProperty() {
    return addPropertyNameInternal('text');
  }

  QueryBuilder<Message, int, QQueryOperations> timeProperty() {
    return addPropertyNameInternal('time');
  }

  QueryBuilder<Message, String, QQueryOperations> uuidProperty() {
    return addPropertyNameInternal('uuid');
  }
}

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast

extension GetAdminCollection on Isar {
  IsarCollection<Admin> get admins {
    return getCollection('Admin');
  }
}

final AdminSchema = CollectionSchema(
  name: 'Admin',
  schema:
      '{"name":"Admin","idName":"id","properties":[{"name":"hashPassword","type":"String"},{"name":"username","type":"String"}],"indexes":[],"links":[]}',
  nativeAdapter: const _AdminNativeAdapter(),
  webAdapter: const _AdminWebAdapter(),
  idName: 'id',
  propertyIds: {'hashPassword': 0, 'username': 1},
  listProperties: {},
  indexIds: {},
  indexTypes: {},
  linkIds: {},
  backlinkIds: {},
  linkedCollections: [],
  getId: (obj) {
    if (obj.id == Isar.autoIncrement) {
      return null;
    } else {
      return obj.id;
    }
  },
  setId: (obj, id) => obj.id = id,
  getLinks: (obj) => [],
  version: 2,
);

class _AdminWebAdapter extends IsarWebTypeAdapter<Admin> {
  const _AdminWebAdapter();

  @override
  Object serialize(IsarCollection<Admin> collection, Admin object) {
    final jsObj = IsarNative.newJsObject();
    IsarNative.jsObjectSet(jsObj, 'hashPassword', object.hashPassword);
    IsarNative.jsObjectSet(jsObj, 'id', object.id);
    IsarNative.jsObjectSet(jsObj, 'username', object.username);
    return jsObj;
  }

  @override
  Admin deserialize(IsarCollection<Admin> collection, dynamic jsObj) {
    final object = Admin();
    object.hashPassword = IsarNative.jsObjectGet(jsObj, 'hashPassword') ?? '';
    object.id = IsarNative.jsObjectGet(jsObj, 'id');
    object.username = IsarNative.jsObjectGet(jsObj, 'username') ?? '';
    return object;
  }

  @override
  P deserializeProperty<P>(Object jsObj, String propertyName) {
    switch (propertyName) {
      case 'hashPassword':
        return (IsarNative.jsObjectGet(jsObj, 'hashPassword') ?? '') as P;
      case 'id':
        return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
      case 'username':
        return (IsarNative.jsObjectGet(jsObj, 'username') ?? '') as P;
      default:
        throw 'Illegal propertyName';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Admin object) {}
}

class _AdminNativeAdapter extends IsarNativeTypeAdapter<Admin> {
  const _AdminNativeAdapter();

  @override
  void serialize(IsarCollection<Admin> collection, IsarRawObject rawObj,
      Admin object, int staticSize, List<int> offsets, AdapterAlloc alloc) {
    var dynamicSize = 0;
    final value0 = object.hashPassword;
    final _hashPassword = IsarBinaryWriter.utf8Encoder.convert(value0);
    dynamicSize += (_hashPassword.length) as int;
    final value1 = object.username;
    final _username = IsarBinaryWriter.utf8Encoder.convert(value1);
    dynamicSize += (_username.length) as int;
    final size = staticSize + dynamicSize;

    rawObj.buffer = alloc(size);
    rawObj.buffer_length = size;
    final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
    final writer = IsarBinaryWriter(buffer, staticSize);
    writer.writeBytes(offsets[0], _hashPassword);
    writer.writeBytes(offsets[1], _username);
  }

  @override
  Admin deserialize(IsarCollection<Admin> collection, int id,
      IsarBinaryReader reader, List<int> offsets) {
    final object = Admin();
    object.hashPassword = reader.readString(offsets[0]);
    object.id = id;
    object.username = reader.readString(offsets[1]);
    return object;
  }

  @override
  P deserializeProperty<P>(
      int id, IsarBinaryReader reader, int propertyIndex, int offset) {
    switch (propertyIndex) {
      case -1:
        return id as P;
      case 0:
        return (reader.readString(offset)) as P;
      case 1:
        return (reader.readString(offset)) as P;
      default:
        throw 'Illegal propertyIndex';
    }
  }

  @override
  void attachLinks(Isar isar, int id, Admin object) {}
}

extension AdminQueryWhereSort on QueryBuilder<Admin, Admin, QWhere> {
  QueryBuilder<Admin, Admin, QAfterWhere> anyId() {
    return addWhereClauseInternal(const WhereClause(indexName: null));
  }
}

extension AdminQueryWhere on QueryBuilder<Admin, Admin, QWhereClause> {
  QueryBuilder<Admin, Admin, QAfterWhereClause> idEqualTo(int? id) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: true,
      upper: [id],
      includeUpper: true,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterWhereClause> idNotEqualTo(int? id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      ));
    } else {
      return addWhereClauseInternal(WhereClause(
        indexName: null,
        lower: [id],
        includeLower: false,
      )).addWhereClauseInternal(WhereClause(
        indexName: null,
        upper: [id],
        includeUpper: false,
      ));
    }
  }

  QueryBuilder<Admin, Admin, QAfterWhereClause> idGreaterThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [id],
      includeLower: include,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterWhereClause> idLessThan(
    int? id, {
    bool include = false,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      upper: [id],
      includeUpper: include,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterWhereClause> idBetween(
    int? lowerId,
    int? upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(WhereClause(
      indexName: null,
      lower: [lowerId],
      includeLower: includeLower,
      upper: [upperId],
      includeUpper: includeUpper,
    ));
  }
}

extension AdminQueryFilter on QueryBuilder<Admin, Admin, QFilterCondition> {
  QueryBuilder<Admin, Admin, QAfterFilterCondition> hashPasswordEqualTo(
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> hashPasswordGreaterThan(
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> hashPasswordLessThan(
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> hashPasswordBetween(
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> hashPasswordStartsWith(
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> hashPasswordEndsWith(
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> hashPasswordContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'hashPassword',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterFilterCondition> hashPasswordMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'hashPassword',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterFilterCondition> idEqualTo(int? value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterFilterCondition> idGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterFilterCondition> idLessThan(
    int? value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterFilterCondition> idBetween(
    int? lower,
    int? upper, {
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> usernameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterFilterCondition> usernameGreaterThan(
    String value, {
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> usernameLessThan(
    String value, {
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> usernameBetween(
    String lower,
    String upper, {
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> usernameStartsWith(
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> usernameEndsWith(
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

  QueryBuilder<Admin, Admin, QAfterFilterCondition> usernameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'username',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Admin, Admin, QAfterFilterCondition> usernameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'username',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension AdminQueryLinks on QueryBuilder<Admin, Admin, QFilterCondition> {}

extension AdminQueryWhereSortBy on QueryBuilder<Admin, Admin, QSortBy> {
  QueryBuilder<Admin, Admin, QAfterSortBy> sortByHashPassword() {
    return addSortByInternal('hashPassword', Sort.asc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> sortByHashPasswordDesc() {
    return addSortByInternal('hashPassword', Sort.desc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> sortByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> sortByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }
}

extension AdminQueryWhereSortThenBy on QueryBuilder<Admin, Admin, QSortThenBy> {
  QueryBuilder<Admin, Admin, QAfterSortBy> thenByHashPassword() {
    return addSortByInternal('hashPassword', Sort.asc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> thenByHashPasswordDesc() {
    return addSortByInternal('hashPassword', Sort.desc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> thenByUsername() {
    return addSortByInternal('username', Sort.asc);
  }

  QueryBuilder<Admin, Admin, QAfterSortBy> thenByUsernameDesc() {
    return addSortByInternal('username', Sort.desc);
  }
}

extension AdminQueryWhereDistinct on QueryBuilder<Admin, Admin, QDistinct> {
  QueryBuilder<Admin, Admin, QDistinct> distinctByHashPassword(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('hashPassword', caseSensitive: caseSensitive);
  }

  QueryBuilder<Admin, Admin, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Admin, Admin, QDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('username', caseSensitive: caseSensitive);
  }
}

extension AdminQueryProperty on QueryBuilder<Admin, Admin, QQueryProperty> {
  QueryBuilder<Admin, String, QQueryOperations> hashPasswordProperty() {
    return addPropertyNameInternal('hashPassword');
  }

  QueryBuilder<Admin, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Admin, String, QQueryOperations> usernameProperty() {
    return addPropertyNameInternal('username');
  }
}
