import 'package:blott_assessment/domain/entities/user_entity.dart';
import 'package:clock/clock.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:uuid/uuid.dart';

part 'daos.dart';
part 'database.g.dart';
part 'mappings.dart';
part 'tables.dart';

@DriftDatabase(
  tables: [Users],
  daos: [UsersDao],
)
class Database extends _$Database {
  Database() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'blott_db.sqlite');
  }
}
