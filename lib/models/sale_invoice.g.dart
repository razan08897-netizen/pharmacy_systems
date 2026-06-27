// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_invoice.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSaleInvoiceCollection on Isar {
  IsarCollection<SaleInvoice> get saleInvoices => this.collection();
}

const SaleInvoiceSchema = CollectionSchema(
  name: r'SaleInvoice',
  id: -4691899111461580758,
  properties: {
    r'customerId': PropertySchema(
      id: 0,
      name: r'customerId',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 1,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'discountAmount': PropertySchema(
      id: 2,
      name: r'discountAmount',
      type: IsarType.double,
    ),
    r'invoiceDate': PropertySchema(
      id: 3,
      name: r'invoiceDate',
      type: IsarType.dateTime,
    ),
    r'invoiceType': PropertySchema(
      id: 4,
      name: r'invoiceType',
      type: IsarType.string,
    ),
    r'netAmount': PropertySchema(
      id: 5,
      name: r'netAmount',
      type: IsarType.double,
    ),
    r'soldItems': PropertySchema(
      id: 6,
      name: r'soldItems',
      type: IsarType.objectList,
      target: r'SaleItem',
    ),
    r'totalAmount': PropertySchema(
      id: 7,
      name: r'totalAmount',
      type: IsarType.double,
    ),
    r'totalBeforeDiscount': PropertySchema(
      id: 8,
      name: r'totalBeforeDiscount',
      type: IsarType.double,
    ),
    r'totalCost': PropertySchema(
      id: 9,
      name: r'totalCost',
      type: IsarType.double,
    )
  },
  estimateSize: _saleInvoiceEstimateSize,
  serialize: _saleInvoiceSerialize,
  deserialize: _saleInvoiceDeserialize,
  deserializeProp: _saleInvoiceDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'SaleItem': SaleItemSchema},
  getId: _saleInvoiceGetId,
  getLinks: _saleInvoiceGetLinks,
  attach: _saleInvoiceAttach,
  version: '3.1.0+1',
);

