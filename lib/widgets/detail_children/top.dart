import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movie_junction/models/utils.dart';

class Top extends StatelessWidget {

  final String title;
  final String author;
  final String subtitle;
  final String image;
  final String rating;
  final String category;
  final String priceStatus;
  final String publisher;
  final String published;

  Top({
   this.title,
   this.author,
   this.subtitle,
   this.image,
   this.rating,
   this.category,
   this.priceStatus,
   this.publisher,
   this.published,
});

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.only(right: 10, top: height*.08),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Image.network(
                    image == null ? 'https://as2.ftcdn.net/jpg/02/25/53/45/500_F_225534502_aLk2Qu5EM1A6Jfy91mBqgeV45APDJOHj.jpg' : image,
                    width: width * .27,
                    height: height * .22,
                    fit: BoxFit.cover,
                  ),

                  SizedBox(
                    height: height * .01,
                  ),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        child: Text(
                          category == null || category == '' ? 'Not Available' : Utils.trimString(category, 10),
                        ),
                      ),

                      SizedBox(height: height * .01,),

                      Container(
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(3)),
                        ),
                        child: Text(priceStatus == null || priceStatus == '' ? 'Free' : 'Rs. $priceStatus'),
                      ),

                ],
              ),
              SizedBox(width: width * .025,),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title == null ? 'No Title Available' : Utils.trimString(title, 40),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 6,),
                    Text(author == null ? 'Author not Available' : Utils.trimString(author, 20),
                      style: TextStyle(
                        color: Colors.yellow,
                        fontSize: 15,
                        letterSpacing: 1,
                      ),
                    ),
                    Divider(
                      height: 12,
                      color: Colors.white70,
                    ),

                    Text(subtitle == null ? 'No Subtitle' : Utils.trimString(subtitle, 75),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    Divider(
                      height: 14,
                      color: Colors.white70,
                    ),

                    SizedBox(
                      height: 11,
                    ),
                        Container(
                          height: height * .05,
                          width: width *.4,
                          child: RatingBar.builder(
                            initialRating: double.parse(rating),
                            minRating: 1,
                            unratedColor: Colors.white,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 20,
                            itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                            },
                          )
                        ),
                      ],
                    ),
                ),

            ],
          ),

        ],
      ),
    );
  }
}
