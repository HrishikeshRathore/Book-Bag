import 'dart:async';
import 'package:movie_junction/models/saved_book.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
class DatabaseControl{

  static Future<Database> databaseBook() async {
    return openDatabase(

        join(await getDatabasesPath(), 'book_database.db'),

        onCreate: (db, version) async {

          return await db.execute(
            "CREATE TABLE books(id TEXT PRIMARY KEY, title TEXT, image TEXT, author TEXT)",
          );
        },
        version: 1);
  }


  static Future<void> insertBook(SavedBook savedBook) async{
    final db = await DatabaseControl.databaseBook();

    await db.insert(
      'books',
      savedBook.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<bool> findBook(String bookId) async{

    final db = await DatabaseControl.databaseBook();

    var bookFound = await db.query('books',
      where: "id = ?",
      whereArgs: [bookId],
    );

    if(bookFound.length == 0){
      return false;
    }
    else{
      return true;
    }
  }

  static Future<List<Map<String, dynamic>>> getBooks() async {
    // Get a reference to the database.
    final db = await DatabaseControl.databaseBook();

    // Query the table for all The Dogs.
    final List<Map<String, dynamic>> maps = await db.query('books');
    return maps;

  }

  static Future<void> deleteBook(String id) async{
    final db = await DatabaseControl.databaseBook();

    await db.delete(
      'books',
      where: "id = ?",
      whereArgs: [id],
    );
  }

}