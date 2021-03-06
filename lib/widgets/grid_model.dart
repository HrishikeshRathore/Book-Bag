import 'package:flutter/material.dart';
import 'package:movie_junction/screens/details_screen.dart';

class GridModel extends StatelessWidget {

  final String id;
  final String bookName;
  final List<dynamic> authorName;
  final List<dynamic> subject;
  final String subtitle;
  final String publisher;
  final String image;
  final String published;
  final String description;
  final int pages;
  final String rating;
  final String amount;
  final String buyLink;
  final String previewLink;

  GridModel({
    this.id,
    this.bookName,
    this.authorName,
    this.subject,
    this.subtitle,
    this.publisher,
    this.image,
    this.published,
    this.description,
    this.pages,
    this.rating,
    this.amount,
    this.buyLink,
    this.previewLink,
  });



  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed(DetailsScreen.routeName, arguments: GridModel(
          id: this.id,
          bookName: this.bookName,
          subtitle: this.subtitle,
          description: this.description,
          previewLink: this.previewLink,
          subject: this.subject,
          buyLink: this.buyLink,
          rating: this.rating,
          image: this.image,
          amount: this.amount,
          pages: this.pages,
          published: this.published,
          publisher: this.publisher,
          authorName: this.authorName,
        ));
      },
      child: Container(
          padding: EdgeInsets.only(bottom: 20, left: 5, right: 5),
          child: Column(
            children: [
              Expanded(
                child: Card(
                    elevation: 4,
                    child: Container(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(image == ''? 'https://vcunited.club/wp-content/uploads/2020/01/No-image-available-2.jpg' : image, fit:BoxFit.cover,)),
                  ),
                ),
              ),

              SizedBox(height: 10,),

              Container(
                child: Text(bookName,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
      ),
    );
  }
}
