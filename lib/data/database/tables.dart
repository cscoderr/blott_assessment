part of 'database.dart';

const Uuid _uuid = Uuid();

@DataClassName('UserDataModel')
class Users extends Table {
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get firstName => text().named('first_name')();
  TextColumn get lastName => text().named('last_name')();
  DateTimeColumn get createdAt => dateTime()();

  @override
  Set<Column<Object>> get primaryKey => <Column<Object>>{id};
}
