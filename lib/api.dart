import 'package:http/http.dart' as http;

class API{

  static Future<String> getData(String subject, int index) async{
    http.Response response = await http.get('https://www.googleapis.com/books/v1/volumes?q=subject:$subject&printType=books&orderBy=newest&maxResults=12&startIndex=$index');
    return response.body;
  }

  static Future<String> getSearchedData(String search, String category, int index) async{
    http.Response response = await http.get('https://www.googleapis.com/books/v1/volumes?q=$category:$search&maxResults=12&startIndex=$index');
    return response.body;
  }
}