int _saleInvoiceEstimateSize(
  SaleInvoice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.invoiceType.length * 3;
  bytesCount += 3 + object.soldItems.length * 3;
  {
    final offsets = allOffsets[SaleItem]!;
    for (var i = 0; i < object.soldItems.length; i++) {
      final value = object.soldItems[i];
      bytesCount += SaleItemSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _saleInvoiceSerialize(
  SaleInvoice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.customerId);
  writer.writeDateTime(offsets[1], object.date);
  writer.writeDouble(offsets[2], object.discountAmount);
  writer.writeDateTime(offsets[3], object.invoiceDate);
  writer.writeString(offsets[4], object.invoiceType);
  writer.writeDouble(offsets[5], object.netAmount);
  writer.writeObjectList<SaleItem>(
    offsets[6],
    allOffsets,
    SaleItemSchema.serialize,
    object.soldItems,
  );
  writer.writeDouble(offsets[7], object.totalAmount);
  writer.writeDouble(offsets[8], object.totalBeforeDiscount);
  writer.writeDouble(offsets[9], object.totalCost);
}

SaleInvoice _saleInvoiceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SaleInvoice();
  object.customerId = reader.readLongOrNull(offsets[0]);
  object.date = reader.readDateTimeOrNull(offsets[1]);
  object.discountAmount = reader.readDouble(offsets[2]);
  object.id = id;
  object.invoiceDate = reader.readDateTime(offsets[3]);
  object.invoiceType = reader.readString(offsets[4]);
  object.netAmount = reader.readDouble(offsets[5]);
  object.soldItems = reader.readObjectList<SaleItem>(
        offsets[6],
        SaleItemSchema.deserialize,
        allOffsets,
        SaleItem(),
      ) ??
      [];
  object.totalBeforeDiscount = reader.readDouble(offsets[8]);
  object.totalCost = reader.readDouble(offsets[9]);
  return object;
}

P _saleInvoiceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readDateTime(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readObjectList<SaleItem>(
            offset,
            SaleItemSchema.deserialize,
            allOffsets,
            SaleItem(),
          ) ??
          []) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    case 9:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _saleInvoiceGetId(SaleInvoice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _saleInvoiceGetLinks(SaleInvoice object) {
  return [];
}

void _saleInvoiceAttach(
    IsarCollection<dynamic> col, Id id, SaleInvoice object) {
  object.id = id;
}

extension SaleInvoiceQueryWhereSort
    on QueryBuilder<SaleInvoice, SaleInvoice, QWhere> {
  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension SaleInvoiceQueryWhere
    on QueryBuilder<SaleInvoice, SaleInvoice, QWhereClause> {
  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> idBetween(
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

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [null],
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> dateEqualTo(
      DateTime? date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> dateNotEqualTo(
      DateTime? date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> dateGreaterThan(
    DateTime? date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> dateLessThan(
    DateTime? date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterWhereClause> dateBetween(
    DateTime? lowerDate,
    DateTime? upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SaleInvoiceQueryFilter
    on QueryBuilder<SaleInvoice, SaleInvoice, QFilterCondition> {
  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      customerIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'customerId',
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      customerIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'customerId',
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      customerIdEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'customerId',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
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

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
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

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
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

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition> dateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      dateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'date',
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition> dateEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition> dateGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition> dateLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition> dateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      discountAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      discountAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      discountAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      discountAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition> idBetween(
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

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'invoiceType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'invoiceType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'invoiceType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'invoiceType',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      invoiceTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'invoiceType',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      netAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'netAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      netAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'netAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      netAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'netAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      netAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'netAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      soldItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soldItems',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      soldItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soldItems',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      soldItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soldItems',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      soldItemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soldItems',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      soldItemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soldItems',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      soldItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'soldItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalBeforeDiscountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalBeforeDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalBeforeDiscountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalBeforeDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalBeforeDiscountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalBeforeDiscount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalBeforeDiscountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalBeforeDiscount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      totalCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension SaleInvoiceQueryObject
    on QueryBuilder<SaleInvoice, SaleInvoice, QFilterCondition> {
  QueryBuilder<SaleInvoice, SaleInvoice, QAfterFilterCondition>
      soldItemsElement(FilterQuery<SaleItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'soldItems');
    });
  }
}

extension SaleInvoiceQueryLinks
    on QueryBuilder<SaleInvoice, SaleInvoice, QFilterCondition> {}

extension SaleInvoiceQuerySortBy
    on QueryBuilder<SaleInvoice, SaleInvoice, QSortBy> {
  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy>
      sortByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByInvoiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByInvoiceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByInvoiceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceType', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByInvoiceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceType', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy>
      sortByTotalBeforeDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBeforeDiscount', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy>
      sortByTotalBeforeDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBeforeDiscount', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> sortByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }
}

extension SaleInvoiceQuerySortThenBy
    on QueryBuilder<SaleInvoice, SaleInvoice, QSortThenBy> {
  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByCustomerIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'customerId', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy>
      thenByDiscountAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountAmount', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByInvoiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByInvoiceDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceDate', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByInvoiceType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceType', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByInvoiceTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'invoiceType', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByNetAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'netAmount', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy>
      thenByTotalBeforeDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBeforeDiscount', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy>
      thenByTotalBeforeDiscountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalBeforeDiscount', Sort.desc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.asc);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QAfterSortBy> thenByTotalCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCost', Sort.desc);
    });
  }
}

extension SaleInvoiceQueryWhereDistinct
    on QueryBuilder<SaleInvoice, SaleInvoice, QDistinct> {
  QueryBuilder<SaleInvoice, SaleInvoice, QDistinct> distinctByCustomerId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'customerId');
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QDistinct> distinctByDiscountAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountAmount');
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QDistinct> distinctByInvoiceDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceDate');
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QDistinct> distinctByInvoiceType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'invoiceType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QDistinct> distinctByNetAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'netAmount');
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QDistinct> distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QDistinct>
      distinctByTotalBeforeDiscount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalBeforeDiscount');
    });
  }

  QueryBuilder<SaleInvoice, SaleInvoice, QDistinct> distinctByTotalCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCost');
    });
  }
}

