import 'package:flutter/material.dart';
import 'package:movie_junction/screens/category_screen.dart';

class Categories extends StatelessWidget {

  final String image;
  final String book;
  final int count;

  Categories(this.image, this.book, this.count);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(CategoryScreen.routeName, arguments: Categories(image,book,count));
      },
      child: Container(
        width: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: Colors.black),
        ),
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: EdgeInsets.all(1),
        child: Stack(
          children: [
           ClipRRect(
             borderRadius: BorderRadius.all(Radius.circular(10)),
             child: Image.asset(image, width: double.infinity, height: double.infinity, fit: BoxFit.cover,),
           ),
           Center(
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(book, textAlign: TextAlign.center, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 10,
                  ),),
                ),
          ),
          ],
        ),
      ),
    );
  }
}
