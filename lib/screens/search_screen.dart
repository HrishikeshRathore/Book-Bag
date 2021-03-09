import 'package:flutter/material.dart';
import 'package:movie_junction/provider/data_provider.dart';
import 'package:movie_junction/widgets/grid_model.dart';
import 'package:movie_junction/widgets/search_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {

  static const routeName = '/search-screen';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool title = true;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
       body: Column(
         children: [
           Container(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    child: Image(image: AssetImage('assets/appbg.jpg'),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 35),
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Discover Book,\nDiscover Magic',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(12),
                    alignment: Alignment.bottomCenter,
                    child: SearchWidget(),
                  ),
                ],
              ),
            ),

           Container(
             padding: EdgeInsets.only(top: 10),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Text('Category:'),
                 Row(
                   children: [
                     FlatButton(
                       onPressed: () {
                         Provider.of<DataProvider>(context, listen: false).choosenCategory = 'intitle';
                          setState(() {
                            title = true;
                          });
                         },
                       child: Text('Title', style: TextStyle(
                         color: title ? Colors.redAccent : Colors.grey,
                       ),),
                     ),
                     SizedBox(),
                     FlatButton(
                       onPressed: () {
                         Provider.of<DataProvider>(context, listen: false).choosenCategory = 'inauthor';
                         setState(() {
                           title = false;
                         });
                       },
                       child: Text('Author', style: TextStyle(
                         color: !title ? Colors.redAccent : Colors.grey,
                       ),),
                     ),
                   ],
                 ),
               ],
             ),
           ),

           Divider(),

            Expanded(
               child: FutureBuilder(
                 future: Provider.of<DataProvider>(context, listen: false).getSearchedData(),
                 builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                   return snapshot.connectionState == ConnectionState.waiting ?
                       Center(
                         child: Image(image: AssetImage('assets/loader.gif'),),
                       ) :
                Container(
                     padding: EdgeInsets.all(5),
                     width: double.infinity,
                     child: Consumer<DataProvider>(
                       builder: (BuildContext context, providerCall, Widget child) {
                         return GridView.builder(
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                             crossAxisSpacing: 5,
                             mainAxisSpacing: 5,
                             crossAxisCount: 3,
                             childAspectRatio: 1.5 / 3,
                           ),
                           itemBuilder: (ctx, i) =>
                               GridModel(
                                 id: providerCall.listOfBooks[i].id,
                                 publisher: providerCall.listOfBooks[i].publisher,
                                 published: providerCall.listOfBooks[i].publishedDate,
                                 bookName: providerCall.listOfBooks[i].title,
                                 pages: providerCall.listOfBooks[i].pageCount,
                                 amount: providerCall.listOfBooks[i].amount,
                                 subtitle: providerCall.listOfBooks[i].subtitle,
                                 description: providerCall.listOfBooks[i].description,
                                 image: providerCall.listOfBooks[i].thumbnailUrl,
                                 buyLink: providerCall.listOfBooks[i].buyLink,
                                 previewLink: providerCall.listOfBooks[i].previewLink,
                                 rating: providerCall.listOfBooks[i].averageRating,
                                 authorName: providerCall.listOfBooks[i].authors,
                                 subject: providerCall.listOfBooks[i].categories,
                               ),
                           itemCount: providerCall.listOfBooks.length,
                         );
                       },
                     ),
                   );
                 },

               ),
               ),

           Container(
             width: double.infinity,
             padding: EdgeInsets.all(5),
             child: Card(
               elevation: 4,
               child: Consumer<DataProvider> (
                   builder: (BuildContext context, value, Widget child) {
                     return Row(
                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                       children: [
                         Text(
                           value.totalBookCount == null ? '0 books found' : '${value.totalBookCount}  books found',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             color: Colors.redAccent,
                           ),
                         ),
                         SizedBox(),
                         SizedBox(),
                         IconButton(
                           icon: Icon(
                             Icons.arrow_back_ios,
                           ),
                           color: Colors.red,
                           disabledColor: Colors.grey,
                           onPressed: value.initialIndex <= 0 ? null : () => value.previousPage(),
                         ),
                         IconButton(
                           icon: Icon(
                             Icons.arrow_forward_ios,
                           ),
                           color: Colors.red,
                           disabledColor: Colors.grey ,
                           onPressed: () => value.nextPage(),
                         ),
                       ],
                     );
                   }
               ),
             ),
           ),
         ],
       ),
    );
  }
}
