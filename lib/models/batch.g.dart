// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBatchCollection on Isar {
  IsarCollection<Batch> get batchs => this.collection();
}

const BatchSchema = CollectionSchema(
  name: r'Batch',
  id: -8512419744189079083,
  properties: {
    r'availableQuantity': PropertySchema(
      id: 0,
      name: r'availableQuantity',
      type: IsarType.long,
    ),
    r'batchNumber': PropertySchema(
      id: 1,
      name: r'batchNumber',
      type: IsarType.string,
    ),
    r'expiryDate': PropertySchema(
      id: 2,
      name: r'expiryDate',
      type: IsarType.dateTime,
    ),
    r'initialQuantity': PropertySchema(
      id: 3,
      name: r'initialQuantity',
      type: IsarType.long,
    ),
    r'packSalePrice': PropertySchema(
      id: 4,
      name: r'packSalePrice',
      type: IsarType.double,
    ),
    r'productId': PropertySchema(
      id: 5,
      name: r'productId',
      type: IsarType.long,
    ),
    r'purchasePriceCost': PropertySchema(
      id: 6,
      name: r'purchasePriceCost',
      type: IsarType.double,
    ),
    r'unitCostPrice': PropertySchema(
      id: 7,
      name: r'unitCostPrice',
      type: IsarType.double,
    ),
    r'unitSalePrice': PropertySchema(
      id: 8,
      name: r'unitSalePrice',
      type: IsarType.double,
    )
  },
  estimateSize: _batchEstimateSize,
  serialize: _batchSerialize,
  deserialize: _batchDeserialize,
  deserializeProp: _batchDeserializeProp,
  idName: r'id',
  indexes: {
    r'productId': IndexSchema(
      id: 5580769080710688203,
      name: r'productId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'productId',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'batchNumber': IndexSchema(
      id: -5361927408577734280,
      name: r'batchNumber',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'batchNumber',
          type: IndexType.value,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _batchGetId,
  getLinks: _batchGetLinks,
  attach: _batchAttach,
  version: '3.1.0+1',
);

int _batchEstimateSize(
  Batch object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.batchNumber.length * 3;
  return bytesCount;
}

void _batchSerialize(
  Batch object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.availableQuantity);
  writer.writeString(offsets[1], object.batchNumber);
  writer.writeDateTime(offsets[2], object.expiryDate);
  writer.writeLong(offsets[3], object.initialQuantity);
  writer.writeDouble(offsets[4], object.packSalePrice);
  writer.writeLong(offsets[5], object.productId);
  writer.writeDouble(offsets[6], object.purchasePriceCost);
  writer.writeDouble(offsets[7], object.unitCostPrice);
  writer.writeDouble(offsets[8], object.unitSalePrice);
}

Batch _batchDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Batch();
  object.availableQuantity = reader.readLong(offsets[0]);
  object.batchNumber = reader.readString(offsets[1]);
  object.expiryDate = reader.readDateTime(offsets[2]);
  object.id = id;
  object.initialQuantity = reader.readLong(offsets[3]);
  object.packSalePrice = reader.readDouble(offsets[4]);
  object.productId = reader.readLong(offsets[5]);
  object.purchasePriceCost = reader.readDouble(offsets[6]);
  object.unitCostPrice = reader.readDouble(offsets[7]);
  object.unitSalePrice = reader.readDouble(offsets[8]);
  return object;
}

P _batchDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readDouble(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _batchGetId(Batch object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _batchGetLinks(Batch object) {
  return [];
}

void _batchAttach(IsarCollection<dynamic> col, Id id, Batch object) {
  object.id = id;
}

extension BatchQueryWhereSort on QueryBuilder<Batch, Batch, QWhere> {
  QueryBuilder<Batch, Batch, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhere> anyProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'productId'),
      );
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhere> anyBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'batchNumber'),
      );
    });
  }
}

