import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBAdmin {
  Database? myDatabase; //objeto principal
  static final DBAdmin db = DBAdmin._();
  DBAdmin._();

  Future<Database?> getCheckDatabase() async{
    if (myDatabase != null) return myDatabase; //si existe myDatabase la retornamos, sino la inicion con initDB
    myDatabase = await initDB(); //Creación de la base de datos
    return myDatabase;
  }

  Future<Database> initDB() async{
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
            .execute("CREATE TABLE BOOK(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, author TEXT, description TEXT, image TEXT)"); //aqui podemos ejecutar comandos SQL
      },
    );
  }

  //READ - REALIZAR CONSULTAS A LA TABLA

  getBooks() async{
    final Database? db = await getCheckDatabase();
    List res = await db!.rawQuery("SELECT * FROM BOOK");
    print(res);
  }


}
