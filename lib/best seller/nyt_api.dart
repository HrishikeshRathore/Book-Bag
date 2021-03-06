import 'package:http/http.dart';

class NYTApi{

  static Future<String> getNytCategory() async{
    Response response = await get('https://api.nytimes.com/svc/books/v3/lists/names.json?api-key=v95jOUGBGukhAOgSl3dioCauIINLO0IG');
    return response.body;
  }

  static Future<String> getNytData(String category) async{
    Response response = await get('https://api.nytimes.com/svc/books/v3/lists/current/$category.json?api-key=v95jOUGBGukhAOgSl3dioCauIINLO0IG');
    return response.body;
  }

}