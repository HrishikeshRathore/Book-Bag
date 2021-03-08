import 'package:connectivity/connectivity.dart';
import 'package:movie_junction/models/detail_model.dart';

class Utils{

  static String trimString(String changableString, int limit) {
    if(changableString.length <= limit){
      return changableString;
    }
    return changableString.substring(0, limit) + '...' ;
  }

  static String trimDate(String changableString, int limit) {
    if(changableString.length <= limit){
      return changableString;
    }
    return changableString.substring(0, limit);
  }

  static DetailModel bookFromJson(Map book) {
    var volumeInfo = book['volumeInfo'];
    var saleInfo = book['saleInfo'];
    var accessInfo = book['accessInfo'];
    return DetailModel(
      id: book['id'],
      title: volumeInfo['title'],
      subtitle: volumeInfo['subtitle'],
      publishedDate: volumeInfo['publishedDate'] == null
          ? '---'
          : volumeInfo['publishedDate'],
      authors: volumeInfo['authors'] != null
          ? (volumeInfo['authors'] as List<dynamic>)
          .map((author) => author.toString())
          .toList()
          : [''],
      publisher:
      volumeInfo['publisher'] == null ? '---' : volumeInfo['publisher'],
      description: volumeInfo['description'] ?? 'No description available.',
      pageCount: volumeInfo['pageCount'],
      categories: volumeInfo['categories'] == null
          ? []
          : (volumeInfo['categories'] as List<dynamic>)
          .map((category) => category.toString())
          .toList(),
      averageRating: volumeInfo['averageRating'] == null
          ? '---'
          : volumeInfo['averageRating'].toString(),
      thumbnailUrl: volumeInfo['imageLinks'] != null
          ? '${volumeInfo['imageLinks']['thumbnail']}'
          : 'https://www.wildhareboca.com/wp-content/uploads/sites/310/2018/03/image-not-available.jpg',
      previewLink: volumeInfo['previewLink'],
      infoLink: volumeInfo['infoLink'],
      buyLink: saleInfo['buyLink'],
      webReaderLink: accessInfo['webReaderLink'],
      isEbook: saleInfo['isEbook'],
      saleability: saleInfo['saleability'],
      amount: saleInfo['saleability'] != 'FOR_SALE'
          ? '---'
          : saleInfo['retailPrice']['amount'].toString(),
      currencyCode: saleInfo['saleability'] != 'FOR_SALE'
          ? '---'
          : saleInfo['retailPrice']['currencyCode'],
      accessViewStatus: accessInfo['accessViewStatus'],
    );
  }


}