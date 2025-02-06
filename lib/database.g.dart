// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ExpenseCategoriesTable extends ExpenseCategories
    with TableInfo<$ExpenseCategoriesTable, ExpenseCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpenseCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, order, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expense_categories';
  @override
  VerificationContext validateIntegrity(Insertable<ExpenseCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExpenseCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExpenseCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ExpenseCategoriesTable createAlias(String alias) {
    return $ExpenseCategoriesTable(attachedDatabase, alias);
  }
}

class ExpenseCategory extends DataClass implements Insertable<ExpenseCategory> {
  final int id;
  final String name;
  final String? description;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ExpenseCategory(
      {required this.id,
      required this.name,
      this.description,
      required this.order,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['order'] = Variable<int>(order);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ExpenseCategoriesCompanion toCompanion(bool nullToAbsent) {
    return ExpenseCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      order: Value(order),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ExpenseCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExpenseCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      order: serializer.fromJson<int>(json['order']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'order': serializer.toJson<int>(order),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ExpenseCategory copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          int? order,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ExpenseCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        order: order ?? this.order,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ExpenseCategory copyWithCompanion(ExpenseCategoriesCompanion data) {
    return ExpenseCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      order: data.order.present ? data.order.value : this.order,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, order, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExpenseCategory &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.order == this.order &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ExpenseCategoriesCompanion extends UpdateCompanion<ExpenseCategory> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> order;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ExpenseCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.order = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ExpenseCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required int order,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        order = Value(order);
  static Insertable<ExpenseCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? order,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (order != null) 'order': order,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ExpenseCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<int>? order,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ExpenseCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpenseCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $IncomeCategoriesTable extends IncomeCategories
    with TableInfo<$IncomeCategoriesTable, IncomeCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, description, order, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income_categories';
  @override
  VerificationContext validateIntegrity(Insertable<IncomeCategory> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeCategory(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $IncomeCategoriesTable createAlias(String alias) {
    return $IncomeCategoriesTable(attachedDatabase, alias);
  }
}

class IncomeCategory extends DataClass implements Insertable<IncomeCategory> {
  final int id;
  final String name;
  final String? description;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;
  const IncomeCategory(
      {required this.id,
      required this.name,
      this.description,
      required this.order,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['order'] = Variable<int>(order);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  IncomeCategoriesCompanion toCompanion(bool nullToAbsent) {
    return IncomeCategoriesCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      order: Value(order),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory IncomeCategory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeCategory(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      order: serializer.fromJson<int>(json['order']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'order': serializer.toJson<int>(order),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  IncomeCategory copyWith(
          {int? id,
          String? name,
          Value<String?> description = const Value.absent(),
          int? order,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      IncomeCategory(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        order: order ?? this.order,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  IncomeCategory copyWithCompanion(IncomeCategoriesCompanion data) {
    return IncomeCategory(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      order: data.order.present ? data.order.value : this.order,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCategory(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, description, order, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeCategory &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.order == this.order &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class IncomeCategoriesCompanion extends UpdateCompanion<IncomeCategory> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<int> order;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const IncomeCategoriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.order = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  IncomeCategoriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
    required int order,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        order = Value(order);
  static Insertable<IncomeCategory> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<int>? order,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (order != null) 'order': order,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  IncomeCategoriesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<int>? order,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return IncomeCategoriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCategoriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CurrenciesTable extends Currencies
    with TableInfo<$CurrenciesTable, Currency> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CurrenciesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, code, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'currencies';
  @override
  VerificationContext validateIntegrity(Insertable<Currency> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    } else if (isInserting) {
      context.missing(_codeMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Currency map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Currency(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $CurrenciesTable createAlias(String alias) {
    return $CurrenciesTable(attachedDatabase, alias);
  }
}

class Currency extends DataClass implements Insertable<Currency> {
  final int id;
  final String name;
  final String code;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Currency(
      {required this.id,
      required this.name,
      required this.code,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['code'] = Variable<String>(code);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  CurrenciesCompanion toCompanion(bool nullToAbsent) {
    return CurrenciesCompanion(
      id: Value(id),
      name: Value(name),
      code: Value(code),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Currency.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Currency(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      code: serializer.fromJson<String>(json['code']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'code': serializer.toJson<String>(code),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Currency copyWith(
          {int? id,
          String? name,
          String? code,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Currency(
        id: id ?? this.id,
        name: name ?? this.name,
        code: code ?? this.code,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Currency copyWithCompanion(CurrenciesCompanion data) {
    return Currency(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      code: data.code.present ? data.code.value : this.code,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Currency(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, code, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Currency &&
          other.id == this.id &&
          other.name == this.name &&
          other.code == this.code &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class CurrenciesCompanion extends UpdateCompanion<Currency> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> code;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const CurrenciesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.code = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  CurrenciesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String code,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        code = Value(code);
  static Insertable<Currency> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? code,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (code != null) 'code': code,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  CurrenciesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? code,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return CurrenciesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CurrenciesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('code: $code, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AccountGroupsTable extends AccountGroups
    with TableInfo<$AccountGroupsTable, AccountGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, name, order, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'account_groups';
  @override
  VerificationContext validateIntegrity(Insertable<AccountGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AccountGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AccountGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AccountGroupsTable createAlias(String alias) {
    return $AccountGroupsTable(attachedDatabase, alias);
  }
}

class AccountGroup extends DataClass implements Insertable<AccountGroup> {
  final int id;
  final String name;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AccountGroup(
      {required this.id,
      required this.name,
      required this.order,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['order'] = Variable<int>(order);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AccountGroupsCompanion toCompanion(bool nullToAbsent) {
    return AccountGroupsCompanion(
      id: Value(id),
      name: Value(name),
      order: Value(order),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AccountGroup.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AccountGroup(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      order: serializer.fromJson<int>(json['order']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'order': serializer.toJson<int>(order),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AccountGroup copyWith(
          {int? id,
          String? name,
          int? order,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      AccountGroup(
        id: id ?? this.id,
        name: name ?? this.name,
        order: order ?? this.order,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AccountGroup copyWithCompanion(AccountGroupsCompanion data) {
    return AccountGroup(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      order: data.order.present ? data.order.value : this.order,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AccountGroup(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, order, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AccountGroup &&
          other.id == this.id &&
          other.name == this.name &&
          other.order == this.order &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AccountGroupsCompanion extends UpdateCompanion<AccountGroup> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> order;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const AccountGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.order = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AccountGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int order,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : name = Value(name),
        order = Value(order);
  static Insertable<AccountGroup> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? order,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (order != null) 'order': order,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AccountGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? order,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return AccountGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $AccountsTable extends Accounts with TableInfo<$AccountsTable, Account> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AccountsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accountGroupIdMeta =
      const VerificationMeta('accountGroupId');
  @override
  late final GeneratedColumn<int> accountGroupId = GeneratedColumn<int>(
      'account_group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES account_groups (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, accountGroupId, name, order, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'accounts';
  @override
  VerificationContext validateIntegrity(Insertable<Account> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_group_id')) {
      context.handle(
          _accountGroupIdMeta,
          accountGroupId.isAcceptableOrUnknown(
              data['account_group_id']!, _accountGroupIdMeta));
    } else if (isInserting) {
      context.missing(_accountGroupIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Account map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Account(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accountGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_group_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AccountsTable createAlias(String alias) {
    return $AccountsTable(attachedDatabase, alias);
  }
}

class Account extends DataClass implements Insertable<Account> {
  final int id;
  final int accountGroupId;
  final String name;
  final int order;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Account(
      {required this.id,
      required this.accountGroupId,
      required this.name,
      required this.order,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_group_id'] = Variable<int>(accountGroupId);
    map['name'] = Variable<String>(name);
    map['order'] = Variable<int>(order);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AccountsCompanion toCompanion(bool nullToAbsent) {
    return AccountsCompanion(
      id: Value(id),
      accountGroupId: Value(accountGroupId),
      name: Value(name),
      order: Value(order),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Account.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Account(
      id: serializer.fromJson<int>(json['id']),
      accountGroupId: serializer.fromJson<int>(json['accountGroupId']),
      name: serializer.fromJson<String>(json['name']),
      order: serializer.fromJson<int>(json['order']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountGroupId': serializer.toJson<int>(accountGroupId),
      'name': serializer.toJson<String>(name),
      'order': serializer.toJson<int>(order),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Account copyWith(
          {int? id,
          int? accountGroupId,
          String? name,
          int? order,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Account(
        id: id ?? this.id,
        accountGroupId: accountGroupId ?? this.accountGroupId,
        name: name ?? this.name,
        order: order ?? this.order,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Account copyWithCompanion(AccountsCompanion data) {
    return Account(
      id: data.id.present ? data.id.value : this.id,
      accountGroupId: data.accountGroupId.present
          ? data.accountGroupId.value
          : this.accountGroupId,
      name: data.name.present ? data.name.value : this.name,
      order: data.order.present ? data.order.value : this.order,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Account(')
          ..write('id: $id, ')
          ..write('accountGroupId: $accountGroupId, ')
          ..write('name: $name, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, accountGroupId, name, order, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Account &&
          other.id == this.id &&
          other.accountGroupId == this.accountGroupId &&
          other.name == this.name &&
          other.order == this.order &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AccountsCompanion extends UpdateCompanion<Account> {
  final Value<int> id;
  final Value<int> accountGroupId;
  final Value<String> name;
  final Value<int> order;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const AccountsCompanion({
    this.id = const Value.absent(),
    this.accountGroupId = const Value.absent(),
    this.name = const Value.absent(),
    this.order = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  AccountsCompanion.insert({
    this.id = const Value.absent(),
    required int accountGroupId,
    required String name,
    required int order,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : accountGroupId = Value(accountGroupId),
        name = Value(name),
        order = Value(order);
  static Insertable<Account> custom({
    Expression<int>? id,
    Expression<int>? accountGroupId,
    Expression<String>? name,
    Expression<int>? order,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountGroupId != null) 'account_group_id': accountGroupId,
      if (name != null) 'name': name,
      if (order != null) 'order': order,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  AccountsCompanion copyWith(
      {Value<int>? id,
      Value<int>? accountGroupId,
      Value<String>? name,
      Value<int>? order,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return AccountsCompanion(
      id: id ?? this.id,
      accountGroupId: accountGroupId ?? this.accountGroupId,
      name: name ?? this.name,
      order: order ?? this.order,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountGroupId.present) {
      map['account_group_id'] = Variable<int>(accountGroupId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AccountsCompanion(')
          ..write('id: $id, ')
          ..write('accountGroupId: $accountGroupId, ')
          ..write('name: $name, ')
          ..write('order: $order, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BudgetsTable extends Budgets with TableInfo<$BudgetsTable, Budget> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BudgetsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES expense_categories (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _budgetPeriodMeta =
      const VerificationMeta('budgetPeriod');
  @override
  late final GeneratedColumn<String> budgetPeriod = GeneratedColumn<String>(
      'budget_period', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _limitMeta = const VerificationMeta('limit');
  @override
  late final GeneratedColumn<double> limit = GeneratedColumn<double>(
      'limit', aliasedName, false,
      check: () => ComparableExpr(limit).isBiggerThanValue(0.0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns =>
      [id, categoryId, budgetPeriod, limit, createdAt, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'budgets';
  @override
  VerificationContext validateIntegrity(Insertable<Budget> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('budget_period')) {
      context.handle(
          _budgetPeriodMeta,
          budgetPeriod.isAcceptableOrUnknown(
              data['budget_period']!, _budgetPeriodMeta));
    } else if (isInserting) {
      context.missing(_budgetPeriodMeta);
    }
    if (data.containsKey('limit')) {
      context.handle(
          _limitMeta, limit.isAcceptableOrUnknown(data['limit']!, _limitMeta));
    } else if (isInserting) {
      context.missing(_limitMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Budget map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Budget(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      budgetPeriod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}budget_period'])!,
      limit: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}limit'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $BudgetsTable createAlias(String alias) {
    return $BudgetsTable(attachedDatabase, alias);
  }
}

class Budget extends DataClass implements Insertable<Budget> {
  final int id;
  final int categoryId;
  final String budgetPeriod;
  final double limit;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Budget(
      {required this.id,
      required this.categoryId,
      required this.budgetPeriod,
      required this.limit,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['budget_period'] = Variable<String>(budgetPeriod);
    map['limit'] = Variable<double>(limit);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  BudgetsCompanion toCompanion(bool nullToAbsent) {
    return BudgetsCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      budgetPeriod: Value(budgetPeriod),
      limit: Value(limit),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Budget.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Budget(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      budgetPeriod: serializer.fromJson<String>(json['budgetPeriod']),
      limit: serializer.fromJson<double>(json['limit']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'budgetPeriod': serializer.toJson<String>(budgetPeriod),
      'limit': serializer.toJson<double>(limit),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Budget copyWith(
          {int? id,
          int? categoryId,
          String? budgetPeriod,
          double? limit,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Budget(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        budgetPeriod: budgetPeriod ?? this.budgetPeriod,
        limit: limit ?? this.limit,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Budget copyWithCompanion(BudgetsCompanion data) {
    return Budget(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      budgetPeriod: data.budgetPeriod.present
          ? data.budgetPeriod.value
          : this.budgetPeriod,
      limit: data.limit.present ? data.limit.value : this.limit,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Budget(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('budgetPeriod: $budgetPeriod, ')
          ..write('limit: $limit, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, categoryId, budgetPeriod, limit, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Budget &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.budgetPeriod == this.budgetPeriod &&
          other.limit == this.limit &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BudgetsCompanion extends UpdateCompanion<Budget> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<String> budgetPeriod;
  final Value<double> limit;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const BudgetsCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.budgetPeriod = const Value.absent(),
    this.limit = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BudgetsCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required String budgetPeriod,
    required double limit,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : categoryId = Value(categoryId),
        budgetPeriod = Value(budgetPeriod),
        limit = Value(limit);
  static Insertable<Budget> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? budgetPeriod,
    Expression<double>? limit,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (budgetPeriod != null) 'budget_period': budgetPeriod,
      if (limit != null) 'limit': limit,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BudgetsCompanion copyWith(
      {Value<int>? id,
      Value<int>? categoryId,
      Value<String>? budgetPeriod,
      Value<double>? limit,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return BudgetsCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      budgetPeriod: budgetPeriod ?? this.budgetPeriod,
      limit: limit ?? this.limit,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (budgetPeriod.present) {
      map['budget_period'] = Variable<String>(budgetPeriod.value);
    }
    if (limit.present) {
      map['limit'] = Variable<double>(limit.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BudgetsCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('budgetPeriod: $budgetPeriod, ')
          ..write('limit: $limit, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ExpensesTable extends Expenses with TableInfo<$ExpensesTable, Expense> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExpensesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES expense_categories (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounts (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _currencyIdMeta =
      const VerificationMeta('currencyId');
  @override
  late final GeneratedColumn<int> currencyId = GeneratedColumn<int>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES currencies (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      check: () => ComparableExpr(amount).isBiggerThanValue(0.0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>('transaction_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        categoryId,
        accountId,
        currencyId,
        amount,
        note,
        transactionDate,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'expenses';
  @override
  VerificationContext validateIntegrity(Insertable<Expense> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Expense map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Expense(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}currency_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      transactionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transaction_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ExpensesTable createAlias(String alias) {
    return $ExpensesTable(attachedDatabase, alias);
  }
}

class Expense extends DataClass implements Insertable<Expense> {
  final int id;
  final int categoryId;
  final int accountId;
  final int currencyId;
  final double amount;
  final String note;
  final DateTime transactionDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Expense(
      {required this.id,
      required this.categoryId,
      required this.accountId,
      required this.currencyId,
      required this.amount,
      required this.note,
      required this.transactionDate,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['account_id'] = Variable<int>(accountId);
    map['currency_id'] = Variable<int>(currencyId);
    map['amount'] = Variable<double>(amount);
    map['note'] = Variable<String>(note);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ExpensesCompanion toCompanion(bool nullToAbsent) {
    return ExpensesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      accountId: Value(accountId),
      currencyId: Value(currencyId),
      amount: Value(amount),
      note: Value(note),
      transactionDate: Value(transactionDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Expense.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Expense(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      currencyId: serializer.fromJson<int>(json['currencyId']),
      amount: serializer.fromJson<double>(json['amount']),
      note: serializer.fromJson<String>(json['note']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'accountId': serializer.toJson<int>(accountId),
      'currencyId': serializer.toJson<int>(currencyId),
      'amount': serializer.toJson<double>(amount),
      'note': serializer.toJson<String>(note),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Expense copyWith(
          {int? id,
          int? categoryId,
          int? accountId,
          int? currencyId,
          double? amount,
          String? note,
          DateTime? transactionDate,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Expense(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        accountId: accountId ?? this.accountId,
        currencyId: currencyId ?? this.currencyId,
        amount: amount ?? this.amount,
        note: note ?? this.note,
        transactionDate: transactionDate ?? this.transactionDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Expense copyWithCompanion(ExpensesCompanion data) {
    return Expense(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      currencyId:
          data.currencyId.present ? data.currencyId.value : this.currencyId,
      amount: data.amount.present ? data.amount.value : this.amount,
      note: data.note.present ? data.note.value : this.note,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Expense(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyId: $currencyId, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, accountId, currencyId, amount,
      note, transactionDate, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Expense &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.accountId == this.accountId &&
          other.currencyId == this.currencyId &&
          other.amount == this.amount &&
          other.note == this.note &&
          other.transactionDate == this.transactionDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ExpensesCompanion extends UpdateCompanion<Expense> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<int> accountId;
  final Value<int> currencyId;
  final Value<double> amount;
  final Value<String> note;
  final Value<DateTime> transactionDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ExpensesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ExpensesCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required int accountId,
    required int currencyId,
    required double amount,
    required String note,
    required DateTime transactionDate,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : categoryId = Value(categoryId),
        accountId = Value(accountId),
        currencyId = Value(currencyId),
        amount = Value(amount),
        note = Value(note),
        transactionDate = Value(transactionDate);
  static Insertable<Expense> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<int>? accountId,
    Expression<int>? currencyId,
    Expression<double>? amount,
    Expression<String>? note,
    Expression<DateTime>? transactionDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (accountId != null) 'account_id': accountId,
      if (currencyId != null) 'currency_id': currencyId,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ExpensesCompanion copyWith(
      {Value<int>? id,
      Value<int>? categoryId,
      Value<int>? accountId,
      Value<int>? currencyId,
      Value<double>? amount,
      Value<String>? note,
      Value<DateTime>? transactionDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ExpensesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      accountId: accountId ?? this.accountId,
      currencyId: currencyId ?? this.currencyId,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      transactionDate: transactionDate ?? this.transactionDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<int>(currencyId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExpensesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyId: $currencyId, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $IncomesTable extends Incomes with TableInfo<$IncomesTable, Income> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES income_categories (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _accountIdMeta =
      const VerificationMeta('accountId');
  @override
  late final GeneratedColumn<int> accountId = GeneratedColumn<int>(
      'account_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounts (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _currencyIdMeta =
      const VerificationMeta('currencyId');
  @override
  late final GeneratedColumn<int> currencyId = GeneratedColumn<int>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES currencies (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      check: () => ComparableExpr(amount).isBiggerThanValue(0.0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>('transaction_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        categoryId,
        accountId,
        currencyId,
        amount,
        note,
        transactionDate,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'incomes';
  @override
  VerificationContext validateIntegrity(Insertable<Income> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('account_id')) {
      context.handle(_accountIdMeta,
          accountId.isAcceptableOrUnknown(data['account_id']!, _accountIdMeta));
    } else if (isInserting) {
      context.missing(_accountIdMeta);
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Income map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Income(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      accountId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_id'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}currency_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      transactionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transaction_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $IncomesTable createAlias(String alias) {
    return $IncomesTable(attachedDatabase, alias);
  }
}

class Income extends DataClass implements Insertable<Income> {
  final int id;
  final int categoryId;
  final int accountId;
  final int currencyId;
  final double amount;
  final String note;
  final DateTime transactionDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Income(
      {required this.id,
      required this.categoryId,
      required this.accountId,
      required this.currencyId,
      required this.amount,
      required this.note,
      required this.transactionDate,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['category_id'] = Variable<int>(categoryId);
    map['account_id'] = Variable<int>(accountId);
    map['currency_id'] = Variable<int>(currencyId);
    map['amount'] = Variable<double>(amount);
    map['note'] = Variable<String>(note);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  IncomesCompanion toCompanion(bool nullToAbsent) {
    return IncomesCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      accountId: Value(accountId),
      currencyId: Value(currencyId),
      amount: Value(amount),
      note: Value(note),
      transactionDate: Value(transactionDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Income.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Income(
      id: serializer.fromJson<int>(json['id']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      accountId: serializer.fromJson<int>(json['accountId']),
      currencyId: serializer.fromJson<int>(json['currencyId']),
      amount: serializer.fromJson<double>(json['amount']),
      note: serializer.fromJson<String>(json['note']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'categoryId': serializer.toJson<int>(categoryId),
      'accountId': serializer.toJson<int>(accountId),
      'currencyId': serializer.toJson<int>(currencyId),
      'amount': serializer.toJson<double>(amount),
      'note': serializer.toJson<String>(note),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Income copyWith(
          {int? id,
          int? categoryId,
          int? accountId,
          int? currencyId,
          double? amount,
          String? note,
          DateTime? transactionDate,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Income(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        accountId: accountId ?? this.accountId,
        currencyId: currencyId ?? this.currencyId,
        amount: amount ?? this.amount,
        note: note ?? this.note,
        transactionDate: transactionDate ?? this.transactionDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Income copyWithCompanion(IncomesCompanion data) {
    return Income(
      id: data.id.present ? data.id.value : this.id,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      accountId: data.accountId.present ? data.accountId.value : this.accountId,
      currencyId:
          data.currencyId.present ? data.currencyId.value : this.currencyId,
      amount: data.amount.present ? data.amount.value : this.amount,
      note: data.note.present ? data.note.value : this.note,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Income(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyId: $currencyId, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, categoryId, accountId, currencyId, amount,
      note, transactionDate, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Income &&
          other.id == this.id &&
          other.categoryId == this.categoryId &&
          other.accountId == this.accountId &&
          other.currencyId == this.currencyId &&
          other.amount == this.amount &&
          other.note == this.note &&
          other.transactionDate == this.transactionDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class IncomesCompanion extends UpdateCompanion<Income> {
  final Value<int> id;
  final Value<int> categoryId;
  final Value<int> accountId;
  final Value<int> currencyId;
  final Value<double> amount;
  final Value<String> note;
  final Value<DateTime> transactionDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const IncomesCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.accountId = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.amount = const Value.absent(),
    this.note = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  IncomesCompanion.insert({
    this.id = const Value.absent(),
    required int categoryId,
    required int accountId,
    required int currencyId,
    required double amount,
    required String note,
    required DateTime transactionDate,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : categoryId = Value(categoryId),
        accountId = Value(accountId),
        currencyId = Value(currencyId),
        amount = Value(amount),
        note = Value(note),
        transactionDate = Value(transactionDate);
  static Insertable<Income> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<int>? accountId,
    Expression<int>? currencyId,
    Expression<double>? amount,
    Expression<String>? note,
    Expression<DateTime>? transactionDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (accountId != null) 'account_id': accountId,
      if (currencyId != null) 'currency_id': currencyId,
      if (amount != null) 'amount': amount,
      if (note != null) 'note': note,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  IncomesCompanion copyWith(
      {Value<int>? id,
      Value<int>? categoryId,
      Value<int>? accountId,
      Value<int>? currencyId,
      Value<double>? amount,
      Value<String>? note,
      Value<DateTime>? transactionDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return IncomesCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      accountId: accountId ?? this.accountId,
      currencyId: currencyId ?? this.currencyId,
      amount: amount ?? this.amount,
      note: note ?? this.note,
      transactionDate: transactionDate ?? this.transactionDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (accountId.present) {
      map['account_id'] = Variable<int>(accountId.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<int>(currencyId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomesCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('accountId: $accountId, ')
          ..write('currencyId: $currencyId, ')
          ..write('amount: $amount, ')
          ..write('note: $note, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $TransfersTable extends Transfers
    with TableInfo<$TransfersTable, Transfer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TransfersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _accountOriginMeta =
      const VerificationMeta('accountOrigin');
  @override
  late final GeneratedColumn<int> accountOrigin = GeneratedColumn<int>(
      'account_origin', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounts (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _accountDestinationMeta =
      const VerificationMeta('accountDestination');
  @override
  late final GeneratedColumn<int> accountDestination = GeneratedColumn<int>(
      'account_destination', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES accounts (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _currencyIdMeta =
      const VerificationMeta('currencyId');
  @override
  late final GeneratedColumn<int> currencyId = GeneratedColumn<int>(
      'currency_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES currencies (id) ON UPDATE CASCADE ON DELETE CASCADE'));
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, false,
      check: () => ComparableExpr(amount).isBiggerThanValue(0.0),
      type: DriftSqlType.double,
      requiredDuringInsert: true);
  static const VerificationMeta _feeMeta = const VerificationMeta('fee');
  @override
  late final GeneratedColumn<double> fee = GeneratedColumn<double>(
      'fee', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: Constant(0.0));
  static const VerificationMeta _noteMeta = const VerificationMeta('note');
  @override
  late final GeneratedColumn<String> note = GeneratedColumn<String>(
      'note', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _transactionDateMeta =
      const VerificationMeta('transactionDate');
  @override
  late final GeneratedColumn<DateTime> transactionDate =
      GeneratedColumn<DateTime>('transaction_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        accountOrigin,
        accountDestination,
        currencyId,
        amount,
        fee,
        note,
        transactionDate,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'transfers';
  @override
  VerificationContext validateIntegrity(Insertable<Transfer> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('account_origin')) {
      context.handle(
          _accountOriginMeta,
          accountOrigin.isAcceptableOrUnknown(
              data['account_origin']!, _accountOriginMeta));
    } else if (isInserting) {
      context.missing(_accountOriginMeta);
    }
    if (data.containsKey('account_destination')) {
      context.handle(
          _accountDestinationMeta,
          accountDestination.isAcceptableOrUnknown(
              data['account_destination']!, _accountDestinationMeta));
    } else if (isInserting) {
      context.missing(_accountDestinationMeta);
    }
    if (data.containsKey('currency_id')) {
      context.handle(
          _currencyIdMeta,
          currencyId.isAcceptableOrUnknown(
              data['currency_id']!, _currencyIdMeta));
    } else if (isInserting) {
      context.missing(_currencyIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('fee')) {
      context.handle(
          _feeMeta, fee.isAcceptableOrUnknown(data['fee']!, _feeMeta));
    }
    if (data.containsKey('note')) {
      context.handle(
          _noteMeta, note.isAcceptableOrUnknown(data['note']!, _noteMeta));
    } else if (isInserting) {
      context.missing(_noteMeta);
    }
    if (data.containsKey('transaction_date')) {
      context.handle(
          _transactionDateMeta,
          transactionDate.isAcceptableOrUnknown(
              data['transaction_date']!, _transactionDateMeta));
    } else if (isInserting) {
      context.missing(_transactionDateMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Transfer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Transfer(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      accountOrigin: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}account_origin'])!,
      accountDestination: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}account_destination'])!,
      currencyId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}currency_id'])!,
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount'])!,
      fee: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}fee'])!,
      note: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note'])!,
      transactionDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}transaction_date'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $TransfersTable createAlias(String alias) {
    return $TransfersTable(attachedDatabase, alias);
  }
}

class Transfer extends DataClass implements Insertable<Transfer> {
  final int id;
  final int accountOrigin;
  final int accountDestination;
  final int currencyId;
  final double amount;
  final double fee;
  final String note;
  final DateTime transactionDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  const Transfer(
      {required this.id,
      required this.accountOrigin,
      required this.accountDestination,
      required this.currencyId,
      required this.amount,
      required this.fee,
      required this.note,
      required this.transactionDate,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['account_origin'] = Variable<int>(accountOrigin);
    map['account_destination'] = Variable<int>(accountDestination);
    map['currency_id'] = Variable<int>(currencyId);
    map['amount'] = Variable<double>(amount);
    map['fee'] = Variable<double>(fee);
    map['note'] = Variable<String>(note);
    map['transaction_date'] = Variable<DateTime>(transactionDate);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  TransfersCompanion toCompanion(bool nullToAbsent) {
    return TransfersCompanion(
      id: Value(id),
      accountOrigin: Value(accountOrigin),
      accountDestination: Value(accountDestination),
      currencyId: Value(currencyId),
      amount: Value(amount),
      fee: Value(fee),
      note: Value(note),
      transactionDate: Value(transactionDate),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Transfer.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Transfer(
      id: serializer.fromJson<int>(json['id']),
      accountOrigin: serializer.fromJson<int>(json['accountOrigin']),
      accountDestination: serializer.fromJson<int>(json['accountDestination']),
      currencyId: serializer.fromJson<int>(json['currencyId']),
      amount: serializer.fromJson<double>(json['amount']),
      fee: serializer.fromJson<double>(json['fee']),
      note: serializer.fromJson<String>(json['note']),
      transactionDate: serializer.fromJson<DateTime>(json['transactionDate']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'accountOrigin': serializer.toJson<int>(accountOrigin),
      'accountDestination': serializer.toJson<int>(accountDestination),
      'currencyId': serializer.toJson<int>(currencyId),
      'amount': serializer.toJson<double>(amount),
      'fee': serializer.toJson<double>(fee),
      'note': serializer.toJson<String>(note),
      'transactionDate': serializer.toJson<DateTime>(transactionDate),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  Transfer copyWith(
          {int? id,
          int? accountOrigin,
          int? accountDestination,
          int? currencyId,
          double? amount,
          double? fee,
          String? note,
          DateTime? transactionDate,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Transfer(
        id: id ?? this.id,
        accountOrigin: accountOrigin ?? this.accountOrigin,
        accountDestination: accountDestination ?? this.accountDestination,
        currencyId: currencyId ?? this.currencyId,
        amount: amount ?? this.amount,
        fee: fee ?? this.fee,
        note: note ?? this.note,
        transactionDate: transactionDate ?? this.transactionDate,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  Transfer copyWithCompanion(TransfersCompanion data) {
    return Transfer(
      id: data.id.present ? data.id.value : this.id,
      accountOrigin: data.accountOrigin.present
          ? data.accountOrigin.value
          : this.accountOrigin,
      accountDestination: data.accountDestination.present
          ? data.accountDestination.value
          : this.accountDestination,
      currencyId:
          data.currencyId.present ? data.currencyId.value : this.currencyId,
      amount: data.amount.present ? data.amount.value : this.amount,
      fee: data.fee.present ? data.fee.value : this.fee,
      note: data.note.present ? data.note.value : this.note,
      transactionDate: data.transactionDate.present
          ? data.transactionDate.value
          : this.transactionDate,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Transfer(')
          ..write('id: $id, ')
          ..write('accountOrigin: $accountOrigin, ')
          ..write('accountDestination: $accountDestination, ')
          ..write('currencyId: $currencyId, ')
          ..write('amount: $amount, ')
          ..write('fee: $fee, ')
          ..write('note: $note, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, accountOrigin, accountDestination,
      currencyId, amount, fee, note, transactionDate, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Transfer &&
          other.id == this.id &&
          other.accountOrigin == this.accountOrigin &&
          other.accountDestination == this.accountDestination &&
          other.currencyId == this.currencyId &&
          other.amount == this.amount &&
          other.fee == this.fee &&
          other.note == this.note &&
          other.transactionDate == this.transactionDate &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class TransfersCompanion extends UpdateCompanion<Transfer> {
  final Value<int> id;
  final Value<int> accountOrigin;
  final Value<int> accountDestination;
  final Value<int> currencyId;
  final Value<double> amount;
  final Value<double> fee;
  final Value<String> note;
  final Value<DateTime> transactionDate;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const TransfersCompanion({
    this.id = const Value.absent(),
    this.accountOrigin = const Value.absent(),
    this.accountDestination = const Value.absent(),
    this.currencyId = const Value.absent(),
    this.amount = const Value.absent(),
    this.fee = const Value.absent(),
    this.note = const Value.absent(),
    this.transactionDate = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  TransfersCompanion.insert({
    this.id = const Value.absent(),
    required int accountOrigin,
    required int accountDestination,
    required int currencyId,
    required double amount,
    this.fee = const Value.absent(),
    required String note,
    required DateTime transactionDate,
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  })  : accountOrigin = Value(accountOrigin),
        accountDestination = Value(accountDestination),
        currencyId = Value(currencyId),
        amount = Value(amount),
        note = Value(note),
        transactionDate = Value(transactionDate);
  static Insertable<Transfer> custom({
    Expression<int>? id,
    Expression<int>? accountOrigin,
    Expression<int>? accountDestination,
    Expression<int>? currencyId,
    Expression<double>? amount,
    Expression<double>? fee,
    Expression<String>? note,
    Expression<DateTime>? transactionDate,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (accountOrigin != null) 'account_origin': accountOrigin,
      if (accountDestination != null) 'account_destination': accountDestination,
      if (currencyId != null) 'currency_id': currencyId,
      if (amount != null) 'amount': amount,
      if (fee != null) 'fee': fee,
      if (note != null) 'note': note,
      if (transactionDate != null) 'transaction_date': transactionDate,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  TransfersCompanion copyWith(
      {Value<int>? id,
      Value<int>? accountOrigin,
      Value<int>? accountDestination,
      Value<int>? currencyId,
      Value<double>? amount,
      Value<double>? fee,
      Value<String>? note,
      Value<DateTime>? transactionDate,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return TransfersCompanion(
      id: id ?? this.id,
      accountOrigin: accountOrigin ?? this.accountOrigin,
      accountDestination: accountDestination ?? this.accountDestination,
      currencyId: currencyId ?? this.currencyId,
      amount: amount ?? this.amount,
      fee: fee ?? this.fee,
      note: note ?? this.note,
      transactionDate: transactionDate ?? this.transactionDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (accountOrigin.present) {
      map['account_origin'] = Variable<int>(accountOrigin.value);
    }
    if (accountDestination.present) {
      map['account_destination'] = Variable<int>(accountDestination.value);
    }
    if (currencyId.present) {
      map['currency_id'] = Variable<int>(currencyId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (fee.present) {
      map['fee'] = Variable<double>(fee.value);
    }
    if (note.present) {
      map['note'] = Variable<String>(note.value);
    }
    if (transactionDate.present) {
      map['transaction_date'] = Variable<DateTime>(transactionDate.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TransfersCompanion(')
          ..write('id: $id, ')
          ..write('accountOrigin: $accountOrigin, ')
          ..write('accountDestination: $accountDestination, ')
          ..write('currencyId: $currencyId, ')
          ..write('amount: $amount, ')
          ..write('fee: $fee, ')
          ..write('note: $note, ')
          ..write('transactionDate: $transactionDate, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ExpenseCategoriesTable expenseCategories =
      $ExpenseCategoriesTable(this);
  late final $IncomeCategoriesTable incomeCategories =
      $IncomeCategoriesTable(this);
  late final $CurrenciesTable currencies = $CurrenciesTable(this);
  late final $AccountGroupsTable accountGroups = $AccountGroupsTable(this);
  late final $AccountsTable accounts = $AccountsTable(this);
  late final $BudgetsTable budgets = $BudgetsTable(this);
  late final $ExpensesTable expenses = $ExpensesTable(this);
  late final $IncomesTable incomes = $IncomesTable(this);
  late final $TransfersTable transfers = $TransfersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        expenseCategories,
        incomeCategories,
        currencies,
        accountGroups,
        accounts,
        budgets,
        expenses,
        incomes,
        transfers
      ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules(
        [
          WritePropagation(
            on: TableUpdateQuery.onTableName('account_groups',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('accounts', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('account_groups',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('accounts', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('expense_categories',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('budgets', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('expense_categories',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('budgets', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('expense_categories',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('expenses', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('expense_categories',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('expenses', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('accounts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('expenses', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('accounts',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('expenses', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('currencies',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('expenses', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('currencies',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('expenses', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('income_categories',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('incomes', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('income_categories',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('incomes', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('accounts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('incomes', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('accounts',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('incomes', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('currencies',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('incomes', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('currencies',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('incomes', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('accounts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('transfers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('accounts',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('transfers', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('accounts',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('transfers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('accounts',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('transfers', kind: UpdateKind.update),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('currencies',
                limitUpdateKind: UpdateKind.delete),
            result: [
              TableUpdate('transfers', kind: UpdateKind.delete),
            ],
          ),
          WritePropagation(
            on: TableUpdateQuery.onTableName('currencies',
                limitUpdateKind: UpdateKind.update),
            result: [
              TableUpdate('transfers', kind: UpdateKind.update),
            ],
          ),
        ],
      );
}

typedef $$ExpenseCategoriesTableCreateCompanionBuilder
    = ExpenseCategoriesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  required int order,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ExpenseCategoriesTableUpdateCompanionBuilder
    = ExpenseCategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<int> order,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$ExpenseCategoriesTableReferences extends BaseReferences<
    _$AppDatabase, $ExpenseCategoriesTable, ExpenseCategory> {
  $$ExpenseCategoriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BudgetsTable, List<Budget>> _budgetsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.budgets,
          aliasName: $_aliasNameGenerator(
              db.expenseCategories.id, db.budgets.categoryId));

  $$BudgetsTableProcessedTableManager get budgetsRefs {
    final manager = $$BudgetsTableTableManager($_db, $_db.budgets)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_budgetsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.expenses,
          aliasName: $_aliasNameGenerator(
              db.expenseCategories.id, db.expenses.categoryId));

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager($_db, $_db.expenses)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ExpenseCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTable> {
  $$ExpenseCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> budgetsRefs(
      Expression<bool> Function($$BudgetsTableFilterComposer f) f) {
    final $$BudgetsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.budgets,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableFilterComposer(
              $db: $db,
              $table: $db.budgets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> expensesRefs(
      Expression<bool> Function($$ExpensesTableFilterComposer f) f) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableFilterComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExpenseCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTable> {
  $$ExpenseCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ExpenseCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpenseCategoriesTable> {
  $$ExpenseCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> budgetsRefs<T extends Object>(
      Expression<T> Function($$BudgetsTableAnnotationComposer a) f) {
    final $$BudgetsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.budgets,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BudgetsTableAnnotationComposer(
              $db: $db,
              $table: $db.budgets,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> expensesRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableAnnotationComposer a) f) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ExpenseCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpenseCategoriesTable,
    ExpenseCategory,
    $$ExpenseCategoriesTableFilterComposer,
    $$ExpenseCategoriesTableOrderingComposer,
    $$ExpenseCategoriesTableAnnotationComposer,
    $$ExpenseCategoriesTableCreateCompanionBuilder,
    $$ExpenseCategoriesTableUpdateCompanionBuilder,
    (ExpenseCategory, $$ExpenseCategoriesTableReferences),
    ExpenseCategory,
    PrefetchHooks Function({bool budgetsRefs, bool expensesRefs})> {
  $$ExpenseCategoriesTableTableManager(
      _$AppDatabase db, $ExpenseCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpenseCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpenseCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpenseCategoriesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ExpenseCategoriesCompanion(
            id: id,
            name: name,
            description: description,
            order: order,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            required int order,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ExpenseCategoriesCompanion.insert(
            id: id,
            name: name,
            description: description,
            order: order,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ExpenseCategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({budgetsRefs = false, expensesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (budgetsRefs) db.budgets,
                if (expensesRefs) db.expenses
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (budgetsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ExpenseCategoriesTableReferences
                            ._budgetsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExpenseCategoriesTableReferences(db, table, p0)
                                .budgetsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items),
                  if (expensesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$ExpenseCategoriesTableReferences
                            ._expensesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ExpenseCategoriesTableReferences(db, table, p0)
                                .expensesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ExpenseCategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExpenseCategoriesTable,
    ExpenseCategory,
    $$ExpenseCategoriesTableFilterComposer,
    $$ExpenseCategoriesTableOrderingComposer,
    $$ExpenseCategoriesTableAnnotationComposer,
    $$ExpenseCategoriesTableCreateCompanionBuilder,
    $$ExpenseCategoriesTableUpdateCompanionBuilder,
    (ExpenseCategory, $$ExpenseCategoriesTableReferences),
    ExpenseCategory,
    PrefetchHooks Function({bool budgetsRefs, bool expensesRefs})>;
typedef $$IncomeCategoriesTableCreateCompanionBuilder
    = IncomeCategoriesCompanion Function({
  Value<int> id,
  required String name,
  Value<String?> description,
  required int order,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$IncomeCategoriesTableUpdateCompanionBuilder
    = IncomeCategoriesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String?> description,
  Value<int> order,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$IncomeCategoriesTableReferences extends BaseReferences<
    _$AppDatabase, $IncomeCategoriesTable, IncomeCategory> {
  $$IncomeCategoriesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IncomesTable, List<Income>> _incomesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.incomes,
          aliasName: $_aliasNameGenerator(
              db.incomeCategories.id, db.incomes.categoryId));

  $$IncomesTableProcessedTableManager get incomesRefs {
    final manager = $$IncomesTableTableManager($_db, $_db.incomes)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$IncomeCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $IncomeCategoriesTable> {
  $$IncomeCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> incomesRefs(
      Expression<bool> Function($$IncomesTableFilterComposer f) f) {
    final $$IncomesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomes,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableFilterComposer(
              $db: $db,
              $table: $db.incomes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IncomeCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomeCategoriesTable> {
  $$IncomeCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$IncomeCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomeCategoriesTable> {
  $$IncomeCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> incomesRefs<T extends Object>(
      Expression<T> Function($$IncomesTableAnnotationComposer a) f) {
    final $$IncomesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomes,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableAnnotationComposer(
              $db: $db,
              $table: $db.incomes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IncomeCategoriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IncomeCategoriesTable,
    IncomeCategory,
    $$IncomeCategoriesTableFilterComposer,
    $$IncomeCategoriesTableOrderingComposer,
    $$IncomeCategoriesTableAnnotationComposer,
    $$IncomeCategoriesTableCreateCompanionBuilder,
    $$IncomeCategoriesTableUpdateCompanionBuilder,
    (IncomeCategory, $$IncomeCategoriesTableReferences),
    IncomeCategory,
    PrefetchHooks Function({bool incomesRefs})> {
  $$IncomeCategoriesTableTableManager(
      _$AppDatabase db, $IncomeCategoriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomeCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomeCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomeCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              IncomeCategoriesCompanion(
            id: id,
            name: name,
            description: description,
            order: order,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> description = const Value.absent(),
            required int order,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              IncomeCategoriesCompanion.insert(
            id: id,
            name: name,
            description: description,
            order: order,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IncomeCategoriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({incomesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (incomesRefs) db.incomes],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (incomesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$IncomeCategoriesTableReferences
                            ._incomesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$IncomeCategoriesTableReferences(db, table, p0)
                                .incomesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$IncomeCategoriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IncomeCategoriesTable,
    IncomeCategory,
    $$IncomeCategoriesTableFilterComposer,
    $$IncomeCategoriesTableOrderingComposer,
    $$IncomeCategoriesTableAnnotationComposer,
    $$IncomeCategoriesTableCreateCompanionBuilder,
    $$IncomeCategoriesTableUpdateCompanionBuilder,
    (IncomeCategory, $$IncomeCategoriesTableReferences),
    IncomeCategory,
    PrefetchHooks Function({bool incomesRefs})>;
typedef $$CurrenciesTableCreateCompanionBuilder = CurrenciesCompanion Function({
  Value<int> id,
  required String name,
  required String code,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$CurrenciesTableUpdateCompanionBuilder = CurrenciesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> code,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$CurrenciesTableReferences
    extends BaseReferences<_$AppDatabase, $CurrenciesTable, Currency> {
  $$CurrenciesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.expenses,
          aliasName:
              $_aliasNameGenerator(db.currencies.id, db.expenses.currencyId));

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager($_db, $_db.expenses)
        .filter((f) => f.currencyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$IncomesTable, List<Income>> _incomesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.incomes,
          aliasName:
              $_aliasNameGenerator(db.currencies.id, db.incomes.currencyId));

  $$IncomesTableProcessedTableManager get incomesRefs {
    final manager = $$IncomesTableTableManager($_db, $_db.incomes)
        .filter((f) => f.currencyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TransfersTable, List<Transfer>>
      _transfersRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.transfers,
          aliasName:
              $_aliasNameGenerator(db.currencies.id, db.transfers.currencyId));

  $$TransfersTableProcessedTableManager get transfersRefs {
    final manager = $$TransfersTableTableManager($_db, $_db.transfers)
        .filter((f) => f.currencyId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_transfersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CurrenciesTableFilterComposer
    extends Composer<_$AppDatabase, $CurrenciesTable> {
  $$CurrenciesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> expensesRefs(
      Expression<bool> Function($$ExpensesTableFilterComposer f) f) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.currencyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableFilterComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> incomesRefs(
      Expression<bool> Function($$IncomesTableFilterComposer f) f) {
    final $$IncomesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomes,
        getReferencedColumn: (t) => t.currencyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableFilterComposer(
              $db: $db,
              $table: $db.incomes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> transfersRefs(
      Expression<bool> Function($$TransfersTableFilterComposer f) f) {
    final $$TransfersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transfers,
        getReferencedColumn: (t) => t.currencyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransfersTableFilterComposer(
              $db: $db,
              $table: $db.transfers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CurrenciesTableOrderingComposer
    extends Composer<_$AppDatabase, $CurrenciesTable> {
  $$CurrenciesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$CurrenciesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CurrenciesTable> {
  $$CurrenciesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> expensesRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableAnnotationComposer a) f) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.currencyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> incomesRefs<T extends Object>(
      Expression<T> Function($$IncomesTableAnnotationComposer a) f) {
    final $$IncomesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomes,
        getReferencedColumn: (t) => t.currencyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableAnnotationComposer(
              $db: $db,
              $table: $db.incomes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> transfersRefs<T extends Object>(
      Expression<T> Function($$TransfersTableAnnotationComposer a) f) {
    final $$TransfersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.transfers,
        getReferencedColumn: (t) => t.currencyId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TransfersTableAnnotationComposer(
              $db: $db,
              $table: $db.transfers,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CurrenciesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CurrenciesTable,
    Currency,
    $$CurrenciesTableFilterComposer,
    $$CurrenciesTableOrderingComposer,
    $$CurrenciesTableAnnotationComposer,
    $$CurrenciesTableCreateCompanionBuilder,
    $$CurrenciesTableUpdateCompanionBuilder,
    (Currency, $$CurrenciesTableReferences),
    Currency,
    PrefetchHooks Function(
        {bool expensesRefs, bool incomesRefs, bool transfersRefs})> {
  $$CurrenciesTableTableManager(_$AppDatabase db, $CurrenciesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CurrenciesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CurrenciesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CurrenciesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> code = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CurrenciesCompanion(
            id: id,
            name: name,
            code: code,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String code,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              CurrenciesCompanion.insert(
            id: id,
            name: name,
            code: code,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CurrenciesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {expensesRefs = false,
              incomesRefs = false,
              transfersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (expensesRefs) db.expenses,
                if (incomesRefs) db.incomes,
                if (transfersRefs) db.transfers
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expensesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CurrenciesTableReferences._expensesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CurrenciesTableReferences(db, table, p0)
                                .expensesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.currencyId == item.id),
                        typedResults: items),
                  if (incomesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CurrenciesTableReferences._incomesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CurrenciesTableReferences(db, table, p0)
                                .incomesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.currencyId == item.id),
                        typedResults: items),
                  if (transfersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$CurrenciesTableReferences._transfersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CurrenciesTableReferences(db, table, p0)
                                .transfersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.currencyId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CurrenciesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CurrenciesTable,
    Currency,
    $$CurrenciesTableFilterComposer,
    $$CurrenciesTableOrderingComposer,
    $$CurrenciesTableAnnotationComposer,
    $$CurrenciesTableCreateCompanionBuilder,
    $$CurrenciesTableUpdateCompanionBuilder,
    (Currency, $$CurrenciesTableReferences),
    Currency,
    PrefetchHooks Function(
        {bool expensesRefs, bool incomesRefs, bool transfersRefs})>;
typedef $$AccountGroupsTableCreateCompanionBuilder = AccountGroupsCompanion
    Function({
  Value<int> id,
  required String name,
  required int order,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$AccountGroupsTableUpdateCompanionBuilder = AccountGroupsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<int> order,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$AccountGroupsTableReferences
    extends BaseReferences<_$AppDatabase, $AccountGroupsTable, AccountGroup> {
  $$AccountGroupsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$AccountsTable, List<Account>> _accountsRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.accounts,
          aliasName: $_aliasNameGenerator(
              db.accountGroups.id, db.accounts.accountGroupId));

  $$AccountsTableProcessedTableManager get accountsRefs {
    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.accountGroupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_accountsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AccountGroupsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountGroupsTable> {
  $$AccountGroupsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> accountsRefs(
      Expression<bool> Function($$AccountsTableFilterComposer f) f) {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.accountGroupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountGroupsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountGroupsTable> {
  $$AccountGroupsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$AccountGroupsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountGroupsTable> {
  $$AccountGroupsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> accountsRefs<T extends Object>(
      Expression<T> Function($$AccountsTableAnnotationComposer a) f) {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.accountGroupId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountGroupsTable,
    AccountGroup,
    $$AccountGroupsTableFilterComposer,
    $$AccountGroupsTableOrderingComposer,
    $$AccountGroupsTableAnnotationComposer,
    $$AccountGroupsTableCreateCompanionBuilder,
    $$AccountGroupsTableUpdateCompanionBuilder,
    (AccountGroup, $$AccountGroupsTableReferences),
    AccountGroup,
    PrefetchHooks Function({bool accountsRefs})> {
  $$AccountGroupsTableTableManager(_$AppDatabase db, $AccountGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountGroupsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountGroupsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountGroupsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              AccountGroupsCompanion(
            id: id,
            name: name,
            order: order,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int order,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              AccountGroupsCompanion.insert(
            id: id,
            name: name,
            order: order,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$AccountGroupsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({accountsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (accountsRefs) db.accounts],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (accountsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$AccountGroupsTableReferences
                            ._accountsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountGroupsTableReferences(db, table, p0)
                                .accountsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.accountGroupId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AccountGroupsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountGroupsTable,
    AccountGroup,
    $$AccountGroupsTableFilterComposer,
    $$AccountGroupsTableOrderingComposer,
    $$AccountGroupsTableAnnotationComposer,
    $$AccountGroupsTableCreateCompanionBuilder,
    $$AccountGroupsTableUpdateCompanionBuilder,
    (AccountGroup, $$AccountGroupsTableReferences),
    AccountGroup,
    PrefetchHooks Function({bool accountsRefs})>;
typedef $$AccountsTableCreateCompanionBuilder = AccountsCompanion Function({
  Value<int> id,
  required int accountGroupId,
  required String name,
  required int order,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$AccountsTableUpdateCompanionBuilder = AccountsCompanion Function({
  Value<int> id,
  Value<int> accountGroupId,
  Value<String> name,
  Value<int> order,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$AccountsTableReferences
    extends BaseReferences<_$AppDatabase, $AccountsTable, Account> {
  $$AccountsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountGroupsTable _accountGroupIdTable(_$AppDatabase db) =>
      db.accountGroups.createAlias($_aliasNameGenerator(
          db.accounts.accountGroupId, db.accountGroups.id));

  $$AccountGroupsTableProcessedTableManager get accountGroupId {
    final $_column = $_itemColumn<int>('account_group_id')!;

    final manager = $$AccountGroupsTableTableManager($_db, $_db.accountGroups)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ExpensesTable, List<Expense>> _expensesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.expenses,
          aliasName:
              $_aliasNameGenerator(db.accounts.id, db.expenses.accountId));

  $$ExpensesTableProcessedTableManager get expensesRefs {
    final manager = $$ExpensesTableTableManager($_db, $_db.expenses)
        .filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_expensesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$IncomesTable, List<Income>> _incomesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.incomes,
          aliasName:
              $_aliasNameGenerator(db.accounts.id, db.incomes.accountId));

  $$IncomesTableProcessedTableManager get incomesRefs {
    final manager = $$IncomesTableTableManager($_db, $_db.incomes)
        .filter((f) => f.accountId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_incomesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$AccountsTableFilterComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$AccountGroupsTableFilterComposer get accountGroupId {
    final $$AccountGroupsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountGroupId,
        referencedTable: $db.accountGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountGroupsTableFilterComposer(
              $db: $db,
              $table: $db.accountGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> expensesRefs(
      Expression<bool> Function($$ExpensesTableFilterComposer f) f) {
    final $$ExpensesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.accountId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableFilterComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> incomesRefs(
      Expression<bool> Function($$IncomesTableFilterComposer f) f) {
    final $$IncomesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomes,
        getReferencedColumn: (t) => t.accountId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableFilterComposer(
              $db: $db,
              $table: $db.incomes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountsTableOrderingComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$AccountGroupsTableOrderingComposer get accountGroupId {
    final $$AccountGroupsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountGroupId,
        referencedTable: $db.accountGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountGroupsTableOrderingComposer(
              $db: $db,
              $table: $db.accountGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$AccountsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AccountsTable> {
  $$AccountsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AccountGroupsTableAnnotationComposer get accountGroupId {
    final $$AccountGroupsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountGroupId,
        referencedTable: $db.accountGroups,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountGroupsTableAnnotationComposer(
              $db: $db,
              $table: $db.accountGroups,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> expensesRefs<T extends Object>(
      Expression<T> Function($$ExpensesTableAnnotationComposer a) f) {
    final $$ExpensesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.expenses,
        getReferencedColumn: (t) => t.accountId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpensesTableAnnotationComposer(
              $db: $db,
              $table: $db.expenses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> incomesRefs<T extends Object>(
      Expression<T> Function($$IncomesTableAnnotationComposer a) f) {
    final $$IncomesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.incomes,
        getReferencedColumn: (t) => t.accountId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomesTableAnnotationComposer(
              $db: $db,
              $table: $db.incomes,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$AccountsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AccountsTable,
    Account,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (Account, $$AccountsTableReferences),
    Account,
    PrefetchHooks Function(
        {bool accountGroupId, bool expensesRefs, bool incomesRefs})> {
  $$AccountsTableTableManager(_$AppDatabase db, $AccountsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AccountsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AccountsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AccountsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> accountGroupId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              AccountsCompanion(
            id: id,
            accountGroupId: accountGroupId,
            name: name,
            order: order,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int accountGroupId,
            required String name,
            required int order,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              AccountsCompanion.insert(
            id: id,
            accountGroupId: accountGroupId,
            name: name,
            order: order,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$AccountsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {accountGroupId = false,
              expensesRefs = false,
              incomesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (expensesRefs) db.expenses,
                if (incomesRefs) db.incomes
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (accountGroupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountGroupId,
                    referencedTable:
                        $$AccountsTableReferences._accountGroupIdTable(db),
                    referencedColumn:
                        $$AccountsTableReferences._accountGroupIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (expensesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$AccountsTableReferences._expensesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountsTableReferences(db, table, p0)
                                .expensesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.accountId == item.id),
                        typedResults: items),
                  if (incomesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$AccountsTableReferences._incomesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$AccountsTableReferences(db, table, p0)
                                .incomesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.accountId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$AccountsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AccountsTable,
    Account,
    $$AccountsTableFilterComposer,
    $$AccountsTableOrderingComposer,
    $$AccountsTableAnnotationComposer,
    $$AccountsTableCreateCompanionBuilder,
    $$AccountsTableUpdateCompanionBuilder,
    (Account, $$AccountsTableReferences),
    Account,
    PrefetchHooks Function(
        {bool accountGroupId, bool expensesRefs, bool incomesRefs})>;
typedef $$BudgetsTableCreateCompanionBuilder = BudgetsCompanion Function({
  Value<int> id,
  required int categoryId,
  required String budgetPeriod,
  required double limit,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$BudgetsTableUpdateCompanionBuilder = BudgetsCompanion Function({
  Value<int> id,
  Value<int> categoryId,
  Value<String> budgetPeriod,
  Value<double> limit,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$BudgetsTableReferences
    extends BaseReferences<_$AppDatabase, $BudgetsTable, Budget> {
  $$BudgetsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExpenseCategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.expenseCategories.createAlias(
          $_aliasNameGenerator(db.budgets.categoryId, db.expenseCategories.id));

  $$ExpenseCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager =
        $$ExpenseCategoriesTableTableManager($_db, $_db.expenseCategories)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BudgetsTableFilterComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get budgetPeriod => $composableBuilder(
      column: $table.budgetPeriod, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get limit => $composableBuilder(
      column: $table.limit, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$ExpenseCategoriesTableFilterComposer get categoryId {
    final $$ExpenseCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.expenseCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseCategoriesTableFilterComposer(
              $db: $db,
              $table: $db.expenseCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BudgetsTableOrderingComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get budgetPeriod => $composableBuilder(
      column: $table.budgetPeriod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get limit => $composableBuilder(
      column: $table.limit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$ExpenseCategoriesTableOrderingComposer get categoryId {
    final $$ExpenseCategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.expenseCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseCategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.expenseCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BudgetsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BudgetsTable> {
  $$BudgetsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get budgetPeriod => $composableBuilder(
      column: $table.budgetPeriod, builder: (column) => column);

  GeneratedColumn<double> get limit =>
      $composableBuilder(column: $table.limit, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ExpenseCategoriesTableAnnotationComposer get categoryId {
    final $$ExpenseCategoriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.expenseCategories,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ExpenseCategoriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.expenseCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$BudgetsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget, $$BudgetsTableReferences),
    Budget,
    PrefetchHooks Function({bool categoryId})> {
  $$BudgetsTableTableManager(_$AppDatabase db, $BudgetsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BudgetsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BudgetsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BudgetsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<String> budgetPeriod = const Value.absent(),
            Value<double> limit = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BudgetsCompanion(
            id: id,
            categoryId: categoryId,
            budgetPeriod: budgetPeriod,
            limit: limit,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int categoryId,
            required String budgetPeriod,
            required double limit,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              BudgetsCompanion.insert(
            id: id,
            categoryId: categoryId,
            budgetPeriod: budgetPeriod,
            limit: limit,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$BudgetsTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({categoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$BudgetsTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$BudgetsTableReferences._categoryIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BudgetsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BudgetsTable,
    Budget,
    $$BudgetsTableFilterComposer,
    $$BudgetsTableOrderingComposer,
    $$BudgetsTableAnnotationComposer,
    $$BudgetsTableCreateCompanionBuilder,
    $$BudgetsTableUpdateCompanionBuilder,
    (Budget, $$BudgetsTableReferences),
    Budget,
    PrefetchHooks Function({bool categoryId})>;
typedef $$ExpensesTableCreateCompanionBuilder = ExpensesCompanion Function({
  Value<int> id,
  required int categoryId,
  required int accountId,
  required int currencyId,
  required double amount,
  required String note,
  required DateTime transactionDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$ExpensesTableUpdateCompanionBuilder = ExpensesCompanion Function({
  Value<int> id,
  Value<int> categoryId,
  Value<int> accountId,
  Value<int> currencyId,
  Value<double> amount,
  Value<String> note,
  Value<DateTime> transactionDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$ExpensesTableReferences
    extends BaseReferences<_$AppDatabase, $ExpensesTable, Expense> {
  $$ExpensesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ExpenseCategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.expenseCategories.createAlias($_aliasNameGenerator(
          db.expenses.categoryId, db.expenseCategories.id));

  $$ExpenseCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager =
        $$ExpenseCategoriesTableTableManager($_db, $_db.expenseCategories)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AccountsTable _accountIdTable(_$AppDatabase db) => db.accounts
      .createAlias($_aliasNameGenerator(db.expenses.accountId, db.accounts.id));

  $$AccountsTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CurrenciesTable _currencyIdTable(_$AppDatabase db) =>
      db.currencies.createAlias(
          $_aliasNameGenerator(db.expenses.currencyId, db.currencies.id));

  $$CurrenciesTableProcessedTableManager get currencyId {
    final $_column = $_itemColumn<int>('currency_id')!;

    final manager = $$CurrenciesTableTableManager($_db, $_db.currencies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ExpensesTableFilterComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$ExpenseCategoriesTableFilterComposer get categoryId {
    final $$ExpenseCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.expenseCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseCategoriesTableFilterComposer(
              $db: $db,
              $table: $db.expenseCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableFilterComposer get accountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CurrenciesTableFilterComposer get currencyId {
    final $$CurrenciesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyId,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CurrenciesTableFilterComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableOrderingComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$ExpenseCategoriesTableOrderingComposer get categoryId {
    final $$ExpenseCategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.expenseCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ExpenseCategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.expenseCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableOrderingComposer get accountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CurrenciesTableOrderingComposer get currencyId {
    final $$CurrenciesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyId,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CurrenciesTableOrderingComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExpensesTable> {
  $$ExpensesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$ExpenseCategoriesTableAnnotationComposer get categoryId {
    final $$ExpenseCategoriesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.categoryId,
            referencedTable: $db.expenseCategories,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ExpenseCategoriesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.expenseCategories,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }

  $$AccountsTableAnnotationComposer get accountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CurrenciesTableAnnotationComposer get currencyId {
    final $$CurrenciesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyId,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CurrenciesTableAnnotationComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ExpensesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (Expense, $$ExpensesTableReferences),
    Expense,
    PrefetchHooks Function(
        {bool categoryId, bool accountId, bool currencyId})> {
  $$ExpensesTableTableManager(_$AppDatabase db, $ExpensesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExpensesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ExpensesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExpensesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<int> accountId = const Value.absent(),
            Value<int> currencyId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<DateTime> transactionDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ExpensesCompanion(
            id: id,
            categoryId: categoryId,
            accountId: accountId,
            currencyId: currencyId,
            amount: amount,
            note: note,
            transactionDate: transactionDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int categoryId,
            required int accountId,
            required int currencyId,
            required double amount,
            required String note,
            required DateTime transactionDate,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ExpensesCompanion.insert(
            id: id,
            categoryId: categoryId,
            accountId: accountId,
            currencyId: currencyId,
            amount: amount,
            note: note,
            transactionDate: transactionDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$ExpensesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false, accountId = false, currencyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$ExpensesTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$ExpensesTableReferences._categoryIdTable(db).id,
                  ) as T;
                }
                if (accountId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountId,
                    referencedTable:
                        $$ExpensesTableReferences._accountIdTable(db),
                    referencedColumn:
                        $$ExpensesTableReferences._accountIdTable(db).id,
                  ) as T;
                }
                if (currencyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.currencyId,
                    referencedTable:
                        $$ExpensesTableReferences._currencyIdTable(db),
                    referencedColumn:
                        $$ExpensesTableReferences._currencyIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ExpensesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ExpensesTable,
    Expense,
    $$ExpensesTableFilterComposer,
    $$ExpensesTableOrderingComposer,
    $$ExpensesTableAnnotationComposer,
    $$ExpensesTableCreateCompanionBuilder,
    $$ExpensesTableUpdateCompanionBuilder,
    (Expense, $$ExpensesTableReferences),
    Expense,
    PrefetchHooks Function({bool categoryId, bool accountId, bool currencyId})>;
typedef $$IncomesTableCreateCompanionBuilder = IncomesCompanion Function({
  Value<int> id,
  required int categoryId,
  required int accountId,
  required int currencyId,
  required double amount,
  required String note,
  required DateTime transactionDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$IncomesTableUpdateCompanionBuilder = IncomesCompanion Function({
  Value<int> id,
  Value<int> categoryId,
  Value<int> accountId,
  Value<int> currencyId,
  Value<double> amount,
  Value<String> note,
  Value<DateTime> transactionDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$IncomesTableReferences
    extends BaseReferences<_$AppDatabase, $IncomesTable, Income> {
  $$IncomesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $IncomeCategoriesTable _categoryIdTable(_$AppDatabase db) =>
      db.incomeCategories.createAlias(
          $_aliasNameGenerator(db.incomes.categoryId, db.incomeCategories.id));

  $$IncomeCategoriesTableProcessedTableManager get categoryId {
    final $_column = $_itemColumn<int>('category_id')!;

    final manager =
        $$IncomeCategoriesTableTableManager($_db, $_db.incomeCategories)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AccountsTable _accountIdTable(_$AppDatabase db) => db.accounts
      .createAlias($_aliasNameGenerator(db.incomes.accountId, db.accounts.id));

  $$AccountsTableProcessedTableManager get accountId {
    final $_column = $_itemColumn<int>('account_id')!;

    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CurrenciesTable _currencyIdTable(_$AppDatabase db) =>
      db.currencies.createAlias(
          $_aliasNameGenerator(db.incomes.currencyId, db.currencies.id));

  $$CurrenciesTableProcessedTableManager get currencyId {
    final $_column = $_itemColumn<int>('currency_id')!;

    final manager = $$CurrenciesTableTableManager($_db, $_db.currencies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$IncomesTableFilterComposer
    extends Composer<_$AppDatabase, $IncomesTable> {
  $$IncomesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$IncomeCategoriesTableFilterComposer get categoryId {
    final $$IncomeCategoriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.incomeCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomeCategoriesTableFilterComposer(
              $db: $db,
              $table: $db.incomeCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableFilterComposer get accountId {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CurrenciesTableFilterComposer get currencyId {
    final $$CurrenciesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyId,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CurrenciesTableFilterComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IncomesTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomesTable> {
  $$IncomesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$IncomeCategoriesTableOrderingComposer get categoryId {
    final $$IncomeCategoriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.incomeCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomeCategoriesTableOrderingComposer(
              $db: $db,
              $table: $db.incomeCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableOrderingComposer get accountId {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CurrenciesTableOrderingComposer get currencyId {
    final $$CurrenciesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyId,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CurrenciesTableOrderingComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IncomesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomesTable> {
  $$IncomesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$IncomeCategoriesTableAnnotationComposer get categoryId {
    final $$IncomeCategoriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.incomeCategories,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IncomeCategoriesTableAnnotationComposer(
              $db: $db,
              $table: $db.incomeCategories,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableAnnotationComposer get accountId {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountId,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CurrenciesTableAnnotationComposer get currencyId {
    final $$CurrenciesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyId,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CurrenciesTableAnnotationComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$IncomesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IncomesTable,
    Income,
    $$IncomesTableFilterComposer,
    $$IncomesTableOrderingComposer,
    $$IncomesTableAnnotationComposer,
    $$IncomesTableCreateCompanionBuilder,
    $$IncomesTableUpdateCompanionBuilder,
    (Income, $$IncomesTableReferences),
    Income,
    PrefetchHooks Function(
        {bool categoryId, bool accountId, bool currencyId})> {
  $$IncomesTableTableManager(_$AppDatabase db, $IncomesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> categoryId = const Value.absent(),
            Value<int> accountId = const Value.absent(),
            Value<int> currencyId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<DateTime> transactionDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              IncomesCompanion(
            id: id,
            categoryId: categoryId,
            accountId: accountId,
            currencyId: currencyId,
            amount: amount,
            note: note,
            transactionDate: transactionDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int categoryId,
            required int accountId,
            required int currencyId,
            required double amount,
            required String note,
            required DateTime transactionDate,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              IncomesCompanion.insert(
            id: id,
            categoryId: categoryId,
            accountId: accountId,
            currencyId: currencyId,
            amount: amount,
            note: note,
            transactionDate: transactionDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$IncomesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false, accountId = false, currencyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$IncomesTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$IncomesTableReferences._categoryIdTable(db).id,
                  ) as T;
                }
                if (accountId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountId,
                    referencedTable:
                        $$IncomesTableReferences._accountIdTable(db),
                    referencedColumn:
                        $$IncomesTableReferences._accountIdTable(db).id,
                  ) as T;
                }
                if (currencyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.currencyId,
                    referencedTable:
                        $$IncomesTableReferences._currencyIdTable(db),
                    referencedColumn:
                        $$IncomesTableReferences._currencyIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$IncomesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IncomesTable,
    Income,
    $$IncomesTableFilterComposer,
    $$IncomesTableOrderingComposer,
    $$IncomesTableAnnotationComposer,
    $$IncomesTableCreateCompanionBuilder,
    $$IncomesTableUpdateCompanionBuilder,
    (Income, $$IncomesTableReferences),
    Income,
    PrefetchHooks Function({bool categoryId, bool accountId, bool currencyId})>;
typedef $$TransfersTableCreateCompanionBuilder = TransfersCompanion Function({
  Value<int> id,
  required int accountOrigin,
  required int accountDestination,
  required int currencyId,
  required double amount,
  Value<double> fee,
  required String note,
  required DateTime transactionDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});
typedef $$TransfersTableUpdateCompanionBuilder = TransfersCompanion Function({
  Value<int> id,
  Value<int> accountOrigin,
  Value<int> accountDestination,
  Value<int> currencyId,
  Value<double> amount,
  Value<double> fee,
  Value<String> note,
  Value<DateTime> transactionDate,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$TransfersTableReferences
    extends BaseReferences<_$AppDatabase, $TransfersTable, Transfer> {
  $$TransfersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $AccountsTable _accountOriginTable(_$AppDatabase db) =>
      db.accounts.createAlias(
          $_aliasNameGenerator(db.transfers.accountOrigin, db.accounts.id));

  $$AccountsTableProcessedTableManager get accountOrigin {
    final $_column = $_itemColumn<int>('account_origin')!;

    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountOriginTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $AccountsTable _accountDestinationTable(_$AppDatabase db) =>
      db.accounts.createAlias($_aliasNameGenerator(
          db.transfers.accountDestination, db.accounts.id));

  $$AccountsTableProcessedTableManager get accountDestination {
    final $_column = $_itemColumn<int>('account_destination')!;

    final manager = $$AccountsTableTableManager($_db, $_db.accounts)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_accountDestinationTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $CurrenciesTable _currencyIdTable(_$AppDatabase db) =>
      db.currencies.createAlias(
          $_aliasNameGenerator(db.transfers.currencyId, db.currencies.id));

  $$CurrenciesTableProcessedTableManager get currencyId {
    final $_column = $_itemColumn<int>('currency_id')!;

    final manager = $$CurrenciesTableTableManager($_db, $_db.currencies)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currencyIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TransfersTableFilterComposer
    extends Composer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get fee => $composableBuilder(
      column: $table.fee, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  $$AccountsTableFilterComposer get accountOrigin {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountOrigin,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableFilterComposer get accountDestination {
    final $$AccountsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountDestination,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableFilterComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CurrenciesTableFilterComposer get currencyId {
    final $$CurrenciesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyId,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CurrenciesTableFilterComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransfersTableOrderingComposer
    extends Composer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get fee => $composableBuilder(
      column: $table.fee, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get note => $composableBuilder(
      column: $table.note, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  $$AccountsTableOrderingComposer get accountOrigin {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountOrigin,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableOrderingComposer get accountDestination {
    final $$AccountsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountDestination,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableOrderingComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CurrenciesTableOrderingComposer get currencyId {
    final $$CurrenciesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyId,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CurrenciesTableOrderingComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransfersTableAnnotationComposer
    extends Composer<_$AppDatabase, $TransfersTable> {
  $$TransfersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<double> get fee =>
      $composableBuilder(column: $table.fee, builder: (column) => column);

  GeneratedColumn<String> get note =>
      $composableBuilder(column: $table.note, builder: (column) => column);

  GeneratedColumn<DateTime> get transactionDate => $composableBuilder(
      column: $table.transactionDate, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$AccountsTableAnnotationComposer get accountOrigin {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountOrigin,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$AccountsTableAnnotationComposer get accountDestination {
    final $$AccountsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.accountDestination,
        referencedTable: $db.accounts,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$AccountsTableAnnotationComposer(
              $db: $db,
              $table: $db.accounts,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$CurrenciesTableAnnotationComposer get currencyId {
    final $$CurrenciesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.currencyId,
        referencedTable: $db.currencies,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CurrenciesTableAnnotationComposer(
              $db: $db,
              $table: $db.currencies,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TransfersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TransfersTable,
    Transfer,
    $$TransfersTableFilterComposer,
    $$TransfersTableOrderingComposer,
    $$TransfersTableAnnotationComposer,
    $$TransfersTableCreateCompanionBuilder,
    $$TransfersTableUpdateCompanionBuilder,
    (Transfer, $$TransfersTableReferences),
    Transfer,
    PrefetchHooks Function(
        {bool accountOrigin, bool accountDestination, bool currencyId})> {
  $$TransfersTableTableManager(_$AppDatabase db, $TransfersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TransfersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TransfersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TransfersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> accountOrigin = const Value.absent(),
            Value<int> accountDestination = const Value.absent(),
            Value<int> currencyId = const Value.absent(),
            Value<double> amount = const Value.absent(),
            Value<double> fee = const Value.absent(),
            Value<String> note = const Value.absent(),
            Value<DateTime> transactionDate = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TransfersCompanion(
            id: id,
            accountOrigin: accountOrigin,
            accountDestination: accountDestination,
            currencyId: currencyId,
            amount: amount,
            fee: fee,
            note: note,
            transactionDate: transactionDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int accountOrigin,
            required int accountDestination,
            required int currencyId,
            required double amount,
            Value<double> fee = const Value.absent(),
            required String note,
            required DateTime transactionDate,
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              TransfersCompanion.insert(
            id: id,
            accountOrigin: accountOrigin,
            accountDestination: accountDestination,
            currencyId: currencyId,
            amount: amount,
            fee: fee,
            note: note,
            transactionDate: transactionDate,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TransfersTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {accountOrigin = false,
              accountDestination = false,
              currencyId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (accountOrigin) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountOrigin,
                    referencedTable:
                        $$TransfersTableReferences._accountOriginTable(db),
                    referencedColumn:
                        $$TransfersTableReferences._accountOriginTable(db).id,
                  ) as T;
                }
                if (accountDestination) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.accountDestination,
                    referencedTable:
                        $$TransfersTableReferences._accountDestinationTable(db),
                    referencedColumn: $$TransfersTableReferences
                        ._accountDestinationTable(db)
                        .id,
                  ) as T;
                }
                if (currencyId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.currencyId,
                    referencedTable:
                        $$TransfersTableReferences._currencyIdTable(db),
                    referencedColumn:
                        $$TransfersTableReferences._currencyIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TransfersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $TransfersTable,
    Transfer,
    $$TransfersTableFilterComposer,
    $$TransfersTableOrderingComposer,
    $$TransfersTableAnnotationComposer,
    $$TransfersTableCreateCompanionBuilder,
    $$TransfersTableUpdateCompanionBuilder,
    (Transfer, $$TransfersTableReferences),
    Transfer,
    PrefetchHooks Function(
        {bool accountOrigin, bool accountDestination, bool currencyId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ExpenseCategoriesTableTableManager get expenseCategories =>
      $$ExpenseCategoriesTableTableManager(_db, _db.expenseCategories);
  $$IncomeCategoriesTableTableManager get incomeCategories =>
      $$IncomeCategoriesTableTableManager(_db, _db.incomeCategories);
  $$CurrenciesTableTableManager get currencies =>
      $$CurrenciesTableTableManager(_db, _db.currencies);
  $$AccountGroupsTableTableManager get accountGroups =>
      $$AccountGroupsTableTableManager(_db, _db.accountGroups);
  $$AccountsTableTableManager get accounts =>
      $$AccountsTableTableManager(_db, _db.accounts);
  $$BudgetsTableTableManager get budgets =>
      $$BudgetsTableTableManager(_db, _db.budgets);
  $$ExpensesTableTableManager get expenses =>
      $$ExpensesTableTableManager(_db, _db.expenses);
  $$IncomesTableTableManager get incomes =>
      $$IncomesTableTableManager(_db, _db.incomes);
  $$TransfersTableTableManager get transfers =>
      $$TransfersTableTableManager(_db, _db.transfers);
}
