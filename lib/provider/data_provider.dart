import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:movie_junction/api.dart';
import 'file:///C:/flutter_projects/movie_junction/lib/models/detail_model.dart';

class DataProvider with ChangeNotifier{

  List<DetailModel> listOfBooks =[];

  int initialIndex=0;
  var subject;
  bool disableButtonPrev = false;
  bool disableButtonNext = false;

  Future<void> getDataFromApi(String subject) async{
    var bookData = await API.getData(subject,initialIndex);
    print(jsonDecode(bookData));
    this.subject = subject;
    var data = jsonDecode(bookData) as Map;
    var bookList = data['items'] as List;

    List<DetailModel> tempData = [];

    if(tempData == null){
      listOfBooks = [];
      notifyListeners();
      return;
    }

    bookList.forEach((book) {
      tempData.add(
        DetailModel(
            book['volumeInfo']['title'],
            book['volumeInfo']['authors'],
            book['volumeInfo']['categories'],
            book['volumeInfo']['subtitle'],
            book['volumeInfo']['publisher'],
            book['volumeInfo']['imageLinks'] == null ? '' : book['volumeInfo']['imageLinks']['thumbnail'],
        ),
      );
    });

    listOfBooks = tempData;
    listOfBooks.forEach((element) {
      print(element.bookName);
      print(element.image);
    });
    notifyListeners();
  }

  void nextPage() {
    initialIndex += 20;
    print(initialIndex);
    getDataFromApi(subject);
    notifyListeners();
  }

  void previousPage() {
    initialIndex -=20;
    print(initialIndex);
    getDataFromApi(subject);
    notifyListeners();
  }
}