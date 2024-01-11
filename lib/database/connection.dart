import 'dart:async';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';

DatabaseConnection connect({required String databaseName}) {
  return DatabaseConnection.delayed(Future(() async {
    final File file = databaseFile(databaseName: databaseName);
    return NativeDatabase.createBackgroundConnection(file, logStatements: true);
  }));
}

Future<void> validateDatabaseSchema(GeneratedDatabase database) async {
  if (kDebugMode) {
    await VerifySelf(database).validateDatabaseSchema();
  }
}

File databaseFile({required String databaseName}) {
  String path = join(
    Platform.environment['PWD'].toString(),
    'lib',
    'database',
    databaseName,
  );
  debugPrint('database path: $path');
  return File(path);
}
