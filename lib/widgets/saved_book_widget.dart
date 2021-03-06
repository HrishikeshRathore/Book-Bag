import 'package:flutter/material.dart';
import 'package:movie_junction/models/utils.dart';

class SavedBookWidget extends StatelessWidget {

  final String imageLink;
  final String bookTitle;
  final String bookAuthor;

  SavedBookWidget({this.imageLink, this.bookTitle, this.bookAuthor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                child: Image.network(imageLink,
                  width: MediaQuery.of(context).size.width * .25,
                  height: MediaQuery.of(context).size.height * .2,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 15,),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      Utils.trimString(bookTitle, 50),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Utils.trimString(bookAuthor, 50,),
                      style: TextStyle(
                        color: Colors.red,
                        letterSpacing: 1,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
