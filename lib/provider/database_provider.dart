import 'package:flutter/cupertino.dart';
import 'package:movie_junction/database/database_control.dart';
import 'package:movie_junction/models/saved_book.dart';

class DatabaseProvider with ChangeNotifier{

  List<SavedBook> _savedBooks =[];

  List<SavedBook> get savedBooks{
    return [..._savedBooks];
  }

  Future<void> getSavedBooks() async {



      var listOfBooks = await DatabaseControl.getBooks();
      List<SavedBook> saved_Books = [];

      listOfBooks.forEach((savedBook) {
        saved_Books.add(SavedBook(
          id: savedBook['id'],
          title: savedBook['title'],
          image: savedBook['image'],
          author: savedBook['author'],
        ));
      });

      _savedBooks = saved_Books;


      notifyListeners();


  }

}