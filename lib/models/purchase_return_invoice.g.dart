// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_return_invoice.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPurchaseReturnInvoiceCollection on Isar {
  IsarCollection<PurchaseReturnInvoice> get purchaseReturnInvoices =>
      this.collection();
}

const PurchaseReturnInvoiceSchema = CollectionSchema(
  name: r'PurchaseReturnInvoice',
  id: -6460621403945692476,
  properties: {
    r'returnDate': PropertySchema(
      id: 0,
      name: r'returnDate',
      type: IsarType.dateTime,
    ),
    r'returnType': PropertySchema(
      id: 1,
      name: r'returnType',
      type: IsarType.string,
    ),
    r'returnedItems': PropertySchema(
      id: 2,
      name: r'returnedItems',
      type: IsarType.objectList,
      target: r'PurchaseReturnItem',
    ),
    r'supplierId': PropertySchema(
      id: 3,
      name: r'supplierId',
      type: IsarType.long,
    ),
    r'totalReturnAmount': PropertySchema(
      id: 4,
      name: r'totalReturnAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _purchaseReturnInvoiceEstimateSize,
  serialize: _purchaseReturnInvoiceSerialize,
  deserialize: _purchaseReturnInvoiceDeserialize,
  deserializeProp: _purchaseReturnInvoiceDeserializeProp,
  idName: r'id',
  indexes: {
    r'returnDate': IndexSchema(
      id: 9180662992756784512,
      name: r'returnDate',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'returnDate',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'PurchaseReturnItem': PurchaseReturnItemSchema},
  getId: _purchaseReturnInvoiceGetId,
  getLinks: _purchaseReturnInvoiceGetLinks,
  attach: _purchaseReturnInvoiceAttach,
  version: '3.1.0+1',
);

int _purchaseReturnInvoiceEstimateSize(
  PurchaseReturnInvoice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.returnType.length * 3;
  bytesCount += 3 + object.returnedItems.length * 3;
  {
    final offsets = allOffsets[PurchaseReturnItem]!;
    for (var i = 0; i < object.returnedItems.length; i++) {
      final value = object.returnedItems[i];
      bytesCount +=
          PurchaseReturnItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _purchaseReturnInvoiceSerialize(
  PurchaseReturnInvoice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.returnDate);
  writer.writeString(offsets[1], object.returnType);
  writer.writeObjectList<PurchaseReturnItem>(
    offsets[2],
    allOffsets,
    PurchaseReturnItemSchema.serialize,
    object.returnedItems,
  );
  writer.writeLong(offsets[3], object.supplierId);
  writer.writeDouble(offsets[4], object.totalReturnAmount);
}

PurchaseReturnInvoice _purchaseReturnInvoiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PurchaseReturnInvoice();
  object.id = id;
  object.returnDate = reader.readDateTime(offsets[0]);
  object.returnType = reader.readString(offsets[1]);
  object.returnedItems = reader.readObjectList<PurchaseReturnItem>(
        offsets[2],
        PurchaseReturnItemSchema.deserialize,
        allOffsets,
        PurchaseReturnItem(),
      ) ??
      [];
  object.supplierId = reader.readLongOrNull(offsets[3]);
  object.totalReturnAmount = reader.readDouble(offsets[4]);
  return object;
}

P _purchaseReturnInvoiceDeserializeProp<P>(
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
      return (reader.readObjectList<PurchaseReturnItem>(
            offset,
            PurchaseReturnItemSchema.deserialize,
            allOffsets,
            PurchaseReturnItem(),
          ) ??
          []) as P;
    case 3:
      return (reader.readLongOrNull(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _purchaseReturnInvoiceGetId(PurchaseReturnInvoice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _purchaseReturnInvoiceGetLinks(
    PurchaseReturnInvoice object) {
  return [];
}

void _purchaseReturnInvoiceAttach(
    IsarCollection<dynamic> col, Id id, PurchaseReturnInvoice object) {
  object.id = id;
}

extension PurchaseReturnInvoiceQueryWhereSort
    on QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QWhere> {
  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhere>
      anyReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'returnDate'),
      );
    });
  }
}

extension PurchaseReturnInvoiceQueryWhere on QueryBuilder<PurchaseReturnInvoice,
    PurchaseReturnInvoice, QWhereClause> {
  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
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

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
      returnDateEqualTo(DateTime returnDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'returnDate',
        value: [returnDate],
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
      returnDateNotEqualTo(DateTime returnDate) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'returnDate',
              lower: [],
              upper: [returnDate],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'returnDate',
              lower: [returnDate],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'returnDate',
              lower: [returnDate],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'returnDate',
              lower: [],
              upper: [returnDate],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
      returnDateGreaterThan(
    DateTime returnDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'returnDate',
        lower: [returnDate],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
      returnDateLessThan(
    DateTime returnDate, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'returnDate',
        lower: [],
        upper: [returnDate],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterWhereClause>
      returnDateBetween(
    DateTime lowerReturnDate,
    DateTime upperReturnDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'returnDate',
        lower: [lowerReturnDate],
        includeLower: includeLower,
        upper: [upperReturnDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PurchaseReturnInvoiceQueryFilter on QueryBuilder<
    PurchaseReturnInvoice, PurchaseReturnInvoice, QFilterCondition> {
  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> idLessThan(
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

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> idBetween(
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

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'returnType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'returnType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
          QAfterFilterCondition>
      returnTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'returnType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
          QAfterFilterCondition>
      returnTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'returnType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnType',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'returnType',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnedItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnedItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnedItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnedItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnedItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnedItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnedItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnedItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnedItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnedItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> returnedItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'returnedItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> supplierIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'supplierId',
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> supplierIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'supplierId',
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> supplierIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'supplierId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> supplierIdGreaterThan(
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

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> supplierIdLessThan(
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

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> supplierIdBetween(
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

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> totalReturnAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalReturnAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> totalReturnAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalReturnAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> totalReturnAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalReturnAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
      QAfterFilterCondition> totalReturnAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalReturnAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PurchaseReturnInvoiceQueryObject on QueryBuilder<
    PurchaseReturnInvoice, PurchaseReturnInvoice, QFilterCondition> {
  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice,
          QAfterFilterCondition>
      returnedItemsElement(FilterQuery<PurchaseReturnItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'returnedItems');
    });
  }
}

extension PurchaseReturnInvoiceQueryLinks on QueryBuilder<PurchaseReturnInvoice,
    PurchaseReturnInvoice, QFilterCondition> {}

extension PurchaseReturnInvoiceQuerySortBy
    on QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QSortBy> {
  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      sortByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      sortByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      sortByReturnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnType', Sort.asc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      sortByReturnTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnType', Sort.desc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      sortBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      sortBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      sortByTotalReturnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalReturnAmount', Sort.asc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      sortByTotalReturnAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalReturnAmount', Sort.desc);
    });
  }
}

extension PurchaseReturnInvoiceQuerySortThenBy
    on QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QSortThenBy> {
  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenByReturnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnType', Sort.asc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenByReturnTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnType', Sort.desc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenByTotalReturnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalReturnAmount', Sort.asc);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QAfterSortBy>
      thenByTotalReturnAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalReturnAmount', Sort.desc);
    });
  }
}

extension PurchaseReturnInvoiceQueryWhereDistinct
    on QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QDistinct> {
  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QDistinct>
      distinctByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnDate');
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QDistinct>
      distinctByReturnType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QDistinct>
      distinctBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplierId');
    });
  }

  QueryBuilder<PurchaseReturnInvoice, PurchaseReturnInvoice, QDistinct>
      distinctByTotalReturnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalReturnAmount');
    });
  }
}

