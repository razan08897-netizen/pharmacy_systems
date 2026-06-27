// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_return_invoice.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSaleReturnInvoiceCollection on Isar {
  IsarCollection<SaleReturnInvoice> get saleReturnInvoices => this.collection();
}

const SaleReturnInvoiceSchema = CollectionSchema(
  name: r'SaleReturnInvoice',
  id: -5288346890649925280,
  properties: {
    r'customerId': PropertySchema(
      id: 0,
      name: r'customerId',
      type: IsarType.long,
    ),
    r'returnDate': PropertySchema(
      id: 1,
      name: r'returnDate',
      type: IsarType.dateTime,
    ),
    r'returnType': PropertySchema(
      id: 2,
      name: r'returnType',
      type: IsarType.string,
    ),
    r'returnedItems': PropertySchema(
      id: 3,
      name: r'returnedItems',
      type: IsarType.objectList,
      target: r'ReturnItem',
    ),
    r'totalReturnAmount': PropertySchema(
      id: 4,
      name: r'totalReturnAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _saleReturnInvoiceEstimateSize,
  serialize: _saleReturnInvoiceSerialize,
  deserialize: _saleReturnInvoiceDeserialize,
  deserializeProp: _saleReturnInvoiceDeserializeProp,
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
  embeddedSchemas: {r'ReturnItem': ReturnItemSchema},
  getId: _saleReturnInvoiceGetId,
  getLinks: _saleReturnInvoiceGetLinks,
  attach: _saleReturnInvoiceAttach,
  version: '3.1.0+1',
);

int _saleReturnInvoiceEstimateSize(
  SaleReturnInvoice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.returnType.length * 3;
  bytesCount += 3 + object.returnedItems.length * 3;
  {
    final offsets = allOffsets[ReturnItem]!;
    for (var i = 0; i < object.returnedItems.length; i++) {
      final value = object.returnedItems[i];
      bytesCount += ReturnItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _saleReturnInvoiceSerialize(
  SaleReturnInvoice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.customerId);
  writer.writeDateTime(offsets[1], object.returnDate);
  writer.writeString(offsets[2], object.returnType);
  writer.writeObjectList<ReturnItem>(
    offsets[3],
    allOffsets,
    ReturnItemSchema.serialize,
    object.returnedItems,
  );
  writer.writeDouble(offsets[4], object.totalReturnAmount);
}

SaleReturnInvoice _saleReturnInvoiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SaleReturnInvoice();
  object.customerId = reader.readLongOrNull(offsets[0]);
  object.id = id;
  object.returnDate = reader.readDateTime(offsets[1]);
  object.returnType = reader.readString(offsets[2]);
  object.returnedItems = reader.readObjectList<ReturnItem>(
        offsets[3],
        ReturnItemSchema.deserialize,
        allOffsets,
        ReturnItem(),
      ) ??
      [];
  object.totalReturnAmount = reader.readDouble(offsets[4]);
  return object;
}

P _saleReturnInvoiceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readObjectList<ReturnItem>(
            offset,
            ReturnItemSchema.deserialize,
            allOffsets,
            ReturnItem(),
          ) ??
          []) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _saleReturnInvoiceGetId(SaleReturnInvoice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _saleReturnInvoiceGetLinks(
    SaleReturnInvoice object) {
  return [];
}

void _saleReturnInvoiceAttach(
    IsarCollection<dynamic> col, Id id, SaleReturnInvoice object) {
  object.id = id;
}

extension SaleReturnInvoiceQueryWhereSort
    on QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QWhere> {
  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhere>
      anyReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'returnDate'),
      );
    });
  }
}

