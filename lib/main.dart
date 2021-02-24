import 'package:flutter/material.dart';
import 'package:movie_junction/provider/data_provider.dart';
import 'package:movie_junction/screens/category_screen.dart';
import 'package:movie_junction/screens/home_screen.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => DataProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

        ),
        home: HomeScreen(),
        routes: {
          CategoryScreen.routeName : (ctx) => CategoryScreen(),
        },
      ),
    );
  }
}

