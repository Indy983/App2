// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UserAnswersTable extends UserAnswers
    with TableInfo<$UserAnswersTable, UserAnswer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserAnswersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<String> lessonId = GeneratedColumn<String>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<String> questionId = GeneratedColumn<String>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _answerDataMeta = const VerificationMeta(
    'answerData',
  );
  @override
  late final GeneratedColumn<String> answerData = GeneratedColumn<String>(
    'answer_data',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _isCorrectMeta = const VerificationMeta(
    'isCorrect',
  );
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
    'is_correct',
    aliasedName,
    true,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_correct" IN (0, 1))',
    ),
  );
  static const VerificationMeta _attemptCountMeta = const VerificationMeta(
    'attemptCount',
  );
  @override
  late final GeneratedColumn<int> attemptCount = GeneratedColumn<int>(
    'attempt_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lastAttemptedAtMeta = const VerificationMeta(
    'lastAttemptedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastAttemptedAt =
      GeneratedColumn<DateTime>(
        'last_attempted_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    lessonId,
    questionId,
    answerData,
    isCorrect,
    attemptCount,
    lastAttemptedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_answers';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserAnswer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('answer_data')) {
      context.handle(
        _answerDataMeta,
        answerData.isAcceptableOrUnknown(data['answer_data']!, _answerDataMeta),
      );
    }
    if (data.containsKey('is_correct')) {
      context.handle(
        _isCorrectMeta,
        isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta),
      );
    }
    if (data.containsKey('attempt_count')) {
      context.handle(
        _attemptCountMeta,
        attemptCount.isAcceptableOrUnknown(
          data['attempt_count']!,
          _attemptCountMeta,
        ),
      );
    }
    if (data.containsKey('last_attempted_at')) {
      context.handle(
        _lastAttemptedAtMeta,
        lastAttemptedAt.isAcceptableOrUnknown(
          data['last_attempted_at']!,
          _lastAttemptedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastAttemptedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {lessonId, questionId};
  @override
  UserAnswer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserAnswer(
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lesson_id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}question_id'],
      )!,
      answerData: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}answer_data'],
      ),
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      ),
      attemptCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}attempt_count'],
      )!,
      lastAttemptedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_attempted_at'],
      )!,
    );
  }

  @override
  $UserAnswersTable createAlias(String alias) {
    return $UserAnswersTable(attachedDatabase, alias);
  }
}

