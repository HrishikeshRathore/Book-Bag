import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:movie_junction/api.dart';
import 'package:movie_junction/models/detail_model.dart';
import 'package:movie_junction/models/utils.dart';

class DataProvider with ChangeNotifier{

  List<DetailModel> listOfBooks =[];

  int totalBookCount;

  int initialIndex=0;
  var subject;
  bool disableButtonPrev = false;
  bool disableButtonNext = false;


  Future<void> getDataFromApi(String subject) async{
    listOfBooks = [];
    totalBookCount = 0;
    var bookData = await API.getData(subject,initialIndex);
    this.subject = subject;
    var data = jsonDecode(bookData) as Map;


    var bookList = data['items'] as List;
    totalBookCount = data['totalItems'];

    List<DetailModel> tempData = [];

    if(bookList == null){
      listOfBooks = [];
      notifyListeners();
      return;
    }

    bookList.forEach((book) {
      tempData.add(
        Utils.bookFromJson(book),
      );
    });

    listOfBooks = tempData;
    notifyListeners();
  }

  var finalSearchLetter;

  var choosenCategory = 'intitle';

  void getSearchedLetter(String searchLetter) {
    finalSearchLetter = searchLetter;
    getSearchedData();
  }

  Future<void> getSearchedData() async{

    var bookData = await API.getSearchedData(finalSearchLetter, choosenCategory, initialIndex);

    var data = jsonDecode(bookData) as Map;
    var bookList = data['items'] as List;
    totalBookCount = data['totalItems'];

    List<DetailModel> tempData = [];

    if(tempData == null){
      listOfBooks = [];
      notifyListeners();
      return;
    }

    bookList.forEach((book) {
      tempData.add(
        Utils.bookFromJson(book),
      );
    });
    listOfBooks = tempData;
    notifyListeners();
  }

  void nextPage() {
    if(initialIndex < totalBookCount) {
      initialIndex += 20;
    }
    else
      return;

    getDataFromApi(subject);
    notifyListeners();
  }

  void previousPage() {
    if(initialIndex > 19){
      initialIndex -=20;
    }
    else
      return;
    getDataFromApi(subject);
    notifyListeners();
  }



  Future<DetailModel> getDataUsingId(String id) async{

    var bookData = await API.getDataById(id);

    var data = jsonDecode(bookData) as Map;

    return Utils.bookFromJson(data);
  }



}