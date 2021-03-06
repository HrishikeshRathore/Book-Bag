import 'package:flutter/material.dart';
import 'package:movie_junction/best%20seller/best_seller_screen.dart';
import 'package:movie_junction/provider/data_provider.dart';
import 'package:movie_junction/screens/saved_book_screen.dart';
import 'package:movie_junction/screens/search_screen.dart';
import 'package:movie_junction/widgets/categories.dart';
import '../best seller/nyt_data_provider.dart';
import '../best seller/bestseller_list.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final bookCount = Provider.of<DataProvider>(context, listen: false).listOfBooks;
    final nytProvider = Provider.of<NytDataProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(

        actions: [
          IconButton(
              padding: EdgeInsets.all(20),
              icon: Icon(Icons.save_rounded, color: Colors.white, size: 30,),
              onPressed: () {
                Navigator.of(context).pushNamed(SavedBookScreen.routeName);
              }
          ),
        ],
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                    'Book Bin',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30,
                    ),
            ),
          ),
          toolbarHeight: 150,
          flexibleSpace: Image(
            image: AssetImage('assets/appbg.jpg'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.transparent,
        ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(SearchScreen.routeName);
        },
        icon: Icon(Icons.search_sharp,),
        label: Text('Search', style: TextStyle(fontWeight: FontWeight.bold),),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10),),
        ),
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
      ),

      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 5),
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(15)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Text(
                      'Categories:',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    height: 100,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      children: [
                        Categories('assets/bookbg/arts.jpeg' ,'Art & Literature', bookCount.length),
                        Categories('assets/bookbg/bio.jpeg', 'Biography / Autobiography', bookCount.length),
                        Categories('assets/bookbg/drama.jpeg','Drama', bookCount.length),
                        Categories('assets/bookbg/edu.jpeg','Education', bookCount.length),
                        Categories('assets/bookbg/comedy.jpeg','Comedy', bookCount.length),
                        Categories('assets/bookbg/fantasy.jpeg' ,'Fantasy', bookCount.length),
                        Categories('assets/bookbg/fiction.jpeg', 'Fiction', bookCount.length),
                        Categories('assets/bookbg/historical.jpeg','Historical', bookCount.length),
                        Categories('assets/bookbg/horror.jpeg','Horror', bookCount.length),
                        Categories('assets/bookbg/humor.jpeg', 'Humor', bookCount.length),
                        Categories('assets/bookbg/religious.jpeg', 'Religious', bookCount.length),
                        Categories('assets/bookbg/sports.jpeg', 'Sports', bookCount.length),
                        Categories('assets/bookbg/suspense.jpeg', 'Suspense', bookCount.length),
                        Categories('assets/bookbg/thriller.jpeg', 'Thriller', bookCount.length),
                        Categories('assets/bookbg/travel.jpeg', 'Travel/Photography', bookCount.length),
                        Categories('assets/bookbg/comic.jpeg', 'Comic', bookCount.length),
                        Categories('assets/bookbg/love.jpeg', 'Love / Romance', bookCount.length),
                        Categories('assets/bookbg/action.jpeg', 'Action', bookCount.length),
                        Categories('assets/bookbg/cook.jpeg', 'Cooking', bookCount.length),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Card(
                elevation: 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Discover Bestsellers',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),

                                Text(
                                  'Weekly list of New York Times bestsellers from different categories.',
                                  style: TextStyle(
                                    color: Colors.red[400],
                                    fontSize: 10,
                                  ),
                                )
                              ],
                            ),
                          ),

                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(BestSellerScreen.routeName);
                            },
                            child: Text('See all',
                              style: TextStyle(
                                color: Colors.red[400],
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      Expanded(
                        child: FutureBuilder(
                          future: Provider.of<NytDataProvider>(context).getDataNyt(),
                          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                            return snapshot.connectionState == ConnectionState.waiting ?
                              Center(child: CircularProgressIndicator(),) :
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    nytProvider.catName == null ? 'No name' : nytProvider.catName,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),

                                  Divider(height: 10,),
                                  Expanded(
                                    child: Consumer<NytDataProvider>(
                                      builder: (BuildContext context, providerCall, Widget child) {
                                        
                                        return ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                shrinkWrap: true,
                                                itemBuilder: (ctx, ind) => BestsellerList(
                                                bookTitle: providerCall.listOfData[ind].bookTitle,
                                                bookAuthor: providerCall.listOfData[ind].author,
                                                bookImage: providerCall.listOfData[ind].image,
                                                bookRank: providerCall.listOfData[ind].rank,
                                                publisher: providerCall.listOfData[ind].publisher,
                                                description: providerCall.listOfData[ind].description,
                                                buyLink: providerCall.listOfData[ind].buyLink,
                                              ),
                                              itemCount: providerCall.listOfData.length,
                                              );
                                      },
                                    ),
                                  ),
                                ],
                              );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      )
    );
  }
}
