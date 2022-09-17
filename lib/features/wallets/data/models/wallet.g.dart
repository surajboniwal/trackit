// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetWalletCollection on Isar {
  IsarCollection<Wallet> get wallets => getCollection();
}

const WalletSchema = CollectionSchema(
  name: 'Wallet',
  schema:
      '{"name":"Wallet","idName":"id","properties":[{"name":"balance","type":"Long"},{"name":"name","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'balance': 0, 'name': 1},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _walletGetId,
  getLinks: _walletGetLinks,
  attachLinks: _walletAttachLinks,
  serializeNative: _walletSerializeNative,
  deserializeNative: _walletDeserializeNative,
  deserializePropNative: _walletDeserializePropNative,
  serializeWeb: _walletSerializeWeb,
  deserializeWeb: _walletDeserializeWeb,
  deserializePropWeb: _walletDeserializePropWeb,
  version: 3,
);

int? _walletGetId(Wallet object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

List<IsarLinkBase> _walletGetLinks(Wallet object) {
  return [];
}

void _walletSerializeNative(
    IsarCollection<Wallet> collection,
    IsarRawObject rawObj,
    Wallet object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.balance;
  final _balance = value0;
  final value1 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_name.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _balance);
  writer.writeBytes(offsets[1], _name);
}

Wallet _walletDeserializeNative(IsarCollection<Wallet> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Wallet(
    balance: reader.readLong(offsets[0]),
    id: id,
    name: reader.readString(offsets[1]),
  );
  return object;
}

P _walletDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _walletSerializeWeb(IsarCollection<Wallet> collection, Wallet object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'balance', object.balance);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  return jsObj;
}

Wallet _walletDeserializeWeb(IsarCollection<Wallet> collection, dynamic jsObj) {
  final object = Wallet(
    balance:
        IsarNative.jsObjectGet(jsObj, 'balance') ?? double.negativeInfinity,
    id: IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity,
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
  );
  return object;
}

P _walletDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'balance':
      return (IsarNative.jsObjectGet(jsObj, 'balance') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _walletAttachLinks(IsarCollection col, int id, Wallet object) {}

extension WalletQueryWhereSort on QueryBuilder<Wallet, Wallet, QWhere> {
  QueryBuilder<Wallet, Wallet, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension WalletQueryWhere on QueryBuilder<Wallet, Wallet, QWhereClause> {
  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Wallet, Wallet, QAfterWhereClause> idBetween(
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

extension WalletQueryFilter on QueryBuilder<Wallet, Wallet, QFilterCondition> {
  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> balanceEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'balance',
      value: value,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> balanceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'balance',
      value: value,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> balanceLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'balance',
      value: value,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> balanceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'balance',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Wallet, Wallet, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension WalletQueryLinks on QueryBuilder<Wallet, Wallet, QFilterCondition> {}

extension WalletQueryWhereSortBy on QueryBuilder<Wallet, Wallet, QSortBy> {
  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByBalance() {
    return addSortByInternal('balance', Sort.asc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByBalanceDesc() {
    return addSortByInternal('balance', Sort.desc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension WalletQueryWhereSortThenBy
    on QueryBuilder<Wallet, Wallet, QSortThenBy> {
  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByBalance() {
    return addSortByInternal('balance', Sort.asc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByBalanceDesc() {
    return addSortByInternal('balance', Sort.desc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Wallet, Wallet, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension WalletQueryWhereDistinct on QueryBuilder<Wallet, Wallet, QDistinct> {
  QueryBuilder<Wallet, Wallet, QDistinct> distinctByBalance() {
    return addDistinctByInternal('balance');
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Wallet, Wallet, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension WalletQueryProperty on QueryBuilder<Wallet, Wallet, QQueryProperty> {
  QueryBuilder<Wallet, int, QQueryOperations> balanceProperty() {
    return addPropertyNameInternal('balance');
  }

  QueryBuilder<Wallet, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Wallet, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }
}
