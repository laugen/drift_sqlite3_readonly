// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ex1_database.dart';

// ignore_for_file: type=lint
class Tbl1 extends Table with TableInfo<Tbl1, Tbl1Data> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Tbl1(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _oneMeta = const VerificationMeta('one');
  late final GeneratedColumn<String> one = GeneratedColumn<String>(
      'one', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      $customConstraints: '');
  static const VerificationMeta _twoMeta = const VerificationMeta('two');
  late final GeneratedColumn<int> two = GeneratedColumn<int>(
      'two', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: '');
  @override
  List<GeneratedColumn> get $columns => [one, two];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'tbl1';
  @override
  VerificationContext validateIntegrity(Insertable<Tbl1Data> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('one')) {
      context.handle(
          _oneMeta, one.isAcceptableOrUnknown(data['one']!, _oneMeta));
    }
    if (data.containsKey('two')) {
      context.handle(
          _twoMeta, two.isAcceptableOrUnknown(data['two']!, _twoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Tbl1Data map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Tbl1Data(
      one: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}one']),
      two: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}two']),
    );
  }

  @override
  Tbl1 createAlias(String alias) {
    return Tbl1(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

class Tbl1Data extends DataClass implements Insertable<Tbl1Data> {
  final String? one;
  final int? two;
  const Tbl1Data({this.one, this.two});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || one != null) {
      map['one'] = Variable<String>(one);
    }
    if (!nullToAbsent || two != null) {
      map['two'] = Variable<int>(two);
    }
    return map;
  }

  Tbl1Companion toCompanion(bool nullToAbsent) {
    return Tbl1Companion(
      one: one == null && nullToAbsent ? const Value.absent() : Value(one),
      two: two == null && nullToAbsent ? const Value.absent() : Value(two),
    );
  }

  factory Tbl1Data.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Tbl1Data(
      one: serializer.fromJson<String?>(json['one']),
      two: serializer.fromJson<int?>(json['two']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'one': serializer.toJson<String?>(one),
      'two': serializer.toJson<int?>(two),
    };
  }

  Tbl1Data copyWith(
          {Value<String?> one = const Value.absent(),
          Value<int?> two = const Value.absent()}) =>
      Tbl1Data(
        one: one.present ? one.value : this.one,
        two: two.present ? two.value : this.two,
      );
  @override
  String toString() {
    return (StringBuffer('Tbl1Data(')
          ..write('one: $one, ')
          ..write('two: $two')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(one, two);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Tbl1Data && other.one == this.one && other.two == this.two);
}

class Tbl1Companion extends UpdateCompanion<Tbl1Data> {
  final Value<String?> one;
  final Value<int?> two;
  final Value<int> rowid;
  const Tbl1Companion({
    this.one = const Value.absent(),
    this.two = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  Tbl1Companion.insert({
    this.one = const Value.absent(),
    this.two = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  static Insertable<Tbl1Data> custom({
    Expression<String>? one,
    Expression<int>? two,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (one != null) 'one': one,
      if (two != null) 'two': two,
      if (rowid != null) 'rowid': rowid,
    });
  }

  Tbl1Companion copyWith(
      {Value<String?>? one, Value<int?>? two, Value<int>? rowid}) {
    return Tbl1Companion(
      one: one ?? this.one,
      two: two ?? this.two,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (one.present) {
      map['one'] = Variable<String>(one.value);
    }
    if (two.present) {
      map['two'] = Variable<int>(two.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('Tbl1Companion(')
          ..write('one: $one, ')
          ..write('two: $two, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$Ex1Database extends GeneratedDatabase {
  _$Ex1Database(QueryExecutor e) : super(e);
  late final Tbl1 tbl1 = Tbl1(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tbl1];
}