extension SaleReturnInvoiceQueryWhere
    on QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QWhereClause> {
  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
      returnDateEqualTo(DateTime returnDate) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'returnDate',
        value: [returnDate],
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterWhereClause>
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

extension SaleReturnInvoiceQueryFilter
    on QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QFilterCondition> {
  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      customerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerId',
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      customerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerId',
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      customerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      customerIdGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'customerId',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      customerIdLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'customerId',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      customerIdBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'customerId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnDateGreaterThan(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnDateLessThan(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnDateBetween(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeEqualTo(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeGreaterThan(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeLessThan(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeBetween(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeStartsWith(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeEndsWith(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'returnType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'returnType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'returnType',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'returnType',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnedItemsLengthEqualTo(int length) {
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnedItemsIsEmpty() {
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnedItemsIsNotEmpty() {
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnedItemsLengthLessThan(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnedItemsLengthGreaterThan(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnedItemsLengthBetween(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      totalReturnAmountEqualTo(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      totalReturnAmountGreaterThan(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      totalReturnAmountLessThan(
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

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      totalReturnAmountBetween(
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

extension SaleReturnInvoiceQueryObject
    on QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QFilterCondition> {
  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterFilterCondition>
      returnedItemsElement(FilterQuery<ReturnItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'returnedItems');
    });
  }
}

extension SaleReturnInvoiceQueryLinks
    on QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QFilterCondition> {}

extension SaleReturnInvoiceQuerySortBy
    on QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QSortBy> {
  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      sortByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      sortByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      sortByReturnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnType', Sort.asc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      sortByReturnTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnType', Sort.desc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      sortByTotalReturnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalReturnAmount', Sort.asc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      sortByTotalReturnAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalReturnAmount', Sort.desc);
    });
  }
}

extension SaleReturnInvoiceQuerySortThenBy
    on QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QSortThenBy> {
  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      thenByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.asc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      thenByReturnDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnDate', Sort.desc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      thenByReturnType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnType', Sort.asc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      thenByReturnTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'returnType', Sort.desc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      thenByTotalReturnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalReturnAmount', Sort.asc);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QAfterSortBy>
      thenByTotalReturnAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalReturnAmount', Sort.desc);
    });
  }
}

extension SaleReturnInvoiceQueryWhereDistinct
    on QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QDistinct> {
  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QDistinct>
      distinctByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId');
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QDistinct>
      distinctByReturnDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnDate');
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QDistinct>
      distinctByReturnType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'returnType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QDistinct>
      distinctByTotalReturnAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalReturnAmount');
    });
  }
}

extension SaleReturnInvoiceQueryProperty
    on QueryBuilder<SaleReturnInvoice, SaleReturnInvoice, QQueryProperty> {
  QueryBuilder<SaleReturnInvoice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SaleReturnInvoice, int?, QQueryOperations> customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<SaleReturnInvoice, DateTime, QQueryOperations>
      returnDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnDate');
    });
  }

  QueryBuilder<SaleReturnInvoice, String, QQueryOperations>
      returnTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnType');
    });
  }

  QueryBuilder<SaleReturnInvoice, List<ReturnItem>, QQueryOperations>
      returnedItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'returnedItems');
    });
  }

  QueryBuilder<SaleReturnInvoice, double, QQueryOperations>
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

const ReturnItemSchema = Schema(
  name: r'ReturnItem',
  id: -5836553446200844282,
  properties: {
    r'expiryDate': PropertySchema(
      id: 0,
      name: r'expiryDate',
      type: IsarType.dateTime,
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
  estimateSize: _returnItemEstimateSize,
  serialize: _returnItemSerialize,
  deserialize: _returnItemDeserialize,
  deserializeProp: _returnItemDeserializeProp,
);

int _returnItemEstimateSize(
  ReturnItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.productName.length * 3;
  return bytesCount;
}

void _returnItemSerialize(
  ReturnItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.expiryDate);
  writer.writeLong(offsets[1], object.productId);
  writer.writeString(offsets[2], object.productName);
  writer.writeLong(offsets[3], object.quantityReturned);
  writer.writeDouble(offsets[4], object.returnPrice);
}

ReturnItem _returnItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReturnItem();
  object.expiryDate = reader.readDateTime(offsets[0]);
  object.productId = reader.readLongOrNull(offsets[1]);
  object.productName = reader.readString(offsets[2]);
  object.quantityReturned = reader.readLong(offsets[3]);
  object.returnPrice = reader.readDouble(offsets[4]);
  return object;
}

P _returnItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
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

extension ReturnItemQueryFilter
    on QueryBuilder<ReturnItem, ReturnItem, QFilterCondition> {
  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition> expiryDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition> expiryDateBetween(
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
      productIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
      productIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition> productIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition> productIdLessThan(
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition> productIdBetween(
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
      productNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
      productNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
      productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
      productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
      quantityReturnedEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantityReturned',
        value: value,
      ));
    });
  }

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

  QueryBuilder<ReturnItem, ReturnItem, QAfterFilterCondition>
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

extension ReturnItemQueryObject
    on QueryBuilder<ReturnItem, ReturnItem, QFilterCondition> {}
