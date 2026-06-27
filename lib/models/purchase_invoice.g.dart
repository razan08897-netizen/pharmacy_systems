// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_invoice.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPurchaseInvoiceCollection on Isar {
  IsarCollection<PurchaseInvoice> get purchaseInvoices => this.collection();
}

const PurchaseInvoiceSchema = CollectionSchema(
  name: r'PurchaseInvoice',
  id: -7433570411899223814,
  properties: {
    r'purchaseDate': PropertySchema(
      id: 0,
      name: r'purchaseDate',
      type: IsarType.dateTime,
    ),
    r'purchaseType': PropertySchema(
      id: 1,
      name: r'purchaseType',
      type: IsarType.string,
    ),
    r'purchasedItems': PropertySchema(
      id: 2,
      name: r'purchasedItems',
      type: IsarType.objectList,
      target: r'PurchaseItem',
    ),
    r'supplierId': PropertySchema(
      id: 3,
      name: r'supplierId',
      type: IsarType.long,
    ),
    r'supplierInvoiceNumber': PropertySchema(
      id: 4,
      name: r'supplierInvoiceNumber',
      type: IsarType.string,
    ),
    r'totalInvoiceAmount': PropertySchema(
      id: 5,
      name: r'totalInvoiceAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _purchaseInvoiceEstimateSize,
  serialize: _purchaseInvoiceSerialize,
  deserialize: _purchaseInvoiceDeserialize,
  deserializeProp: _purchaseInvoiceDeserializeProp,
  idName: r'id',
  indexes: {
    r'supplierInvoiceNumber': IndexSchema(
      id: 5016900934919860783,
      name: r'supplierInvoiceNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'supplierInvoiceNumber',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'PurchaseItem': PurchaseItemSchema},
  getId: _purchaseInvoiceGetId,
  getLinks: _purchaseInvoiceGetLinks,
  attach: _purchaseInvoiceAttach,
  version: '3.1.0+1',
);

int _purchaseInvoiceEstimateSize(
  PurchaseInvoice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.purchaseType.length * 3;
  bytesCount += 3 + object.purchasedItems.length * 3;
  {
    final offsets = allOffsets[PurchaseItem]!;
    for (var i = 0; i < object.purchasedItems.length; i++) {
      final value = object.purchasedItems[i];
      bytesCount += PurchaseItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.supplierInvoiceNumber.length * 3;
  return bytesCount;
}

void _purchaseInvoiceSerialize(
  PurchaseInvoice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.purchaseDate);
  writer.writeString(offsets[1], object.purchaseType);
  writer.writeObjectList<PurchaseItem>(
    offsets[2],
    allOffsets,
    PurchaseItemSchema.serialize,
    object.purchasedItems,
  );
  writer.writeLong(offsets[3], object.supplierId);
  writer.writeString(offsets[4], object.supplierInvoiceNumber);
  writer.writeDouble(offsets[5], object.totalInvoiceAmount);
}

PurchaseInvoice _purchaseInvoiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PurchaseInvoice();
  object.id = id;
  object.purchaseDate = reader.readDateTime(offsets[0]);
  object.purchaseType = reader.readString(offsets[1]);
  object.purchasedItems = reader.readObjectList<PurchaseItem>(
        offsets[2],
        PurchaseItemSchema.deserialize,
        allOffsets,
        PurchaseItem(),
      ) ??
      [];
  object.supplierId = reader.readLongOrNull(offsets[3]);
  object.supplierInvoiceNumber = reader.readString(offsets[4]);
  object.totalInvoiceAmount = reader.readDouble(offsets[5]);
  return object;
}

P _purchaseInvoiceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readObjectList<PurchaseItem>(
            offset,
            PurchaseItemSchema.deserialize,
            allOffsets,
            PurchaseItem(),
          ) ??
          []) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _purchaseInvoiceGetId(PurchaseInvoice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _purchaseInvoiceGetLinks(PurchaseInvoice object) {
  return [];
}

void _purchaseInvoiceAttach(
    IsarCollection<dynamic> col, Id id, PurchaseInvoice object) {
  object.id = id;
}

extension PurchaseInvoiceQueryWhereSort
    on QueryBuilder<PurchaseInvoice, PurchaseInvoice, QWhere> {
  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PurchaseInvoiceQueryWhere
    on QueryBuilder<PurchaseInvoice, PurchaseInvoice, QWhereClause> {
  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterWhereClause>
      supplierInvoiceNumberEqualTo(String supplierInvoiceNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'supplierInvoiceNumber',
        value: [supplierInvoiceNumber],
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterWhereClause>
      supplierInvoiceNumberNotEqualTo(String supplierInvoiceNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierInvoiceNumber',
              lower: [],
              upper: [supplierInvoiceNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierInvoiceNumber',
              lower: [supplierInvoiceNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierInvoiceNumber',
              lower: [supplierInvoiceNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'supplierInvoiceNumber',
              lower: [],
              upper: [supplierInvoiceNumber],
              includeUpper: false,
            ));
      }
    });
  }
}

extension PurchaseInvoiceQueryFilter
    on QueryBuilder<PurchaseInvoice, PurchaseInvoice, QFilterCondition> {
  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchaseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchaseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchaseType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'purchaseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'purchaseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'purchaseType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'purchaseType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchaseType',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchaseTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'purchaseType',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchasedItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchasedItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchasedItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchasedItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchasedItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchasedItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchasedItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchasedItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchasedItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchasedItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchasedItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'purchasedItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supplierId',
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supplierId',
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supplierId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supplierId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supplierId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierInvoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'supplierInvoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'supplierInvoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'supplierInvoiceNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'supplierInvoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'supplierInvoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'supplierInvoiceNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'supplierInvoiceNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierInvoiceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      supplierInvoiceNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'supplierInvoiceNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      totalInvoiceAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalInvoiceAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      totalInvoiceAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalInvoiceAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      totalInvoiceAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalInvoiceAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      totalInvoiceAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalInvoiceAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PurchaseInvoiceQueryObject
    on QueryBuilder<PurchaseInvoice, PurchaseInvoice, QFilterCondition> {
  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterFilterCondition>
      purchasedItemsElement(FilterQuery<PurchaseItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'purchasedItems');
    });
  }
}

extension PurchaseInvoiceQueryLinks
    on QueryBuilder<PurchaseInvoice, PurchaseInvoice, QFilterCondition> {}

extension PurchaseInvoiceQuerySortBy
    on QueryBuilder<PurchaseInvoice, PurchaseInvoice, QSortBy> {
  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortByPurchaseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseType', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortByPurchaseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseType', Sort.desc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortBySupplierInvoiceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierInvoiceNumber', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortBySupplierInvoiceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierInvoiceNumber', Sort.desc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortByTotalInvoiceAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceAmount', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      sortByTotalInvoiceAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceAmount', Sort.desc);
    });
  }
}

