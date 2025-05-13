// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appdatabase.dart';

// ignore_for_file: type=lint
class $SemTableTable extends SemTable
    with TableInfo<$SemTableTable, SemTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SemTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _semidMeta = const VerificationMeta('semid');
  @override
  late final GeneratedColumn<String> semid = GeneratedColumn<String>(
    'semid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semNameMeta = const VerificationMeta(
    'semName',
  );
  @override
  late final GeneratedColumn<String> semName = GeneratedColumn<String>(
    'sem_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [semid, semName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sem_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SemTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('semid')) {
      context.handle(
        _semidMeta,
        semid.isAcceptableOrUnknown(data['semid']!, _semidMeta),
      );
    } else if (isInserting) {
      context.missing(_semidMeta);
    }
    if (data.containsKey('sem_name')) {
      context.handle(
        _semNameMeta,
        semName.isAcceptableOrUnknown(data['sem_name']!, _semNameMeta),
      );
    } else if (isInserting) {
      context.missing(_semNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {semid};
  @override
  SemTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SemTableData(
      semid:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}semid'],
          )!,
      semName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sem_name'],
          )!,
    );
  }

  @override
  $SemTableTable createAlias(String alias) {
    return $SemTableTable(attachedDatabase, alias);
  }
}

class SemTableData extends DataClass implements Insertable<SemTableData> {
  final String semid;
  final String semName;
  const SemTableData({required this.semid, required this.semName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['semid'] = Variable<String>(semid);
    map['sem_name'] = Variable<String>(semName);
    return map;
  }

  SemTableCompanion toCompanion(bool nullToAbsent) {
    return SemTableCompanion(semid: Value(semid), semName: Value(semName));
  }

  factory SemTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SemTableData(
      semid: serializer.fromJson<String>(json['semid']),
      semName: serializer.fromJson<String>(json['semName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'semid': serializer.toJson<String>(semid),
      'semName': serializer.toJson<String>(semName),
    };
  }

  SemTableData copyWith({String? semid, String? semName}) => SemTableData(
    semid: semid ?? this.semid,
    semName: semName ?? this.semName,
  );
  SemTableData copyWithCompanion(SemTableCompanion data) {
    return SemTableData(
      semid: data.semid.present ? data.semid.value : this.semid,
      semName: data.semName.present ? data.semName.value : this.semName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SemTableData(')
          ..write('semid: $semid, ')
          ..write('semName: $semName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(semid, semName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SemTableData &&
          other.semid == this.semid &&
          other.semName == this.semName);
}

class SemTableCompanion extends UpdateCompanion<SemTableData> {
  final Value<String> semid;
  final Value<String> semName;
  final Value<int> rowid;
  const SemTableCompanion({
    this.semid = const Value.absent(),
    this.semName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SemTableCompanion.insert({
    required String semid,
    required String semName,
    this.rowid = const Value.absent(),
  }) : semid = Value(semid),
       semName = Value(semName);
  static Insertable<SemTableData> custom({
    Expression<String>? semid,
    Expression<String>? semName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (semid != null) 'semid': semid,
      if (semName != null) 'sem_name': semName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SemTableCompanion copyWith({
    Value<String>? semid,
    Value<String>? semName,
    Value<int>? rowid,
  }) {
    return SemTableCompanion(
      semid: semid ?? this.semid,
      semName: semName ?? this.semName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (semid.present) {
      map['semid'] = Variable<String>(semid.value);
    }
    if (semName.present) {
      map['sem_name'] = Variable<String>(semName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SemTableCompanion(')
          ..write('semid: $semid, ')
          ..write('semName: $semName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TimetableTable extends Timetable
    with TableInfo<$TimetableTable, TimetableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimetableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<int> serial = GeneratedColumn<int>(
    'serial',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayMeta = const VerificationMeta('day');
  @override
  late final GeneratedColumn<String> day = GeneratedColumn<String>(
    'day',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseCodeMeta = const VerificationMeta(
    'courseCode',
  );
  @override
  late final GeneratedColumn<String> courseCode = GeneratedColumn<String>(
    'course_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseTypeMeta = const VerificationMeta(
    'courseType',
  );
  @override
  late final GeneratedColumn<String> courseType = GeneratedColumn<String>(
    'course_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _courseNameMeta = const VerificationMeta(
    'courseName',
  );
  @override
  late final GeneratedColumn<String> courseName = GeneratedColumn<String>(
    'course_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roomNoMeta = const VerificationMeta('roomNo');
  @override
  late final GeneratedColumn<String> roomNo = GeneratedColumn<String>(
    'room_no',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _blockMeta = const VerificationMeta('block');
  @override
  late final GeneratedColumn<String> block = GeneratedColumn<String>(
    'block',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semIdMeta = const VerificationMeta('semId');
  @override
  late final GeneratedColumn<String> semId = GeneratedColumn<String>(
    'sem_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sem_table (semid)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serial,
    day,
    slot,
    courseCode,
    courseType,
    courseName,
    roomNo,
    block,
    startTime,
    endTime,
    semId,
    time,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'timetable';
  @override
  VerificationContext validateIntegrity(
    Insertable<TimetableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('day')) {
      context.handle(
        _dayMeta,
        day.isAcceptableOrUnknown(data['day']!, _dayMeta),
      );
    } else if (isInserting) {
      context.missing(_dayMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('course_code')) {
      context.handle(
        _courseCodeMeta,
        courseCode.isAcceptableOrUnknown(data['course_code']!, _courseCodeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseCodeMeta);
    }
    if (data.containsKey('course_type')) {
      context.handle(
        _courseTypeMeta,
        courseType.isAcceptableOrUnknown(data['course_type']!, _courseTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_courseTypeMeta);
    }
    if (data.containsKey('course_name')) {
      context.handle(
        _courseNameMeta,
        courseName.isAcceptableOrUnknown(data['course_name']!, _courseNameMeta),
      );
    } else if (isInserting) {
      context.missing(_courseNameMeta);
    }
    if (data.containsKey('room_no')) {
      context.handle(
        _roomNoMeta,
        roomNo.isAcceptableOrUnknown(data['room_no']!, _roomNoMeta),
      );
    } else if (isInserting) {
      context.missing(_roomNoMeta);
    }
    if (data.containsKey('block')) {
      context.handle(
        _blockMeta,
        block.isAcceptableOrUnknown(data['block']!, _blockMeta),
      );
    } else if (isInserting) {
      context.missing(_blockMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('sem_id')) {
      context.handle(
        _semIdMeta,
        semId.isAcceptableOrUnknown(data['sem_id']!, _semIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {semId, startTime, day},
  ];
  @override
  TimetableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TimetableData(
      serial:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}serial'],
          )!,
      day:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}day'],
          )!,
      slot:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}slot'],
          )!,
      courseCode:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_code'],
          )!,
      courseType:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_type'],
          )!,
      courseName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}course_name'],
          )!,
      roomNo:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}room_no'],
          )!,
      block:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}block'],
          )!,
      startTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}start_time'],
          )!,
      endTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}end_time'],
          )!,
      semId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sem_id'],
          )!,
      time:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}time'],
          )!,
    );
  }

  @override
  $TimetableTable createAlias(String alias) {
    return $TimetableTable(attachedDatabase, alias);
  }
}

class TimetableData extends DataClass implements Insertable<TimetableData> {
  final int serial;
  final String day;
  final String slot;
  final String courseCode;
  final String courseType;
  final String courseName;
  final String roomNo;
  final String block;
  final String startTime;
  final String endTime;
  final String semId;
  final int time;
  const TimetableData({
    required this.serial,
    required this.day,
    required this.slot,
    required this.courseCode,
    required this.courseType,
    required this.courseName,
    required this.roomNo,
    required this.block,
    required this.startTime,
    required this.endTime,
    required this.semId,
    required this.time,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['serial'] = Variable<int>(serial);
    map['day'] = Variable<String>(day);
    map['slot'] = Variable<String>(slot);
    map['course_code'] = Variable<String>(courseCode);
    map['course_type'] = Variable<String>(courseType);
    map['course_name'] = Variable<String>(courseName);
    map['room_no'] = Variable<String>(roomNo);
    map['block'] = Variable<String>(block);
    map['start_time'] = Variable<String>(startTime);
    map['end_time'] = Variable<String>(endTime);
    map['sem_id'] = Variable<String>(semId);
    map['time'] = Variable<int>(time);
    return map;
  }

  TimetableCompanion toCompanion(bool nullToAbsent) {
    return TimetableCompanion(
      serial: Value(serial),
      day: Value(day),
      slot: Value(slot),
      courseCode: Value(courseCode),
      courseType: Value(courseType),
      courseName: Value(courseName),
      roomNo: Value(roomNo),
      block: Value(block),
      startTime: Value(startTime),
      endTime: Value(endTime),
      semId: Value(semId),
      time: Value(time),
    );
  }

  factory TimetableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TimetableData(
      serial: serializer.fromJson<int>(json['serial']),
      day: serializer.fromJson<String>(json['day']),
      slot: serializer.fromJson<String>(json['slot']),
      courseCode: serializer.fromJson<String>(json['courseCode']),
      courseType: serializer.fromJson<String>(json['courseType']),
      courseName: serializer.fromJson<String>(json['courseName']),
      roomNo: serializer.fromJson<String>(json['roomNo']),
      block: serializer.fromJson<String>(json['block']),
      startTime: serializer.fromJson<String>(json['startTime']),
      endTime: serializer.fromJson<String>(json['endTime']),
      semId: serializer.fromJson<String>(json['semId']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serial': serializer.toJson<int>(serial),
      'day': serializer.toJson<String>(day),
      'slot': serializer.toJson<String>(slot),
      'courseCode': serializer.toJson<String>(courseCode),
      'courseType': serializer.toJson<String>(courseType),
      'courseName': serializer.toJson<String>(courseName),
      'roomNo': serializer.toJson<String>(roomNo),
      'block': serializer.toJson<String>(block),
      'startTime': serializer.toJson<String>(startTime),
      'endTime': serializer.toJson<String>(endTime),
      'semId': serializer.toJson<String>(semId),
      'time': serializer.toJson<int>(time),
    };
  }

  TimetableData copyWith({
    int? serial,
    String? day,
    String? slot,
    String? courseCode,
    String? courseType,
    String? courseName,
    String? roomNo,
    String? block,
    String? startTime,
    String? endTime,
    String? semId,
    int? time,
  }) => TimetableData(
    serial: serial ?? this.serial,
    day: day ?? this.day,
    slot: slot ?? this.slot,
    courseCode: courseCode ?? this.courseCode,
    courseType: courseType ?? this.courseType,
    courseName: courseName ?? this.courseName,
    roomNo: roomNo ?? this.roomNo,
    block: block ?? this.block,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    semId: semId ?? this.semId,
    time: time ?? this.time,
  );
  TimetableData copyWithCompanion(TimetableCompanion data) {
    return TimetableData(
      serial: data.serial.present ? data.serial.value : this.serial,
      day: data.day.present ? data.day.value : this.day,
      slot: data.slot.present ? data.slot.value : this.slot,
      courseCode:
          data.courseCode.present ? data.courseCode.value : this.courseCode,
      courseType:
          data.courseType.present ? data.courseType.value : this.courseType,
      courseName:
          data.courseName.present ? data.courseName.value : this.courseName,
      roomNo: data.roomNo.present ? data.roomNo.value : this.roomNo,
      block: data.block.present ? data.block.value : this.block,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      semId: data.semId.present ? data.semId.value : this.semId,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TimetableData(')
          ..write('serial: $serial, ')
          ..write('day: $day, ')
          ..write('slot: $slot, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseType: $courseType, ')
          ..write('courseName: $courseName, ')
          ..write('roomNo: $roomNo, ')
          ..write('block: $block, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('semId: $semId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    serial,
    day,
    slot,
    courseCode,
    courseType,
    courseName,
    roomNo,
    block,
    startTime,
    endTime,
    semId,
    time,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TimetableData &&
          other.serial == this.serial &&
          other.day == this.day &&
          other.slot == this.slot &&
          other.courseCode == this.courseCode &&
          other.courseType == this.courseType &&
          other.courseName == this.courseName &&
          other.roomNo == this.roomNo &&
          other.block == this.block &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.semId == this.semId &&
          other.time == this.time);
}

class TimetableCompanion extends UpdateCompanion<TimetableData> {
  final Value<int> serial;
  final Value<String> day;
  final Value<String> slot;
  final Value<String> courseCode;
  final Value<String> courseType;
  final Value<String> courseName;
  final Value<String> roomNo;
  final Value<String> block;
  final Value<String> startTime;
  final Value<String> endTime;
  final Value<String> semId;
  final Value<int> time;
  final Value<int> rowid;
  const TimetableCompanion({
    this.serial = const Value.absent(),
    this.day = const Value.absent(),
    this.slot = const Value.absent(),
    this.courseCode = const Value.absent(),
    this.courseType = const Value.absent(),
    this.courseName = const Value.absent(),
    this.roomNo = const Value.absent(),
    this.block = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.semId = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TimetableCompanion.insert({
    required int serial,
    required String day,
    required String slot,
    required String courseCode,
    required String courseType,
    required String courseName,
    required String roomNo,
    required String block,
    required String startTime,
    required String endTime,
    required String semId,
    required int time,
    this.rowid = const Value.absent(),
  }) : serial = Value(serial),
       day = Value(day),
       slot = Value(slot),
       courseCode = Value(courseCode),
       courseType = Value(courseType),
       courseName = Value(courseName),
       roomNo = Value(roomNo),
       block = Value(block),
       startTime = Value(startTime),
       endTime = Value(endTime),
       semId = Value(semId),
       time = Value(time);
  static Insertable<TimetableData> custom({
    Expression<int>? serial,
    Expression<String>? day,
    Expression<String>? slot,
    Expression<String>? courseCode,
    Expression<String>? courseType,
    Expression<String>? courseName,
    Expression<String>? roomNo,
    Expression<String>? block,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<String>? semId,
    Expression<int>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serial != null) 'serial': serial,
      if (day != null) 'day': day,
      if (slot != null) 'slot': slot,
      if (courseCode != null) 'course_code': courseCode,
      if (courseType != null) 'course_type': courseType,
      if (courseName != null) 'course_name': courseName,
      if (roomNo != null) 'room_no': roomNo,
      if (block != null) 'block': block,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (semId != null) 'sem_id': semId,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TimetableCompanion copyWith({
    Value<int>? serial,
    Value<String>? day,
    Value<String>? slot,
    Value<String>? courseCode,
    Value<String>? courseType,
    Value<String>? courseName,
    Value<String>? roomNo,
    Value<String>? block,
    Value<String>? startTime,
    Value<String>? endTime,
    Value<String>? semId,
    Value<int>? time,
    Value<int>? rowid,
  }) {
    return TimetableCompanion(
      serial: serial ?? this.serial,
      day: day ?? this.day,
      slot: slot ?? this.slot,
      courseCode: courseCode ?? this.courseCode,
      courseType: courseType ?? this.courseType,
      courseName: courseName ?? this.courseName,
      roomNo: roomNo ?? this.roomNo,
      block: block ?? this.block,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      semId: semId ?? this.semId,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serial.present) {
      map['serial'] = Variable<int>(serial.value);
    }
    if (day.present) {
      map['day'] = Variable<String>(day.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (courseCode.present) {
      map['course_code'] = Variable<String>(courseCode.value);
    }
    if (courseType.present) {
      map['course_type'] = Variable<String>(courseType.value);
    }
    if (courseName.present) {
      map['course_name'] = Variable<String>(courseName.value);
    }
    if (roomNo.present) {
      map['room_no'] = Variable<String>(roomNo.value);
    }
    if (block.present) {
      map['block'] = Variable<String>(block.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (semId.present) {
      map['sem_id'] = Variable<String>(semId.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimetableCompanion(')
          ..write('serial: $serial, ')
          ..write('day: $day, ')
          ..write('slot: $slot, ')
          ..write('courseCode: $courseCode, ')
          ..write('courseType: $courseType, ')
          ..write('courseName: $courseName, ')
          ..write('roomNo: $roomNo, ')
          ..write('block: $block, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('semId: $semId, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttendanceTableTable extends AttendanceTable
    with TableInfo<$AttendanceTableTable, AttendanceTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttendanceTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _serialMeta = const VerificationMeta('serial');
  @override
  late final GeneratedColumn<int> serial = GeneratedColumn<int>(
    'serial',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slotMeta = const VerificationMeta('slot');
  @override
  late final GeneratedColumn<String> slot = GeneratedColumn<String>(
    'slot',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dayTimeMeta = const VerificationMeta(
    'dayTime',
  );
  @override
  late final GeneratedColumn<String> dayTime = GeneratedColumn<String>(
    'day_time',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _remarkMeta = const VerificationMeta('remark');
  @override
  late final GeneratedColumn<String> remark = GeneratedColumn<String>(
    'remark',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _semIdMeta = const VerificationMeta('semId');
  @override
  late final GeneratedColumn<String> semId = GeneratedColumn<String>(
    'sem_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES sem_table (semid)',
    ),
  );
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
    'time',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    serial,
    date,
    slot,
    dayTime,
    status,
    remark,
    semId,
    time,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attendance_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<AttendanceTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('serial')) {
      context.handle(
        _serialMeta,
        serial.isAcceptableOrUnknown(data['serial']!, _serialMeta),
      );
    } else if (isInserting) {
      context.missing(_serialMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('slot')) {
      context.handle(
        _slotMeta,
        slot.isAcceptableOrUnknown(data['slot']!, _slotMeta),
      );
    } else if (isInserting) {
      context.missing(_slotMeta);
    }
    if (data.containsKey('day_time')) {
      context.handle(
        _dayTimeMeta,
        dayTime.isAcceptableOrUnknown(data['day_time']!, _dayTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_dayTimeMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('remark')) {
      context.handle(
        _remarkMeta,
        remark.isAcceptableOrUnknown(data['remark']!, _remarkMeta),
      );
    } else if (isInserting) {
      context.missing(_remarkMeta);
    }
    if (data.containsKey('sem_id')) {
      context.handle(
        _semIdMeta,
        semId.isAcceptableOrUnknown(data['sem_id']!, _semIdMeta),
      );
    } else if (isInserting) {
      context.missing(_semIdMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
        _timeMeta,
        time.isAcceptableOrUnknown(data['time']!, _timeMeta),
      );
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  AttendanceTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttendanceTableData(
      serial:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}serial'],
          )!,
      date:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}date'],
          )!,
      slot:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}slot'],
          )!,
      dayTime:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}day_time'],
          )!,
      status:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}status'],
          )!,
      remark:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}remark'],
          )!,
      semId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}sem_id'],
          )!,
      time:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}time'],
          )!,
    );
  }

  @override
  $AttendanceTableTable createAlias(String alias) {
    return $AttendanceTableTable(attachedDatabase, alias);
  }
}

class AttendanceTableData extends DataClass
    implements Insertable<AttendanceTableData> {
  final int serial;
  final String date;
  final String slot;
  final String dayTime;
  final String status;
  final String remark;
  final String semId;
  final int time;
  const AttendanceTableData({
    required this.serial,
    required this.date,
    required this.slot,
    required this.dayTime,
    required this.status,
    required this.remark,
    required this.semId,
    required this.time,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['serial'] = Variable<int>(serial);
    map['date'] = Variable<String>(date);
    map['slot'] = Variable<String>(slot);
    map['day_time'] = Variable<String>(dayTime);
    map['status'] = Variable<String>(status);
    map['remark'] = Variable<String>(remark);
    map['sem_id'] = Variable<String>(semId);
    map['time'] = Variable<int>(time);
    return map;
  }

  AttendanceTableCompanion toCompanion(bool nullToAbsent) {
    return AttendanceTableCompanion(
      serial: Value(serial),
      date: Value(date),
      slot: Value(slot),
      dayTime: Value(dayTime),
      status: Value(status),
      remark: Value(remark),
      semId: Value(semId),
      time: Value(time),
    );
  }

  factory AttendanceTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttendanceTableData(
      serial: serializer.fromJson<int>(json['serial']),
      date: serializer.fromJson<String>(json['date']),
      slot: serializer.fromJson<String>(json['slot']),
      dayTime: serializer.fromJson<String>(json['dayTime']),
      status: serializer.fromJson<String>(json['status']),
      remark: serializer.fromJson<String>(json['remark']),
      semId: serializer.fromJson<String>(json['semId']),
      time: serializer.fromJson<int>(json['time']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'serial': serializer.toJson<int>(serial),
      'date': serializer.toJson<String>(date),
      'slot': serializer.toJson<String>(slot),
      'dayTime': serializer.toJson<String>(dayTime),
      'status': serializer.toJson<String>(status),
      'remark': serializer.toJson<String>(remark),
      'semId': serializer.toJson<String>(semId),
      'time': serializer.toJson<int>(time),
    };
  }

  AttendanceTableData copyWith({
    int? serial,
    String? date,
    String? slot,
    String? dayTime,
    String? status,
    String? remark,
    String? semId,
    int? time,
  }) => AttendanceTableData(
    serial: serial ?? this.serial,
    date: date ?? this.date,
    slot: slot ?? this.slot,
    dayTime: dayTime ?? this.dayTime,
    status: status ?? this.status,
    remark: remark ?? this.remark,
    semId: semId ?? this.semId,
    time: time ?? this.time,
  );
  AttendanceTableData copyWithCompanion(AttendanceTableCompanion data) {
    return AttendanceTableData(
      serial: data.serial.present ? data.serial.value : this.serial,
      date: data.date.present ? data.date.value : this.date,
      slot: data.slot.present ? data.slot.value : this.slot,
      dayTime: data.dayTime.present ? data.dayTime.value : this.dayTime,
      status: data.status.present ? data.status.value : this.status,
      remark: data.remark.present ? data.remark.value : this.remark,
      semId: data.semId.present ? data.semId.value : this.semId,
      time: data.time.present ? data.time.value : this.time,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceTableData(')
          ..write('serial: $serial, ')
          ..write('date: $date, ')
          ..write('slot: $slot, ')
          ..write('dayTime: $dayTime, ')
          ..write('status: $status, ')
          ..write('remark: $remark, ')
          ..write('semId: $semId, ')
          ..write('time: $time')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(serial, date, slot, dayTime, status, remark, semId, time);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttendanceTableData &&
          other.serial == this.serial &&
          other.date == this.date &&
          other.slot == this.slot &&
          other.dayTime == this.dayTime &&
          other.status == this.status &&
          other.remark == this.remark &&
          other.semId == this.semId &&
          other.time == this.time);
}

class AttendanceTableCompanion extends UpdateCompanion<AttendanceTableData> {
  final Value<int> serial;
  final Value<String> date;
  final Value<String> slot;
  final Value<String> dayTime;
  final Value<String> status;
  final Value<String> remark;
  final Value<String> semId;
  final Value<int> time;
  final Value<int> rowid;
  const AttendanceTableCompanion({
    this.serial = const Value.absent(),
    this.date = const Value.absent(),
    this.slot = const Value.absent(),
    this.dayTime = const Value.absent(),
    this.status = const Value.absent(),
    this.remark = const Value.absent(),
    this.semId = const Value.absent(),
    this.time = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttendanceTableCompanion.insert({
    required int serial,
    required String date,
    required String slot,
    required String dayTime,
    required String status,
    required String remark,
    required String semId,
    required int time,
    this.rowid = const Value.absent(),
  }) : serial = Value(serial),
       date = Value(date),
       slot = Value(slot),
       dayTime = Value(dayTime),
       status = Value(status),
       remark = Value(remark),
       semId = Value(semId),
       time = Value(time);
  static Insertable<AttendanceTableData> custom({
    Expression<int>? serial,
    Expression<String>? date,
    Expression<String>? slot,
    Expression<String>? dayTime,
    Expression<String>? status,
    Expression<String>? remark,
    Expression<String>? semId,
    Expression<int>? time,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (serial != null) 'serial': serial,
      if (date != null) 'date': date,
      if (slot != null) 'slot': slot,
      if (dayTime != null) 'day_time': dayTime,
      if (status != null) 'status': status,
      if (remark != null) 'remark': remark,
      if (semId != null) 'sem_id': semId,
      if (time != null) 'time': time,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttendanceTableCompanion copyWith({
    Value<int>? serial,
    Value<String>? date,
    Value<String>? slot,
    Value<String>? dayTime,
    Value<String>? status,
    Value<String>? remark,
    Value<String>? semId,
    Value<int>? time,
    Value<int>? rowid,
  }) {
    return AttendanceTableCompanion(
      serial: serial ?? this.serial,
      date: date ?? this.date,
      slot: slot ?? this.slot,
      dayTime: dayTime ?? this.dayTime,
      status: status ?? this.status,
      remark: remark ?? this.remark,
      semId: semId ?? this.semId,
      time: time ?? this.time,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (serial.present) {
      map['serial'] = Variable<int>(serial.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (slot.present) {
      map['slot'] = Variable<String>(slot.value);
    }
    if (dayTime.present) {
      map['day_time'] = Variable<String>(dayTime.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (remark.present) {
      map['remark'] = Variable<String>(remark.value);
    }
    if (semId.present) {
      map['sem_id'] = Variable<String>(semId.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttendanceTableCompanion(')
          ..write('serial: $serial, ')
          ..write('date: $date, ')
          ..write('slot: $slot, ')
          ..write('dayTime: $dayTime, ')
          ..write('status: $status, ')
          ..write('remark: $remark, ')
          ..write('semId: $semId, ')
          ..write('time: $time, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $SemTableTable semTable = $SemTableTable(this);
  late final $TimetableTable timetable = $TimetableTable(this);
  late final $AttendanceTableTable attendanceTable = $AttendanceTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    semTable,
    timetable,
    attendanceTable,
  ];
}

typedef $$SemTableTableCreateCompanionBuilder =
    SemTableCompanion Function({
      required String semid,
      required String semName,
      Value<int> rowid,
    });
typedef $$SemTableTableUpdateCompanionBuilder =
    SemTableCompanion Function({
      Value<String> semid,
      Value<String> semName,
      Value<int> rowid,
    });

final class $$SemTableTableReferences
    extends BaseReferences<_$AppDatabase, $SemTableTable, SemTableData> {
  $$SemTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$TimetableTable, List<TimetableData>>
  _timetableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.timetable,
    aliasName: $_aliasNameGenerator(db.semTable.semid, db.timetable.semId),
  );

  $$TimetableTableProcessedTableManager get timetableRefs {
    final manager = $$TimetableTableTableManager(
      $_db,
      $_db.timetable,
    ).filter((f) => f.semId.semid.sqlEquals($_itemColumn<String>('semid')!));

    final cache = $_typedResult.readTableOrNull(_timetableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AttendanceTableTable, List<AttendanceTableData>>
  _attendanceTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.attendanceTable,
    aliasName: $_aliasNameGenerator(
      db.semTable.semid,
      db.attendanceTable.semId,
    ),
  );

  $$AttendanceTableTableProcessedTableManager get attendanceTableRefs {
    final manager = $$AttendanceTableTableTableManager(
      $_db,
      $_db.attendanceTable,
    ).filter((f) => f.semId.semid.sqlEquals($_itemColumn<String>('semid')!));

    final cache = $_typedResult.readTableOrNull(
      _attendanceTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SemTableTableFilterComposer
    extends Composer<_$AppDatabase, $SemTableTable> {
  $$SemTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get semid => $composableBuilder(
    column: $table.semid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get semName => $composableBuilder(
    column: $table.semName,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> timetableRefs(
    Expression<bool> Function($$TimetableTableFilterComposer f) f,
  ) {
    final $$TimetableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.timetable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableTableFilterComposer(
            $db: $db,
            $table: $db.timetable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> attendanceTableRefs(
    Expression<bool> Function($$AttendanceTableTableFilterComposer f) f,
  ) {
    final $$AttendanceTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.attendanceTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableTableFilterComposer(
            $db: $db,
            $table: $db.attendanceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SemTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SemTableTable> {
  $$SemTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get semid => $composableBuilder(
    column: $table.semid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get semName => $composableBuilder(
    column: $table.semName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SemTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SemTableTable> {
  $$SemTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get semid =>
      $composableBuilder(column: $table.semid, builder: (column) => column);

  GeneratedColumn<String> get semName =>
      $composableBuilder(column: $table.semName, builder: (column) => column);

  Expression<T> timetableRefs<T extends Object>(
    Expression<T> Function($$TimetableTableAnnotationComposer a) f,
  ) {
    final $$TimetableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.timetable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TimetableTableAnnotationComposer(
            $db: $db,
            $table: $db.timetable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> attendanceTableRefs<T extends Object>(
    Expression<T> Function($$AttendanceTableTableAnnotationComposer a) f,
  ) {
    final $$AttendanceTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semid,
      referencedTable: $db.attendanceTable,
      getReferencedColumn: (t) => t.semId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AttendanceTableTableAnnotationComposer(
            $db: $db,
            $table: $db.attendanceTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SemTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SemTableTable,
          SemTableData,
          $$SemTableTableFilterComposer,
          $$SemTableTableOrderingComposer,
          $$SemTableTableAnnotationComposer,
          $$SemTableTableCreateCompanionBuilder,
          $$SemTableTableUpdateCompanionBuilder,
          (SemTableData, $$SemTableTableReferences),
          SemTableData,
          PrefetchHooks Function({bool timetableRefs, bool attendanceTableRefs})
        > {
  $$SemTableTableTableManager(_$AppDatabase db, $SemTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$SemTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$SemTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$SemTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> semid = const Value.absent(),
                Value<String> semName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SemTableCompanion(
                semid: semid,
                semName: semName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String semid,
                required String semName,
                Value<int> rowid = const Value.absent(),
              }) => SemTableCompanion.insert(
                semid: semid,
                semName: semName,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$SemTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            timetableRefs = false,
            attendanceTableRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (timetableRefs) db.timetable,
                if (attendanceTableRefs) db.attendanceTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (timetableRefs)
                    await $_getPrefetchedData<
                      SemTableData,
                      $SemTableTable,
                      TimetableData
                    >(
                      currentTable: table,
                      referencedTable: $$SemTableTableReferences
                          ._timetableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SemTableTableReferences(
                                db,
                                table,
                                p0,
                              ).timetableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.semId == item.semid,
                          ),
                      typedResults: items,
                    ),
                  if (attendanceTableRefs)
                    await $_getPrefetchedData<
                      SemTableData,
                      $SemTableTable,
                      AttendanceTableData
                    >(
                      currentTable: table,
                      referencedTable: $$SemTableTableReferences
                          ._attendanceTableRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$SemTableTableReferences(
                                db,
                                table,
                                p0,
                              ).attendanceTableRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.semId == item.semid,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SemTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SemTableTable,
      SemTableData,
      $$SemTableTableFilterComposer,
      $$SemTableTableOrderingComposer,
      $$SemTableTableAnnotationComposer,
      $$SemTableTableCreateCompanionBuilder,
      $$SemTableTableUpdateCompanionBuilder,
      (SemTableData, $$SemTableTableReferences),
      SemTableData,
      PrefetchHooks Function({bool timetableRefs, bool attendanceTableRefs})
    >;
typedef $$TimetableTableCreateCompanionBuilder =
    TimetableCompanion Function({
      required int serial,
      required String day,
      required String slot,
      required String courseCode,
      required String courseType,
      required String courseName,
      required String roomNo,
      required String block,
      required String startTime,
      required String endTime,
      required String semId,
      required int time,
      Value<int> rowid,
    });
typedef $$TimetableTableUpdateCompanionBuilder =
    TimetableCompanion Function({
      Value<int> serial,
      Value<String> day,
      Value<String> slot,
      Value<String> courseCode,
      Value<String> courseType,
      Value<String> courseName,
      Value<String> roomNo,
      Value<String> block,
      Value<String> startTime,
      Value<String> endTime,
      Value<String> semId,
      Value<int> time,
      Value<int> rowid,
    });

final class $$TimetableTableReferences
    extends BaseReferences<_$AppDatabase, $TimetableTable, TimetableData> {
  $$TimetableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $SemTableTable _semIdTable(_$AppDatabase db) => db.semTable
      .createAlias($_aliasNameGenerator(db.timetable.semId, db.semTable.semid));

  $$SemTableTableProcessedTableManager get semId {
    final $_column = $_itemColumn<String>('sem_id')!;

    final manager = $$SemTableTableTableManager(
      $_db,
      $_db.semTable,
    ).filter((f) => f.semid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_semIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TimetableTableFilterComposer
    extends Composer<_$AppDatabase, $TimetableTable> {
  $$TimetableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get roomNo => $composableBuilder(
    column: $table.roomNo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get block => $composableBuilder(
    column: $table.block,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  $$SemTableTableFilterComposer get semId {
    final $$SemTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemTableTableFilterComposer(
            $db: $db,
            $table: $db.semTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimetableTableOrderingComposer
    extends Composer<_$AppDatabase, $TimetableTable> {
  $$TimetableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get day => $composableBuilder(
    column: $table.day,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get roomNo => $composableBuilder(
    column: $table.roomNo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get block => $composableBuilder(
    column: $table.block,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  $$SemTableTableOrderingComposer get semId {
    final $$SemTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemTableTableOrderingComposer(
            $db: $db,
            $table: $db.semTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimetableTableAnnotationComposer
    extends Composer<_$AppDatabase, $TimetableTable> {
  $$TimetableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get day =>
      $composableBuilder(column: $table.day, builder: (column) => column);

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<String> get courseCode => $composableBuilder(
    column: $table.courseCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseType => $composableBuilder(
    column: $table.courseType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get courseName => $composableBuilder(
    column: $table.courseName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get roomNo =>
      $composableBuilder(column: $table.roomNo, builder: (column) => column);

  GeneratedColumn<String> get block =>
      $composableBuilder(column: $table.block, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  $$SemTableTableAnnotationComposer get semId {
    final $$SemTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemTableTableAnnotationComposer(
            $db: $db,
            $table: $db.semTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$TimetableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TimetableTable,
          TimetableData,
          $$TimetableTableFilterComposer,
          $$TimetableTableOrderingComposer,
          $$TimetableTableAnnotationComposer,
          $$TimetableTableCreateCompanionBuilder,
          $$TimetableTableUpdateCompanionBuilder,
          (TimetableData, $$TimetableTableReferences),
          TimetableData,
          PrefetchHooks Function({bool semId})
        > {
  $$TimetableTableTableManager(_$AppDatabase db, $TimetableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TimetableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$TimetableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TimetableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> serial = const Value.absent(),
                Value<String> day = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<String> courseCode = const Value.absent(),
                Value<String> courseType = const Value.absent(),
                Value<String> courseName = const Value.absent(),
                Value<String> roomNo = const Value.absent(),
                Value<String> block = const Value.absent(),
                Value<String> startTime = const Value.absent(),
                Value<String> endTime = const Value.absent(),
                Value<String> semId = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TimetableCompanion(
                serial: serial,
                day: day,
                slot: slot,
                courseCode: courseCode,
                courseType: courseType,
                courseName: courseName,
                roomNo: roomNo,
                block: block,
                startTime: startTime,
                endTime: endTime,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int serial,
                required String day,
                required String slot,
                required String courseCode,
                required String courseType,
                required String courseName,
                required String roomNo,
                required String block,
                required String startTime,
                required String endTime,
                required String semId,
                required int time,
                Value<int> rowid = const Value.absent(),
              }) => TimetableCompanion.insert(
                serial: serial,
                day: day,
                slot: slot,
                courseCode: courseCode,
                courseType: courseType,
                courseName: courseName,
                roomNo: roomNo,
                block: block,
                startTime: startTime,
                endTime: endTime,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TimetableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({semId = false}) {
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
                  dynamic
                >
              >(state) {
                if (semId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.semId,
                            referencedTable: $$TimetableTableReferences
                                ._semIdTable(db),
                            referencedColumn:
                                $$TimetableTableReferences
                                    ._semIdTable(db)
                                    .semid,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TimetableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TimetableTable,
      TimetableData,
      $$TimetableTableFilterComposer,
      $$TimetableTableOrderingComposer,
      $$TimetableTableAnnotationComposer,
      $$TimetableTableCreateCompanionBuilder,
      $$TimetableTableUpdateCompanionBuilder,
      (TimetableData, $$TimetableTableReferences),
      TimetableData,
      PrefetchHooks Function({bool semId})
    >;
typedef $$AttendanceTableTableCreateCompanionBuilder =
    AttendanceTableCompanion Function({
      required int serial,
      required String date,
      required String slot,
      required String dayTime,
      required String status,
      required String remark,
      required String semId,
      required int time,
      Value<int> rowid,
    });
typedef $$AttendanceTableTableUpdateCompanionBuilder =
    AttendanceTableCompanion Function({
      Value<int> serial,
      Value<String> date,
      Value<String> slot,
      Value<String> dayTime,
      Value<String> status,
      Value<String> remark,
      Value<String> semId,
      Value<int> time,
      Value<int> rowid,
    });

final class $$AttendanceTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AttendanceTableTable,
          AttendanceTableData
        > {
  $$AttendanceTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SemTableTable _semIdTable(_$AppDatabase db) =>
      db.semTable.createAlias(
        $_aliasNameGenerator(db.attendanceTable.semId, db.semTable.semid),
      );

  $$SemTableTableProcessedTableManager get semId {
    final $_column = $_itemColumn<String>('sem_id')!;

    final manager = $$SemTableTableTableManager(
      $_db,
      $_db.semTable,
    ).filter((f) => f.semid.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_semIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AttendanceTableTableFilterComposer
    extends Composer<_$AppDatabase, $AttendanceTableTable> {
  $$AttendanceTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get dayTime => $composableBuilder(
    column: $table.dayTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnFilters(column),
  );

  $$SemTableTableFilterComposer get semId {
    final $$SemTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemTableTableFilterComposer(
            $db: $db,
            $table: $db.semTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AttendanceTableTable> {
  $$AttendanceTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get serial => $composableBuilder(
    column: $table.serial,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slot => $composableBuilder(
    column: $table.slot,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get dayTime => $composableBuilder(
    column: $table.dayTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get remark => $composableBuilder(
    column: $table.remark,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get time => $composableBuilder(
    column: $table.time,
    builder: (column) => ColumnOrderings(column),
  );

  $$SemTableTableOrderingComposer get semId {
    final $$SemTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemTableTableOrderingComposer(
            $db: $db,
            $table: $db.semTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttendanceTableTable> {
  $$AttendanceTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get serial =>
      $composableBuilder(column: $table.serial, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get slot =>
      $composableBuilder(column: $table.slot, builder: (column) => column);

  GeneratedColumn<String> get dayTime =>
      $composableBuilder(column: $table.dayTime, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get remark =>
      $composableBuilder(column: $table.remark, builder: (column) => column);

  GeneratedColumn<int> get time =>
      $composableBuilder(column: $table.time, builder: (column) => column);

  $$SemTableTableAnnotationComposer get semId {
    final $$SemTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.semId,
      referencedTable: $db.semTable,
      getReferencedColumn: (t) => t.semid,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SemTableTableAnnotationComposer(
            $db: $db,
            $table: $db.semTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AttendanceTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AttendanceTableTable,
          AttendanceTableData,
          $$AttendanceTableTableFilterComposer,
          $$AttendanceTableTableOrderingComposer,
          $$AttendanceTableTableAnnotationComposer,
          $$AttendanceTableTableCreateCompanionBuilder,
          $$AttendanceTableTableUpdateCompanionBuilder,
          (AttendanceTableData, $$AttendanceTableTableReferences),
          AttendanceTableData,
          PrefetchHooks Function({bool semId})
        > {
  $$AttendanceTableTableTableManager(
    _$AppDatabase db,
    $AttendanceTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$AttendanceTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$AttendanceTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$AttendanceTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> serial = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> slot = const Value.absent(),
                Value<String> dayTime = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> remark = const Value.absent(),
                Value<String> semId = const Value.absent(),
                Value<int> time = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AttendanceTableCompanion(
                serial: serial,
                date: date,
                slot: slot,
                dayTime: dayTime,
                status: status,
                remark: remark,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int serial,
                required String date,
                required String slot,
                required String dayTime,
                required String status,
                required String remark,
                required String semId,
                required int time,
                Value<int> rowid = const Value.absent(),
              }) => AttendanceTableCompanion.insert(
                serial: serial,
                date: date,
                slot: slot,
                dayTime: dayTime,
                status: status,
                remark: remark,
                semId: semId,
                time: time,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$AttendanceTableTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({semId = false}) {
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
                  dynamic
                >
              >(state) {
                if (semId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.semId,
                            referencedTable: $$AttendanceTableTableReferences
                                ._semIdTable(db),
                            referencedColumn:
                                $$AttendanceTableTableReferences
                                    ._semIdTable(db)
                                    .semid,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AttendanceTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AttendanceTableTable,
      AttendanceTableData,
      $$AttendanceTableTableFilterComposer,
      $$AttendanceTableTableOrderingComposer,
      $$AttendanceTableTableAnnotationComposer,
      $$AttendanceTableTableCreateCompanionBuilder,
      $$AttendanceTableTableUpdateCompanionBuilder,
      (AttendanceTableData, $$AttendanceTableTableReferences),
      AttendanceTableData,
      PrefetchHooks Function({bool semId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$SemTableTableTableManager get semTable =>
      $$SemTableTableTableManager(_db, _db.semTable);
  $$TimetableTableTableManager get timetable =>
      $$TimetableTableTableManager(_db, _db.timetable);
  $$AttendanceTableTableTableManager get attendanceTable =>
      $$AttendanceTableTableTableManager(_db, _db.attendanceTable);
}