extension SaleInvoiceQueryProperty
    on QueryBuilder<SaleInvoice, SaleInvoice, QQueryProperty> {
  QueryBuilder<SaleInvoice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SaleInvoice, int?, QQueryOperations> customerIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'customerId');
    });
  }

  QueryBuilder<SaleInvoice, DateTime?, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<SaleInvoice, double, QQueryOperations> discountAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountAmount');
    });
  }

  QueryBuilder<SaleInvoice, DateTime, QQueryOperations> invoiceDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceDate');
    });
  }

  QueryBuilder<SaleInvoice, String, QQueryOperations> invoiceTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'invoiceType');
    });
  }

  QueryBuilder<SaleInvoice, double, QQueryOperations> netAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'netAmount');
    });
  }

  QueryBuilder<SaleInvoice, List<SaleItem>, QQueryOperations>
      soldItemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soldItems');
    });
  }

  QueryBuilder<SaleInvoice, double, QQueryOperations> totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }

  QueryBuilder<SaleInvoice, double, QQueryOperations>
      totalBeforeDiscountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalBeforeDiscount');
    });
  }

  QueryBuilder<SaleInvoice, double, QQueryOperations> totalCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCost');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

const SaleItemSchema = Schema(
  name: r'SaleItem',
  id: 8503636501889557541,
  properties: {
    r'batchId': PropertySchema(
      id: 0,
      name: r'batchId',
      type: IsarType.long,
    ),
    r'costPrice': PropertySchema(
      id: 1,
      name: r'costPrice',
      type: IsarType.double,
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
    r'quantitySold': PropertySchema(
      id: 4,
      name: r'quantitySold',
      type: IsarType.long,
    ),
    r'salePrice': PropertySchema(
      id: 5,
      name: r'salePrice',
      type: IsarType.double,
    ),
    r'unitUsed': PropertySchema(
      id: 6,
      name: r'unitUsed',
      type: IsarType.string,
    )
  },
  estimateSize: _saleItemEstimateSize,
  serialize: _saleItemSerialize,
  deserialize: _saleItemDeserialize,
  deserializeProp: _saleItemDeserializeProp,
);

int _saleItemEstimateSize(
  SaleItem object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.productName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.unitUsed.length * 3;
  return bytesCount;
}

void _saleItemSerialize(
  SaleItem object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.batchId);
  writer.writeDouble(offsets[1], object.costPrice);
  writer.writeLong(offsets[2], object.productId);
  writer.writeString(offsets[3], object.productName);
  writer.writeLong(offsets[4], object.quantitySold);
  writer.writeDouble(offsets[5], object.salePrice);
  writer.writeString(offsets[6], object.unitUsed);
}

SaleItem _saleItemDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SaleItem();
  object.batchId = reader.readLongOrNull(offsets[0]);
  object.costPrice = reader.readDouble(offsets[1]);
  object.productId = reader.readLongOrNull(offsets[2]);
  object.productName = reader.readStringOrNull(offsets[3]);
  object.quantitySold = reader.readLong(offsets[4]);
  object.salePrice = reader.readDouble(offsets[5]);
  object.unitUsed = reader.readString(offsets[6]);
  return object;
}

P _saleItemDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension SaleItemQueryFilter
    on QueryBuilder<SaleItem, SaleItem, QFilterCondition> {
  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> batchIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'batchId',
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> batchIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'batchId',
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> batchIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchId',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> batchIdGreaterThan(
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> batchIdLessThan(
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> batchIdBetween(
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> costPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'costPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> costPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'costPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> costPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'costPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> costPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'costPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productId',
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productIdEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productIdGreaterThan(
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productIdLessThan(
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productIdBetween(
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'productName',
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition>
      productNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'productName',
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productNameEqualTo(
    String? value, {
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition>
      productNameGreaterThan(
    String? value, {
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productNameLessThan(
    String? value, {
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productNameBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productNameStartsWith(
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productNameEndsWith(
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

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productNameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'productName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'productName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> productNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition>
      productNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'productName',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> quantitySoldEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quantitySold',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition>
      quantitySoldGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quantitySold',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> quantitySoldLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quantitySold',
        value: value,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> quantitySoldBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quantitySold',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> salePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'salePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> salePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'salePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> salePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'salePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> salePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'salePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitUsed',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unitUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unitUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unitUsed',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unitUsed',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitUsed',
        value: '',
      ));
    });
  }

  QueryBuilder<SaleItem, SaleItem, QAfterFilterCondition> unitUsedIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unitUsed',
        value: '',
      ));
    });
  }
}

extension SaleItemQueryObject
    on QueryBuilder<SaleItem, SaleItem, QFilterCondition> {}