extension PurchaseInvoiceQuerySortThenBy
    on QueryBuilder<PurchaseInvoice, PurchaseInvoice, QSortThenBy> {
  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenByPurchaseDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseDate', Sort.desc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenByPurchaseType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseType', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenByPurchaseTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchaseType', Sort.desc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenBySupplierInvoiceNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierInvoiceNumber', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenBySupplierInvoiceNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierInvoiceNumber', Sort.desc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenByTotalInvoiceAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceAmount', Sort.asc);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QAfterSortBy>
      thenByTotalInvoiceAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalInvoiceAmount', Sort.desc);
    });
  }
}

extension PurchaseInvoiceQueryWhereDistinct
    on QueryBuilder<PurchaseInvoice, PurchaseInvoice, QDistinct> {
  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QDistinct>
      distinctByPurchaseDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseDate');
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QDistinct>
      distinctByPurchaseType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchaseType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QDistinct>
      distinctBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplierId');
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QDistinct>
      distinctBySupplierInvoiceNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplierInvoiceNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseInvoice, PurchaseInvoice, QDistinct>
      distinctByTotalInvoiceAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalInvoiceAmount');
    });
  }
}

extension PurchaseInvoiceQueryProperty
    on QueryBuilder<PurchaseInvoice, PurchaseInvoice, QQueryProperty> {
  QueryBuilder<PurchaseInvoice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PurchaseInvoice, DateTime, QQueryOperations>
      purchaseDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseDate');
    });
  }

  QueryBuilder<PurchaseInvoice, String, QQueryOperations>
      purchaseTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchaseType');
    });
  }

  QueryBuilder<PurchaseInvoice, List<PurchaseItem>, QQueryOperations>
      purchasedItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchasedItems');
    });
  }

  QueryBuilder<PurchaseInvoice, int?, QQueryOperations> supplierIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplierId');
    });
  }

  QueryBuilder<PurchaseInvoice, String, QQueryOperations>
      supplierInvoiceNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplierInvoiceNumber');
    });
  }

  QueryBuilder<PurchaseInvoice, double, QQueryOperations>
      totalInvoiceAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalInvoiceAmount');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PurchaseItemSchema = Schema(
  name: r'PurchaseItem',
  id: 5460643161202212317,
  properties: {
    r'bonusQuantity': PropertySchema(
      id: 0,
      name: r'bonusQuantity',
      type: IsarType.long,
    ),
    r'expiryDate': PropertySchema(
      id: 1,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'productId': PropertySchema(
      id: 2,
      name: r'productId',
      type: IsarType.long,
    ),
    r'productName': PropertySchema(
      id: 3,
      name: r'productName',
      type: IsarType.string,
    ),
    r'purchasePrice': PropertySchema(
      id: 4,
      name: r'purchasePrice',
      type: IsarType.double,
    ),
    r'quantityPurchased': PropertySchema(
      id: 5,
      name: r'quantityPurchased',
      type: IsarType.long,
    )
  },
  estimateSize: _purchaseItemEstimateSize,
  serialize: _purchaseItemSerialize,
  deserialize: _purchaseItemDeserialize,
  deserializeProp: _purchaseItemDeserializeProp,
);

