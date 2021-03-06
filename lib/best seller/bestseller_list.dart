import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_junction/models/utils.dart';
import 'package:url_launcher/url_launcher.dart';

class BestsellerList extends StatelessWidget {

  final String bookImage;
  final String bookTitle;
  final String bookAuthor;
  final int bookRank;
  final String description;
  final String publisher;
  final String buyLink;

  BestsellerList({
    this.bookImage,
    this.bookTitle,
    this.bookAuthor,
    this.bookRank,
    this.description,
    this.publisher,
    this.buyLink,
  });

  @override
  Widget build(BuildContext context) {

    _launchURLBuy() async {
      if (await canLaunch(buyLink)) {
        await launch(buyLink);
      } else {
        throw 'Could not launch $buyLink';
      }
    }

    return GestureDetector(
      onTap: () {
        showBottomSheet(
          elevation: 2,
          context: context,
          builder: (context) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(52),
                topRight: Radius.circular(52),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 25),
            height: MediaQuery.of(context).size.height * .55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(52),
                          topRight: Radius.circular(52),
                          bottomLeft: Radius.elliptical(70, 185),
                          bottomRight: Radius.elliptical(70, 185),
                        ),
                        child: Image.asset('assets/detailbg.png')
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.network(
                              bookImage,
                              width: 100,
                              height: 150,
                            ),
                          ),
                          SizedBox(width: 25,),
                          Flexible(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  bookTitle,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  Utils.trimString(bookAuthor, 35),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.yellow,
                                    letterSpacing: .8,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 1,
                      right: 0,
                      left: 0,
                      child: Container(
                        child: Text(
                          'Rank: #$bookRank',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            decoration: TextDecoration.overline,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      children: [
                        Text('DESCRIPTION',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 12,
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        SizedBox(height: 10,),
                        Expanded(
                          child: Text(
                              description == null ? 'No description' : Utils.trimString(description, 400),
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                              ),
                            ),
                        ),
                      ],
                    )
                  ),
                ),
                Divider(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Text('Publisher :',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            publisher == null ? 'No Publisher' : Utils.trimString(publisher, 22),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: _launchURLBuy,
                      child: Image(image: AssetImage('assets/Amazon_icon.png'),
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
              ],
            )
          ),
        );
      },
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 5,),
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Image.network(
                        bookImage,
                        height: 110,
                        width: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 17,),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            bookTitle,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text(
                            bookAuthor,
                            style: TextStyle(
                              color: Colors.red[300],
                              fontSize: 10,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    )
                  ),
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                  child: Text(
                    '#$bookRank',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}