extension BatchQueryWhere on QueryBuilder<Batch, Batch, QWhereClause> {
  QueryBuilder<Batch, Batch, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Batch, Batch, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> idBetween(
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

  QueryBuilder<Batch, Batch, QAfterWhereClause> productIdEqualTo(
      int productId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'productId',
        value: [productId],
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> productIdNotEqualTo(
      int productId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'productId',
              lower: [],
              upper: [productId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'productId',
              lower: [productId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'productId',
              lower: [productId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'productId',
              lower: [],
              upper: [productId],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> productIdGreaterThan(
    int productId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'productId',
        lower: [productId],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> productIdLessThan(
    int productId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'productId',
        lower: [],
        upper: [productId],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> productIdBetween(
    int lowerProductId,
    int upperProductId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'productId',
        lower: [lowerProductId],
        includeLower: includeLower,
        upper: [upperProductId],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> batchNumberEqualTo(
      String batchNumber) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'batchNumber',
        value: [batchNumber],
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> batchNumberNotEqualTo(
      String batchNumber) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'batchNumber',
              lower: [],
              upper: [batchNumber],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'batchNumber',
              lower: [batchNumber],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'batchNumber',
              lower: [batchNumber],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'batchNumber',
              lower: [],
              upper: [batchNumber],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> batchNumberGreaterThan(
    String batchNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'batchNumber',
        lower: [batchNumber],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> batchNumberLessThan(
    String batchNumber, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'batchNumber',
        lower: [],
        upper: [batchNumber],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> batchNumberBetween(
    String lowerBatchNumber,
    String upperBatchNumber, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'batchNumber',
        lower: [lowerBatchNumber],
        includeLower: includeLower,
        upper: [upperBatchNumber],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> batchNumberStartsWith(
      String BatchNumberPrefix) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'batchNumber',
        lower: [BatchNumberPrefix],
        upper: ['$BatchNumberPrefix\u{FFFFF}'],
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> batchNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'batchNumber',
        value: [''],
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterWhereClause> batchNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'batchNumber',
              upper: [''],
            ))
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'batchNumber',
              lower: [''],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.greaterThan(
              indexName: r'batchNumber',
              lower: [''],
            ))
            .addWhereClause(IndexWhereClause.lessThan(
              indexName: r'batchNumber',
              upper: [''],
            ));
      }
    });
  }
}

extension BatchQueryFilter on QueryBuilder<Batch, Batch, QFilterCondition> {
  QueryBuilder<Batch, Batch, QAfterFilterCondition> availableQuantityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'availableQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition>
      availableQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'availableQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> availableQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'availableQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> availableQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'availableQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batchNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'batchNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'batchNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batchNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> batchNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'batchNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> expiryDateEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'expiryDate',
        value: value,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> expiryDateGreaterThan(
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

  QueryBuilder<Batch, Batch, QAfterFilterCondition> expiryDateLessThan(
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

  QueryBuilder<Batch, Batch, QAfterFilterCondition> expiryDateBetween(
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

  QueryBuilder<Batch, Batch, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Batch, Batch, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Batch, Batch, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Batch, Batch, QAfterFilterCondition> initialQuantityEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'initialQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> initialQuantityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'initialQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> initialQuantityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'initialQuantity',
        value: value,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> initialQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'initialQuantity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> packSalePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'packSalePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> packSalePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'packSalePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> packSalePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'packSalePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> packSalePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'packSalePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> productIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productId',
        value: value,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> productIdGreaterThan(
    int value, {
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

  QueryBuilder<Batch, Batch, QAfterFilterCondition> productIdLessThan(
    int value, {
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

  QueryBuilder<Batch, Batch, QAfterFilterCondition> productIdBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Batch, Batch, QAfterFilterCondition> purchasePriceCostEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'purchasePriceCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition>
      purchasePriceCostGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'purchasePriceCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> purchasePriceCostLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'purchasePriceCost',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> purchasePriceCostBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'purchasePriceCost',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> unitCostPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitCostPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> unitCostPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitCostPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> unitCostPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitCostPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> unitCostPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitCostPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> unitSalePriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unitSalePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> unitSalePriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unitSalePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> unitSalePriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unitSalePrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Batch, Batch, QAfterFilterCondition> unitSalePriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unitSalePrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension BatchQueryObject on QueryBuilder<Batch, Batch, QFilterCondition> {}

extension BatchQueryLinks on QueryBuilder<Batch, Batch, QFilterCondition> {}

extension BatchQuerySortBy on QueryBuilder<Batch, Batch, QSortBy> {
  QueryBuilder<Batch, Batch, QAfterSortBy> sortByAvailableQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableQuantity', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByAvailableQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableQuantity', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByBatchNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByInitialQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialQuantity', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByInitialQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialQuantity', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByPackSalePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSalePrice', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByPackSalePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSalePrice', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByPurchasePriceCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePriceCost', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByPurchasePriceCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePriceCost', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByUnitCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCostPrice', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByUnitCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCostPrice', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByUnitSalePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitSalePrice', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> sortByUnitSalePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitSalePrice', Sort.desc);
    });
  }
}

extension BatchQuerySortThenBy on QueryBuilder<Batch, Batch, QSortThenBy> {
  QueryBuilder<Batch, Batch, QAfterSortBy> thenByAvailableQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableQuantity', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByAvailableQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'availableQuantity', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByBatchNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByBatchNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batchNumber', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByExpiryDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expiryDate', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByInitialQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialQuantity', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByInitialQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initialQuantity', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByPackSalePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSalePrice', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByPackSalePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'packSalePrice', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productId', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByPurchasePriceCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePriceCost', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByPurchasePriceCostDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'purchasePriceCost', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByUnitCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCostPrice', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByUnitCostPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitCostPrice', Sort.desc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByUnitSalePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitSalePrice', Sort.asc);
    });
  }

  QueryBuilder<Batch, Batch, QAfterSortBy> thenByUnitSalePriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unitSalePrice', Sort.desc);
    });
  }
}

extension BatchQueryWhereDistinct on QueryBuilder<Batch, Batch, QDistinct> {
  QueryBuilder<Batch, Batch, QDistinct> distinctByAvailableQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'availableQuantity');
    });
  }

  QueryBuilder<Batch, Batch, QDistinct> distinctByBatchNumber(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batchNumber', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Batch, Batch, QDistinct> distinctByExpiryDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expiryDate');
    });
  }

  QueryBuilder<Batch, Batch, QDistinct> distinctByInitialQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initialQuantity');
    });
  }

  QueryBuilder<Batch, Batch, QDistinct> distinctByPackSalePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'packSalePrice');
    });
  }

  QueryBuilder<Batch, Batch, QDistinct> distinctByProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productId');
    });
  }

  QueryBuilder<Batch, Batch, QDistinct> distinctByPurchasePriceCost() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'purchasePriceCost');
    });
  }

  QueryBuilder<Batch, Batch, QDistinct> distinctByUnitCostPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitCostPrice');
    });
  }

  QueryBuilder<Batch, Batch, QDistinct> distinctByUnitSalePrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unitSalePrice');
    });
  }
}

extension BatchQueryProperty on QueryBuilder<Batch, Batch, QQueryProperty> {
  QueryBuilder<Batch, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Batch, int, QQueryOperations> availableQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'availableQuantity');
    });
  }

  QueryBuilder<Batch, String, QQueryOperations> batchNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batchNumber');
    });
  }

  QueryBuilder<Batch, DateTime, QQueryOperations> expiryDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expiryDate');
    });
  }

  QueryBuilder<Batch, int, QQueryOperations> initialQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initialQuantity');
    });
  }

  QueryBuilder<Batch, double, QQueryOperations> packSalePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'packSalePrice');
    });
  }

  QueryBuilder<Batch, int, QQueryOperations> productIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productId');
    });
  }

  QueryBuilder<Batch, double, QQueryOperations> purchasePriceCostProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'purchasePriceCost');
    });
  }

  QueryBuilder<Batch, double, QQueryOperations> unitCostPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitCostPrice');
    });
  }

  QueryBuilder<Batch, double, QQueryOperations> unitSalePriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unitSalePrice');
    });
  }
}
