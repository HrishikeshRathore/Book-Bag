import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:movie_junction/best%20seller/category_list_model.dart';
import 'package:movie_junction/best%20seller/nyt_api.dart';
import 'package:movie_junction/best%20seller/nyt_data_model.dart';

class NytDataProvider with ChangeNotifier{

  List<NytDataModel> listOfData = [];
  List<String> listOfCategories = [];
  List<CategoryListModel> categoryScreenList = [];


  String catName;
  var randomElement;
  Random rnd = new Random();

  String getRandomCategory() {
    randomElement = listOfCategories[rnd.nextInt(listOfCategories.length)];
    return randomElement;
  }

  Future<void> getDataNyt() async{
    await getCategoryData();

    var nytData = await NYTApi.getNytData(randomElement);
    var dataDecoded = jsonDecode(nytData) as Map;
    var dataResults = dataDecoded['results'] as Map;
    catName = dataResults['list_name'];
    var dataBooks = dataResults['books'] as List;

    List<NytDataModel> tempData = [];

    if(dataBooks == null){
      listOfData = [];
      notifyListeners();
      return;
    }

    dataBooks.forEach((book) {
      tempData.add(
        NytDataModel(
          author: book['author'] == null ? 'Book Author Unknown' : book['author'],
          bookTitle: book['title'] == null ? 'Book Title Unknown' : book['title'],
          image: book['book_image'] == null ? 'https://thumbs.dreamstime.com/b/grunge-textured-not-available-stamp-seal-not-available-stamp-seal-watermark-distress-style-blue-vector-rubber-print-not-138792800.jpg' : book['book_image'],
          rank: book['rank'],
          publisher: book['publisher'] == null ? 'No Publisher Available' : book['publisher'],
          description: book['description'] == null ? 'No Description Available' : book['description'],
          buyLink: book['amazon_product_url'] == null ? '' : book['amazon_product_url'],
        ),
      );
    });
    listOfData = tempData;

    listOfData.forEach((element) {
    });

    notifyListeners();
  }

  Future<void> getCategoryData() async{
    var catData = await NYTApi.getNytCategory();
    var mapedData = jsonDecode(catData) as Map;
    var categoryResults = mapedData['results'] as List;
    
    List<String> tempCat = [];

    if(categoryResults == null){
      listOfCategories = [];
      return;
    }
    
    categoryResults.forEach((category) { 
      tempCat.add(category['list_name_encoded']);
    });

    listOfCategories = tempCat;

    List<CategoryListModel> tempList = [];

    categoryResults.forEach((cat) {
      tempList.add(
        CategoryListModel(
          catId: cat['list_name_encoded'] == null ? '' : cat['list_name_encoded'],
          catName: cat['display_name'] == null ? '' : cat['display_name'],
          oldDate: cat['oldest_published_date'] == null ? '' : cat['oldest_published_date'],
          newDate: cat['newest_published_date'] == null ? '' : cat['newest_published_date'],
          updateStatus: cat['updated'] == null ? '' : cat['updated'],
        )
      );
    });

    categoryScreenList = tempList;

    getRandomCategory();
  }

}