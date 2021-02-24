import 'package:http/http.dart' as http;

class API{

  static Future<String> getData(String search, int index) async{
    http.Response response = await http.get('https://www.googleapis.com/books/v1/volumes?q=$search+subject&maxResults=12&startIndex=$index');
    return response.body;
  }
}