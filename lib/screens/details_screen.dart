import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_junction/widgets/detail_children/bottom.dart';
import 'package:movie_junction/widgets/detail_children/middle.dart';
import 'package:movie_junction/widgets/detail_children/top.dart';
import 'package:movie_junction/widgets/grid_model.dart';

class DetailsScreen extends StatelessWidget {


  static const routeName = '/details-screen';

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    final GridModel args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color.fromRGBO(255, 207, 207, .1),
        child: Column(
          children: [
            Container(
              width: width * 1,
              height: height * .41,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0,0,0,.4),
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(200)),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(200)),
                    child: Image(
                      height: height * .41,
                      image: AssetImage('assets/detailbg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Top(
                    image: args.image,
                    subtitle: args.subtitle,
                    title: args.bookName,
                    author: args.authorName == null ? '' : args.authorName.toString(),
                    category: args.subject == null ? '' : args.subject.toString(),
                    priceStatus: args.amount,
                    rating: args.rating == '---' ? "0.0" : args.rating,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                  child: Middle(
                      args.description,
                      args.publisher,
                      args.published,
                    args.pages.toString(),
                  ),
              ),
            ),
            Container(
              width: width * 1,
              height: height * .1,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0,0,0,.4),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(200)),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(200)),
                    child: Image(
                      height: height *.1,
                      width: width * 1,
                      image: AssetImage('assets/downbg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Bottom(
                    previewLink: args.previewLink,
                    shopLink: args.buyLink,
                    id: args.id,
                    name: args.bookName,
                    image: args.image,
                    author: args.authorName,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
