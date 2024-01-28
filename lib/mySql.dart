import 'package:mysql1/mysql1.dart';

class mySql {
  mySql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: '10.0.2.2',
        port: 3306,
        user: 'root',
        password: 'root',
        db: 'Cookbook',
    );
    return await MySqlConnection.connect(settings);
  }
}