int _purchaseItemEstimateSize(
  PurchaseItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.productName.length * 3;
  return bytesCount;
}

void _purchaseItemSerialize(
  PurchaseItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.bonusQuantity);
  writer.writeDateTime(offsets[1], object.expiryDate);
  writer.writeLong(offsets[2], object.productId);
  writer.writeString(offsets[3], object.productName);
  writer.writeDouble(offsets[4], object.purchasePrice);
  writer.writeLong(offsets[5], object.quantityPurchased);
}

PurchaseItem _purchaseItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PurchaseItem();
  object.bonusQuantity = reader.readLong(offsets[0]);
  object.expiryDate = reader.readDateTime(offsets[1]);
  object.productId = reader.readLongOrNull(offsets[2]);
  object.productName = reader.readString(offsets[3]);
  object.purchasePrice = reader.readDouble(offsets[4]);
  object.quantityPurchased = reader.readLong(offsets[5]);
  return object;
}

P _purchaseItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PurchaseItemQueryFilter
    on QueryBuilder<PurchaseItem, PurchaseItem, QFilterCondition> {
  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      bonusQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bonusQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      bonusQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bonusQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      bonusQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bonusQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      bonusQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bonusQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      expiryDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      expiryDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      expiryDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      expiryDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'expiryDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      purchasePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      purchasePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      purchasePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchasePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      purchasePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchasePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      quantityPurchasedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityPurchased',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      quantityPurchasedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityPurchased',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      quantityPurchasedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityPurchased',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseItem, PurchaseItem, QAfterFilterCondition>
      quantityPurchasedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityPurchased',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PurchaseItemQueryObject
    on QueryBuilder<PurchaseItem, PurchaseItem, QFilterCondition> {}
