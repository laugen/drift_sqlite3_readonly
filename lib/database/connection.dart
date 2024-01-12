import 'dart:async';
import 'dart:io';

import 'package:drift/backends.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqlite3/sqlite3.dart';

DelegatedDatabase connect({required String databaseName}) {
  String path = databasePath(databaseName: databaseName);
  Database database = sqlite3.open(path, mode: OpenMode.readOnly, uri: true);

  ResultSet resultSet = database.select('SELECT * FROM tbl1');
  debugPrint('resultSet: $resultSet');

  return NativeDatabase.opened(database, logStatements: true);
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  if (kDebugMode) {
    await VerifySelf(database).validateDatabaseSchema();
  }
}

String databasePath({required String databaseName}) {
  String path = join(
    Platform.environment['PWD'].toString(),
    'lib',
    'database',
    databaseName,
  );
  debugPrint('database path: $path');
  return path;
}

File databaseFile({required String databaseName}) {
  return File(databasePath(databaseName: databaseName));
}
