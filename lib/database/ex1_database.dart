import 'package:drift/drift.dart';
import 'package:drift_sqlite3_readonly/database/connection.dart';

part 'ex1_database.g.dart';

const kDatabaseName = 'ex1';

/// Drift database ORM based on structure given in file ex1.drift
@DriftDatabase(include: {'ex1_schema.drift'})
class Ex1Database extends _$Ex1Database {
  Ex1Database({required String databaseName})
      : super(connect(databaseName: databaseName));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        // By overwriting this callback function the execution of m.createAll(); is avoided and therefore no
        // DDL statements of ex1.drift are performed!
      },
    );
  }
}
