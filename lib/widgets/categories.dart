import 'package:flutter/material.dart';
import 'package:movie_junction/screens/category_screen.dart';

class Categories extends StatelessWidget {

  final String book;
  final int count;

  Categories(this.book, this.count);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryScreen.routeName, arguments: Categories(book,count));
      },
      child: Container(
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.black),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.book),
              Text(book),
            ],
          ),
        ),
      ),
    );
  }
}
