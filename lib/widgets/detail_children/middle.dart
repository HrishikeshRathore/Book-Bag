import 'package:flutter/material.dart';
import 'package:movie_junction/models/utils.dart';

class Middle extends StatelessWidget {

  final String description;
  final String publisher;
  final String published;
  final String pages;

  Middle(this.description, this.publisher, this.published ,this.pages);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5),
        Text(
          'DESCRIPTION',
          style: TextStyle(
            color: Colors.red,
            fontSize: 15,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        Divider(),
        Expanded(child: Container(
          width: MediaQuery.of(context).size.width * .8,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Text(
              description == null || description == '' ? 'No Description Available for this Book.' : description,
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.red[300],
                fontSize: 12,
                letterSpacing: 2,
              ),
            ),
          ),
        ),
        ),
        Divider(),
        SizedBox(height: 5),
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height * .08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('Publisher',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Flexible(
                    child: Text(
                      publisher == null || publisher == ''? '___' : Utils.trimString(publisher, 10),
                      style: TextStyle(
                        color: Colors.red[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              VerticalDivider(),
              Column(
                children: [
                  Text('No. of Pages',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    pages == null || pages == 'null'? '___' : pages,
                    style: TextStyle(
                      color: Colors.red[300],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              VerticalDivider(),
              Column(
                children: [
                  Text('Published',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Flexible(
                    child: Text(
                      published == null || published == ''? '___' : published,
                      style: TextStyle(
                        color: Colors.red[300],
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
