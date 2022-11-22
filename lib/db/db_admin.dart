import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase; //objeto principal
  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  getCheckDatabase() {
    if (myDatabase != null) return myDatabase; //si existe myDatabase la retornamos, sino la inicion con initDB
    myDatabase = initDB(); //Creación de la base de datos
    return myDatabase;
  }

  initDB() async {
    //este metodo nos ayuda a crear y gestionar nuestra BD
    //initDB o createDB, ambos funcionan
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "BookDB.db");
    return await openDatabase( //con esto abriremos el metodo para crear una tabla en la BD
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        await db
            .execute("CREATE TABLE ..."); //aqui podemos ejecutar comandos SQL
      },
    );
  }
}
