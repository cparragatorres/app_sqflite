import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite/db/db_admin.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DBAdmin.db.getBooksRaw();
    DBAdmin.db.getBooks();

    // DBAdmin.db.insertBook();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