class UserAnswer extends DataClass implements Insertable<UserAnswer> {
  final String lessonId;
  final String questionId;
  final String? answerData;
  final bool? isCorrect;
  final int attemptCount;
  final DateTime lastAttemptedAt;
  const UserAnswer({
    required this.lessonId,
    required this.questionId,
    this.answerData,
    this.isCorrect,
    required this.attemptCount,
    required this.lastAttemptedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['lesson_id'] = Variable<String>(lessonId);
    map['question_id'] = Variable<String>(questionId);
    if (!nullToAbsent || answerData != null) {
      map['answer_data'] = Variable<String>(answerData);
    }
    if (!nullToAbsent || isCorrect != null) {
      map['is_correct'] = Variable<bool>(isCorrect);
    }
    map['attempt_count'] = Variable<int>(attemptCount);
    map['last_attempted_at'] = Variable<DateTime>(lastAttemptedAt);
    return map;
  }

  UserAnswersCompanion toCompanion(bool nullToAbsent) {
    return UserAnswersCompanion(
      lessonId: Value(lessonId),
      questionId: Value(questionId),
      answerData: answerData == null && nullToAbsent
          ? const Value.absent()
          : Value(answerData),
      isCorrect: isCorrect == null && nullToAbsent
          ? const Value.absent()
          : Value(isCorrect),
      attemptCount: Value(attemptCount),
      lastAttemptedAt: Value(lastAttemptedAt),
    );
  }

  factory UserAnswer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserAnswer(
      lessonId: serializer.fromJson<String>(json['lessonId']),
      questionId: serializer.fromJson<String>(json['questionId']),
      answerData: serializer.fromJson<String?>(json['answerData']),
      isCorrect: serializer.fromJson<bool?>(json['isCorrect']),
      attemptCount: serializer.fromJson<int>(json['attemptCount']),
      lastAttemptedAt: serializer.fromJson<DateTime>(json['lastAttemptedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'lessonId': serializer.toJson<String>(lessonId),
      'questionId': serializer.toJson<String>(questionId),
      'answerData': serializer.toJson<String?>(answerData),
      'isCorrect': serializer.toJson<bool?>(isCorrect),
      'attemptCount': serializer.toJson<int>(attemptCount),
      'lastAttemptedAt': serializer.toJson<DateTime>(lastAttemptedAt),
    };
  }

  UserAnswer copyWith({
    String? lessonId,
    String? questionId,
    Value<String?> answerData = const Value.absent(),
    Value<bool?> isCorrect = const Value.absent(),
    int? attemptCount,
    DateTime? lastAttemptedAt,
  }) => UserAnswer(
    lessonId: lessonId ?? this.lessonId,
    questionId: questionId ?? this.questionId,
    answerData: answerData.present ? answerData.value : this.answerData,
    isCorrect: isCorrect.present ? isCorrect.value : this.isCorrect,
    attemptCount: attemptCount ?? this.attemptCount,
    lastAttemptedAt: lastAttemptedAt ?? this.lastAttemptedAt,
  );
  UserAnswer copyWithCompanion(UserAnswersCompanion data) {
    return UserAnswer(
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      answerData: data.answerData.present
          ? data.answerData.value
          : this.answerData,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
      attemptCount: data.attemptCount.present
          ? data.attemptCount.value
          : this.attemptCount,
      lastAttemptedAt: data.lastAttemptedAt.present
          ? data.lastAttemptedAt.value
          : this.lastAttemptedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserAnswer(')
          ..write('lessonId: $lessonId, ')
          ..write('questionId: $questionId, ')
          ..write('answerData: $answerData, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('lastAttemptedAt: $lastAttemptedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    lessonId,
    questionId,
    answerData,
    isCorrect,
    attemptCount,
    lastAttemptedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserAnswer &&
          other.lessonId == this.lessonId &&
          other.questionId == this.questionId &&
          other.answerData == this.answerData &&
          other.isCorrect == this.isCorrect &&
          other.attemptCount == this.attemptCount &&
          other.lastAttemptedAt == this.lastAttemptedAt);
}

class UserAnswersCompanion extends UpdateCompanion<UserAnswer> {
  final Value<String> lessonId;
  final Value<String> questionId;
  final Value<String?> answerData;
  final Value<bool?> isCorrect;
  final Value<int> attemptCount;
  final Value<DateTime> lastAttemptedAt;
  final Value<int> rowid;
  const UserAnswersCompanion({
    this.lessonId = const Value.absent(),
    this.questionId = const Value.absent(),
    this.answerData = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.attemptCount = const Value.absent(),
    this.lastAttemptedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserAnswersCompanion.insert({
    required String lessonId,
    required String questionId,
    this.answerData = const Value.absent(),
    this.isCorrect = const Value.absent(),
    this.attemptCount = const Value.absent(),
    required DateTime lastAttemptedAt,
    this.rowid = const Value.absent(),
  }) : lessonId = Value(lessonId),
       questionId = Value(questionId),
       lastAttemptedAt = Value(lastAttemptedAt);
  static Insertable<UserAnswer> custom({
    Expression<String>? lessonId,
    Expression<String>? questionId,
    Expression<String>? answerData,
    Expression<bool>? isCorrect,
    Expression<int>? attemptCount,
    Expression<DateTime>? lastAttemptedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (lessonId != null) 'lesson_id': lessonId,
      if (questionId != null) 'question_id': questionId,
      if (answerData != null) 'answer_data': answerData,
      if (isCorrect != null) 'is_correct': isCorrect,
      if (attemptCount != null) 'attempt_count': attemptCount,
      if (lastAttemptedAt != null) 'last_attempted_at': lastAttemptedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserAnswersCompanion copyWith({
    Value<String>? lessonId,
    Value<String>? questionId,
    Value<String?>? answerData,
    Value<bool?>? isCorrect,
    Value<int>? attemptCount,
    Value<DateTime>? lastAttemptedAt,
    Value<int>? rowid,
  }) {
    return UserAnswersCompanion(
      lessonId: lessonId ?? this.lessonId,
      questionId: questionId ?? this.questionId,
      answerData: answerData ?? this.answerData,
      isCorrect: isCorrect ?? this.isCorrect,
      attemptCount: attemptCount ?? this.attemptCount,
      lastAttemptedAt: lastAttemptedAt ?? this.lastAttemptedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (lessonId.present) {
      map['lesson_id'] = Variable<String>(lessonId.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<String>(questionId.value);
    }
    if (answerData.present) {
      map['answer_data'] = Variable<String>(answerData.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    if (attemptCount.present) {
      map['attempt_count'] = Variable<int>(attemptCount.value);
    }
    if (lastAttemptedAt.present) {
      map['last_attempted_at'] = Variable<DateTime>(lastAttemptedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserAnswersCompanion(')
          ..write('lessonId: $lessonId, ')
          ..write('questionId: $questionId, ')
          ..write('answerData: $answerData, ')
          ..write('isCorrect: $isCorrect, ')
          ..write('attemptCount: $attemptCount, ')
          ..write('lastAttemptedAt: $lastAttemptedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserAnswersTable userAnswers = $UserAnswersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [userAnswers];
}

typedef $$UserAnswersTableCreateCompanionBuilder =
    UserAnswersCompanion Function({
      required String lessonId,
      required String questionId,
      Value<String?> answerData,
      Value<bool?> isCorrect,
      Value<int> attemptCount,
      required DateTime lastAttemptedAt,
      Value<int> rowid,
    });
typedef $$UserAnswersTableUpdateCompanionBuilder =
    UserAnswersCompanion Function({
      Value<String> lessonId,
      Value<String> questionId,
      Value<String?> answerData,
      Value<bool?> isCorrect,
      Value<int> attemptCount,
      Value<DateTime> lastAttemptedAt,
      Value<int> rowid,
    });

class $$UserAnswersTableFilterComposer
    extends Composer<_$AppDatabase, $UserAnswersTable> {
  $$UserAnswersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get answerData => $composableBuilder(
    column: $table.answerData,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastAttemptedAt => $composableBuilder(
    column: $table.lastAttemptedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$UserAnswersTableOrderingComposer
    extends Composer<_$AppDatabase, $UserAnswersTable> {
  $$UserAnswersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get lessonId => $composableBuilder(
    column: $table.lessonId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get answerData => $composableBuilder(
    column: $table.answerData,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastAttemptedAt => $composableBuilder(
    column: $table.lastAttemptedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UserAnswersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserAnswersTable> {
  $$UserAnswersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get lessonId =>
      $composableBuilder(column: $table.lessonId, builder: (column) => column);

  GeneratedColumn<String> get questionId => $composableBuilder(
    column: $table.questionId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get answerData => $composableBuilder(
    column: $table.answerData,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  GeneratedColumn<int> get attemptCount => $composableBuilder(
    column: $table.attemptCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastAttemptedAt => $composableBuilder(
    column: $table.lastAttemptedAt,
    builder: (column) => column,
  );
}

class $$UserAnswersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserAnswersTable,
          UserAnswer,
          $$UserAnswersTableFilterComposer,
          $$UserAnswersTableOrderingComposer,
          $$UserAnswersTableAnnotationComposer,
          $$UserAnswersTableCreateCompanionBuilder,
          $$UserAnswersTableUpdateCompanionBuilder,
          (
            UserAnswer,
            BaseReferences<_$AppDatabase, $UserAnswersTable, UserAnswer>,
          ),
          UserAnswer,
          PrefetchHooks Function()
        > {
  $$UserAnswersTableTableManager(_$AppDatabase db, $UserAnswersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserAnswersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserAnswersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserAnswersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> lessonId = const Value.absent(),
                Value<String> questionId = const Value.absent(),
                Value<String?> answerData = const Value.absent(),
                Value<bool?> isCorrect = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                Value<DateTime> lastAttemptedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserAnswersCompanion(
                lessonId: lessonId,
                questionId: questionId,
                answerData: answerData,
                isCorrect: isCorrect,
                attemptCount: attemptCount,
                lastAttemptedAt: lastAttemptedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String lessonId,
                required String questionId,
                Value<String?> answerData = const Value.absent(),
                Value<bool?> isCorrect = const Value.absent(),
                Value<int> attemptCount = const Value.absent(),
                required DateTime lastAttemptedAt,
                Value<int> rowid = const Value.absent(),
              }) => UserAnswersCompanion.insert(
                lessonId: lessonId,
                questionId: questionId,
                answerData: answerData,
                isCorrect: isCorrect,
                attemptCount: attemptCount,
                lastAttemptedAt: lastAttemptedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$UserAnswersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserAnswersTable,
      UserAnswer,
      $$UserAnswersTableFilterComposer,
      $$UserAnswersTableOrderingComposer,
      $$UserAnswersTableAnnotationComposer,
      $$UserAnswersTableCreateCompanionBuilder,
      $$UserAnswersTableUpdateCompanionBuilder,
      (
        UserAnswer,
        BaseReferences<_$AppDatabase, $UserAnswersTable, UserAnswer>,
      ),
      UserAnswer,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserAnswersTableTableManager get userAnswers =>
      $$UserAnswersTableTableManager(_db, _db.userAnswers);
}
