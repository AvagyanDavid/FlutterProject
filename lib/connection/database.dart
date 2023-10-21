
// import 'package:flutter/cupertino.dart';
// import 'package:meta/meta.dart';
// import 'package:flutter/cupertino.dart';
import 'package:mysql1/mysql1.dart';
export 'database.dart';

class Mysql {
  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
      host: '10.0.2.2',
      port: 3306,
      user: 'root',
      db: 'mydb',
      password: '3915'
    );
    return await MySqlConnection.connect(settings);
  }
}


// Future main() async {
//    var conn = await MySqlConnection.connect(new ConnectionSettings(
//       host: '127.0.0.1',
//       port: 3306,
//       user: 'root',
//       db: 'db',
//       password: '3915'));




   /// Готовые запросы
// }
  //
  // var results2 = await conn.query(
  //     'select * from HostBegin_StripBarsukKazan');
  // for (var row in results2) {
  //   print('Id: ${row[0]}, TakeRadioTerminalTelephone: ${row[1]}, SendMessagea: ${row[2]} ');
  // }
// Future<MySqlConnection> host_begin_mysql() async {
//     var con = await main();
//     var result = await con.query(
//     'INSERT INTO HostBegin_StripBarsukKazan (TakeRadioTerminalTelephone, CommentWorker_TakeRadioTerminalTelephone, '
//         'CommentDirector_TakeRadioTerminalTelephone,'
//     'SendMessage, CommentWorker_SendMessage, CommentDirector_SendMessage) VALUES (?, ?, ?, ?, ?, ?)',
//     [true,'fhdakfha','',true, 'fhakjdhfkja', '']);
//     print('Inserted row id=${result.insertId}');
//     return con;
// }