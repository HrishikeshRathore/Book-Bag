import 'package:flutter/material.dart';
import 'package:movie_junction/best%20seller/best_seller_screen.dart';
import 'package:movie_junction/best%20seller/nyt_data_provider.dart';
import 'package:movie_junction/provider/data_provider.dart';
import 'package:movie_junction/provider/database_provider.dart';
import 'package:movie_junction/screens/category_screen.dart';
import 'package:movie_junction/screens/details_screen.dart';
import 'package:movie_junction/screens/home_screen.dart';
import 'package:movie_junction/screens/saved_book_screen.dart';
import 'package:movie_junction/screens/search_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => DataProvider(),),
        ChangeNotifierProvider(create: (ctx) => DatabaseProvider(),),
        ChangeNotifierProvider(create: (ctx) => NytDataProvider(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

        ),
        home: HomeScreen(),
        routes: {
          CategoryScreen.routeName : (ctx) => CategoryScreen(),
          SearchScreen.routeName : (ctx) => SearchScreen(),
          DetailsScreen.routeName : (ctx) => DetailsScreen(),
          SavedBookScreen.routeName: (ctx) => SavedBookScreen(),
          BestSellerScreen.routeName: (ctx) => BestSellerScreen(),
        },
      ),
    );
  }
}