extension PurchaseReturnInvoiceQueryProperty on QueryBuilder<
    PurchaseReturnInvoice, PurchaseReturnInvoice, QQueryProperty> {
  QueryBuilder<PurchaseReturnInvoice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<PurchaseReturnInvoice, DateTime, QQueryOperations>
      returnDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnDate');
    });
  }

  QueryBuilder<PurchaseReturnInvoice, String, QQueryOperations>
      returnTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnType');
    });
  }

  QueryBuilder<PurchaseReturnInvoice, List<PurchaseReturnItem>,
      QQueryOperations> returnedItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnedItems');
    });
  }

  QueryBuilder<PurchaseReturnInvoice, int?, QQueryOperations>
      supplierIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplierId');
    });
  }

  QueryBuilder<PurchaseReturnInvoice, double, QQueryOperations>
      totalReturnAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalReturnAmount');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const PurchaseReturnItemSchema = Schema(
  name: r'PurchaseReturnItem',
  id: -935087395396283568,
  properties: {
    r'batchId': PropertySchema(
      id: 0,
      name: r'batchId',
      type: IsarType.long,
    ),
    r'productId': PropertySchema(
      id: 1,
      name: r'productId',
      type: IsarType.long,
    ),
    r'productName': PropertySchema(
      id: 2,
      name: r'productName',
      type: IsarType.string,
    ),
    r'quantityReturned': PropertySchema(
      id: 3,
      name: r'quantityReturned',
      type: IsarType.long,
    ),
    r'returnPrice': PropertySchema(
      id: 4,
      name: r'returnPrice',
      type: IsarType.double,
    )
  },
  estimateSize: _purchaseReturnItemEstimateSize,
  serialize: _purchaseReturnItemSerialize,
  deserialize: _purchaseReturnItemDeserialize,
  deserializeProp: _purchaseReturnItemDeserializeProp,
);

int _purchaseReturnItemEstimateSize(
  PurchaseReturnItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.productName.length * 3;
  return bytesCount;
}

void _purchaseReturnItemSerialize(
  PurchaseReturnItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.batchId);
  writer.writeLong(offsets[1], object.productId);
  writer.writeString(offsets[2], object.productName);
  writer.writeLong(offsets[3], object.quantityReturned);
  writer.writeDouble(offsets[4], object.returnPrice);
}

PurchaseReturnItem _purchaseReturnItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = PurchaseReturnItem();
  object.batchId = reader.readLongOrNull(offsets[0]);
  object.productId = reader.readLongOrNull(offsets[1]);
  object.productName = reader.readString(offsets[2]);
  object.quantityReturned = reader.readLong(offsets[3]);
  object.returnPrice = reader.readDouble(offsets[4]);
  return object;
}

P _purchaseReturnItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readLongOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension PurchaseReturnItemQueryFilter
    on QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QFilterCondition> {
  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      batchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchId',
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      batchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchId',
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      batchIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      batchIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      batchIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      batchIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      productIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      productIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      productIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
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

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
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

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
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

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
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

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
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

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
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

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
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

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
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

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
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

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      productNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      productNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      quantityReturnedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityReturned',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      quantityReturnedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantityReturned',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      quantityReturnedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantityReturned',
        value: value,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      quantityReturnedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantityReturned',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      returnPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      returnPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'returnPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      returnPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'returnPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QAfterFilterCondition>
      returnPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'returnPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension PurchaseReturnItemQueryObject
    on QueryBuilder<PurchaseReturnItem, PurchaseReturnItem, QFilterCondition> {}
